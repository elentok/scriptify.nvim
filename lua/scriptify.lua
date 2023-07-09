local M = {}

---@type {hashtags: { [string]: string|string[] } }
local config = {
  hashtags = {
    python = "#!/usr/bin/env python3",
    ruby = "#!/usr/bin/env ruby",
    bash = { "#!/usr/bin/env bash", "", "set -euo pipefail" },
    node = "#!/usr/bin/env node",
    tsnode = "#!/usr/bin/env -S ts-node --swc",
  }
}

---@param lang string
---@return nil|string[]
local function hashtag_lines(lang)
  local hashtag = config.hashtags[lang]
  if hashtag == nil then
    return nil
  end

  if type(hashtag) == "string" then
    return vim.split(hashtag, "\n")
  end

  return hashtag
end

function M.scriptify(lang)
  local header_lines = hashtag_lines(lang)
  if header_lines == nil then
    print("Unknown hashtag for language '" .. lang .. "'")
    return
  end

  table.insert(header_lines, "")

  vim.api.nvim_buf_set_lines(0, 0, 0, true, header_lines)
  vim.cmd("write")
  vim.fn.system("chmod u+x " .. vim.fn.shellescape(vim.fn.expand("%")))
  vim.cmd("e!")
end

function M.open()
  vim.ui.select(vim.tbl_keys(config.hashtags), {
    prompt = "Select hashtag:",
  }, function(choice)
    if choice ~= nil then
      M.scriptify(choice)
    end
  end)
end

---@param opts { hashtags?: { [string]: string|string[] } }
function M.setup(opts)
  vim.tbl_deep_extend("force", config, opts or {})

  vim.api.nvim_create_user_command("Scriptify", M.open, {})
end

return M
