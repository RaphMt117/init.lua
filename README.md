# My personal Neovim Config (work in progress)




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


### Telescope 

| Mode | Keymap   | Action    |
| ---- |--------------- | --------------- |
| n    | leader-leader   | Find Files   |
| n    | leader-fo   | Find last files   |
| n    | leader-fp   |  Find project files (git repository)    |
| n    | leader-fb   |  Find buffers    |
| n    | leader-fs   |  Find string (live grep)    |
| n    | leader-f.   |  Find text in current file    |
| n    | leader-km   |  Find keymaps    |


### To-do 

    - Startup custom screen
    - Toggletem terminal 
    - Keybinds to split panes
    - Git shortcuts inside neovim

| Checkbox    | Keymap     | Action            |
|------------ | ---------- | ----------------- |
| &#9744;     | leader-fu  | Telescope Undo    |
<!-- | - [ ]    | Item2.2    | Item3.2    | 
| - [ ]    | Item2.3    | Item3.3    | 

&#9744; = unchecked
&#9745; = checked

-->

