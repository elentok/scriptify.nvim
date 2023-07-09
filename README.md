# Scriptify.nvim

Creates scripts files by adding shebang and making them executable.

## Installation

Using [Lazy](https://github.com/folke/lazy.nvim):

```lua
{
  "elentok/scriptify.nvim",
  opts = {},
  cmd = { "Scriptify" }
}
```

This will lazy load it only when you call the `:Scriptify` command.
