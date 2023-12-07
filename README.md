# My personal [Neovim](https://github.com/neovim/neovim) Config (work in progress)

## Plugins

- ### Installed and ready to use

  - [nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation)
  - [dressing.nvim](https://github.com/stevearc/dressing.nvim)
  - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (and others that work together)
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - [mason.nvim](https://github.com/williamboman/mason.nvim)
  - [none-ls](https://github.com/nvimtools/none-ls.nvim)
  - [mini.nvim](https://github.com/echasnovski/mini.nvim)
  - [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - [Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [conform.nvim](https://github.com/stevearc/conform.nvim)
  - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - [leap.nvim](https://github.com/ggandor/leap.nvim)
  - [oil.nvim](https://github.com/stevearc/oil.nvim)

- ### Installed but missing configuration

  - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
  - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
  - [trouble.nvim](https://github.com/folke/trouble.nvim)
  - [harpoon](https://github.com/ThePrimeagen/harpoon)
  - [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)
  - [vim.fugitive](https://github.com/tpope/vim-fugitive)

- ### Theme
  - [catppucin.nvim](https://github.com/catppuccin/nvim)

## Keymaps

### Global

| Mode | Keymap     | Output                                    |
| ---- | ---------- | ----------------------------------------- |
| n    | leader-pv  | Neovim file explorer                      |
| v    | K          | Drag line up                              |
| v    | J          | Drag line down                            |
| n    | J          | Drag next line to the end of current line |
| n    | leader-w   | Save file                                 |
| v    | >          | Drag selected line to the right           |
| v    | <          | Drag selected line to the left            |
| n    | leader-e   | Toggle file tree                          |
| i    | jk         | Return to normal mode                     |
| i    | C-c        | Return to normal mode                     |
| n    | leader-x   | chmod +x current file                     |
| n    | leader-s   | Rename, using vim                         |
| n    | C-Space    | Open vim command line                     |
| n    | leader-0   | Close current buffer (:q!)                |
| n    | leader-vpp | Edit the plugins file from anywhere       |

### [Oil.nvim](https://github.com/stevearc/oil.nvim) (only in oil window)

| Keymap    | Output                     |
| --------- | -------------------------- |
| ?         | Show help                  |
| leader-v  | Open in vertical split     |
| leader-s  | Open in horzontal split    |
| leader-t  | Open in new tab            |
| leader-fs | Find string (live grep)    |
| leader-f. | Find text in current file  |
| leader-km | Find keymaps               |
| C-k       | Navigate up in selection   |
| C-j       | Navigate down in selection |

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

| Mode | Keymap        | Output                              |
| ---- | ------------- | ----------------------------------- |
| n    | leader-leader | Find Files                          |
| n    | leader-fo     | Find last files                     |
| n    | leader-fp     | Find project files (git repository) |
| n    | leader-fb     | Find buffers                        |
| n    | leader-fs     | Find string (live grep)             |
| n    | leader-f.     | Find text in current file           |
| n    | leader-km     | Find keymaps                        |
| i    | C-k           | Navigate up in selection            |
| i    | C-j           | Navigate down in selection          |

### Word completion (only insert mode)

| Keymap  | Output                               |
| ------- | ------------------------------------ |
| C-Space | Trigger word suggestion              |
| C-b     | Scroll suggestion documentation up   |
| C-f     | Scroll suggestion documentation down |
| C-e     | Cancel                               |
| Tab     | Next suggestion                      |
| S-Tab   | Previous suggestion                  |
| Enter   | Accept selected suggestion           |

### LSP

| Mode | Keymap    | Output                                          |
| ---- | --------- | ----------------------------------------------- |
| n    | gR        | Telescope references and definition             |
| n    | gd        | Go to declaration                               |
| n    | gD        | Go to definition                                |
| n    | gi        | Show LSP implementations                        |
| n    | gt        | Go to type definitions                          |
| n    | leader-ca | See available code actions                      |
| n    | leader-rn | Smart rename in buffer                          |
| n    | leader-fd | Show file diagnostics                           |
| n    | leader-d  | Show diagnostics for current line               |
| n    | K         | Show documentation for what is under the cursor |

### To-do

- [ ] Startup custom screen
- [x] Keybinds to split panes
- [ ] Git shortcuts inside neovim
- [ ] Set up [bufferline](https://github.com/akinsho/bufferline.nvim)
- [ ] Plugin to rename variable in the entire project
- [ ] Configure language servers for [LspConfig](https://github.com/neovim/nvim-lspconfig)
- [ ] [Neodev](https://github.com/folke/neodev.nvim) plugin

| Checkbox | Keymap    | Output         |
| -------- | --------- | -------------- |
| &#9744;  | leader-fu | Telescope Undo |

<!--     | - [ ]     | Item2.2        | Item3.2 |
| - [ ]    | Item2.3   | Item3.3        |

&#9744; = unchecked
&#9745; = checked
-->
