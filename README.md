# My personal [Neovim](https://github.com/neovim/neovim) Config (work in progress)

## Plugins

### Installed and ready to use

- [nvim-tmux-navigation]()
- [dressing.nvim]()
- [LuaSnip]()
- [nvim-cmp]() (and others that work together)
- [nvim-lspconfig]()
- [mason.nvim]()
- [none-ls]()
- [mini.nvim]()
- [neo-tree.nvim]()
- [telescope.nvim]()
- [plenary.nvim]()
- [Comment.nvim]()
- [nvim-treesitter]()
- [conform.nvim]()
- [lualine.nvim]()
- [nvim-autopairs]()

### Installed but missing configuration

- [bufferline.nvim]()
- [friendly-snippets]()
- [trouble.nvim]()
- [harpoon]()
- [refactoring.nvim]()
- [vim.fugitive]()
- [vim-fugitive]()

### Theme

- [catppucin.nvim]()


## Keymaps

### Global

| Mode | Keymap   | Output    |
| ---- |--------- | --------- |
|  n   | leader-pv  | Neovim file explorer   |
|  v   | K          | Drag line up |
|  v   | J          | Drag line down |
|  n   | J          | Drag next line to the end of current line |
|  n   | leader-w   | Save file |
|  v   | >          | Drag selected line right |
|  v   | <          | Drag selected line left |
|  n   | leader-e   | Toggle file tree |
|  i   | jk         | Return to normal mode |
|  i   | C-c        | Return to normal mode |
|  n   | leader-x   | chmod +x current file |
|  n   | leader-s   | Rename, using vim |
|  n   | C-Space    | Open vim command line |
|  n   | leader-0   | Close current buffer (:q!) |
|  n   | leader-vpp | Edit the plugins file from anywhere |


### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

| Mode | Keymap         | Action    |
| ---- |--------------- | --------------- |
| n    | leader-leader  | Find Files   |
| n    | leader-fo      | Find last files   |
| n    | leader-fp      |  Find project files (git repository)    |
| n    | leader-fb      |  Find buffers    |
| n    | leader-fs      |  Find string (live grep)    |
| n    | leader-f.      |  Find text in current file    |
| n    | leader-km      |  Find keymaps    |
| i    | C-k            |  Navigate up in selection    |
| i    | C-j            |  Navigate down in selection   |

### Word completion (only insert mode)

| Keymap  | Action    |
|-------- | --------------- |
| C-Space | Trigger word suggestion |
| C-b     | Scroll suggestion documentation up   |
| C-f     | Scroll suggestion documentation down   |
| C-e     | Cancel    |
| Tab     | Next suggestion   |
| S-Tab   | Previous suggestion   |
| Enter   | Accept selected suggestion   |

### LSP

| Mode | Keymap   | Output    |
| ---- |--------- | --------- |
|  n   | gR       | Telescope references and definition   |
|  n   | gd       | Go to declaration |
|  n   | gD       | Go to definition |
|  n   | gi       | Show LSP implementations |
|  n   | gt       | Go to type definitions |
|  n   | leader-ca| See available code actions |
|  n   | leader-rn| Smart rename in buffer |
|  n   | leader-fd| Show file diagnostics |
|  n   | leader-d | Show diagnostics for current line |
|  n   | K        | Show documentation for what is under the cursor |

### To-do 

- [ ] Startup custom screen
- [ ] Toggletem terminal 
- [ ] Keybinds to split panes
- [ ] Git shortcuts inside neovim
- [ ] Set up [bufferline](https://github.com/akinsho/bufferline.nvim)
- [ ] Plugin to rename variable in the entire project 
- [ ] Configure language servers for [LspConfig](https://github.com/neovim/nvim-lspconfig) 
- [ ] Neodev plugin 

| Checkbox    | Keymap     | Action            |
|------------ | ---------- | ----------------- |
| &#9744;     | leader-fu  | Telescope Undo    |
<!-- | - [ ]    | Item2.2    | Item3.2    | 
| - [ ]    | Item2.3    | Item3.3    | 

&#9744; = unchecked
&#9745; = checked

-->

