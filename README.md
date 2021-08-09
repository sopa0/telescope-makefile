# telescope-makefile
Simple telescope extension to run GNU Make targets in Neovim.

Only tested on GNU/Linux.

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

## Usage
```lua
lua require('telescope').extensions.telescope_makefile.telescope_makefile()
```

Example keybinding in LunarVim and which-key:
```lua
lvim.builtin.which_key.mappings.M = {
  "<cmd>lua require('telescope').extensions.telescope_makefile.telescope_makefile()<cr>",
  "Makefile",
}
```

