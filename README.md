# Scriptify.nvim

Creates scripts files by adding shebang and making them executable.

<img width="832" alt="image" src="https://github.com/elentok/scriptify.nvim/assets/1129276/0eb81e1b-e64c-4342-a6f9-539817c881cb">

## Usage

Run `:Scriptify`

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
