# telescope-makefile
Simple telescope extension to run GNU Make targets in Neovim.

*:+1:Supports GNU/BSD make*

Requires the [akinsho/nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua) plugin for now.

## Demonstration
![Demo gif](https://gist.github.com/ptethng/7ac7f9c91a44f015d8fadea373f000d2/raw/fbdfa68fa3b9133884bd6e402898224db620ebb0/box-210809-2336-36.gif)

## Install
For LunarVim, in your config.lua:
```lua
lvim.plugins = {
  {
    "ptethng/telescope-makefile",
  },
}
```

## Installation
```lua
require'telescope'.load_extension('make')
```
## Usage
```vim
:Telescope make
```
## Configuration
Default:
```lua
require'telescope-makefile'.setup{
  -- The path where to search the makefile in the priority order
  makefile_priority = { '.', 'build/' }
  default_target = '[DEFAULT]', -- nil or string : Name of the default target | nil will disable the default_target
}
```

Example keybinding in LunarVim and which-key:
```lua
lvim.builtin.which_key.mappings.M = {
  "<cmd>Telescope make<cr>",
  "Make Targets",
}
```
