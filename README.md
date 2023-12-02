# My personal Neovim Config (still a work in progress)


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

| Keymap   | Action    |
|--------------- | --------------- |
| leader-leader   | Find Files   |
| leader-fo   | Find last files   |
| leader-fp   |  Find project files (git repository)    |
| leader-fb   |  Find buffers    |
| leader-fs   |  Find string (live grep)    |
| leader-f.   |  Find text in current file    |
| leader-km   |  Find keymaps    |


### To-do 

| Check    | Keymap    | Action    |
|---------------- | --------------- | --------------- |
| [ ]      | leader-fu  | Telescope Undo    |
# | [ ]    | Item2.2    | Item3.2    |
# | [ ]    | Item2.3    | Item3.3   |

