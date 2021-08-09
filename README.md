# telescope-makefile
Simple telescope extension to run GNU Make targets in neovim.

Only tested on GNU/Linux.

## Install
For LunarVim, in your config.lua:
```lua
lvim.plugins = {
  ...,
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

