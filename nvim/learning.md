## Why I finally had to learn vim
Text editing.
So I had a requirement of making a minor change in many files. A linter would output the file name with line number.
If I do it via vscode, it would take a lot of manual mouse movements.

## Some vim stuff
- `%d` - Delete all
- `b`, `w` - Jump to previous/next word
- `u` - Undo
- `/<pattern> <enter>` - Search. `n` - Next entry
- `:set nu` - Set line number
- `:set number relativenumber` - Set it relatively
- `ctrl + o` - Go back to prev
- `ctrl + i` - Go forward
- `:Ex` - Directory Explorer 
- `"+y` - On visual mode to copy to clipboard
- `cd %:h` - Change to head of current directory
## Nvim stuff
- `:echo stdpath('config')` - Get your config path


### Lazy Nvim
- `:Lazy update` - Update

### Telescope
- `:checkhealth telescope` 
- `<leader>ff` - Find in current directory
- `<leader>fr` - Find recent

### nvim-tree
- `ctrl+n` - Directory view
- `<leader>ee` - Focus on explorer
- `<leader>ef` - Explorer Find

## go plugin
- `K` 
- `gd` - Go to Definition 
- `gr` - Go to references
- `<leader>rn` - Rename

# References
- Options
  - https://neovim.io/doc/user/options/#'clipboard'

# To-do
It could be slow, but keep making progress and keep improving

## Low Efforts

- [ ] L1 - Make line numbers appear by default, with `set :nu`
- [ ] L2 - Find alternative for `bdw` - Deleting word ending at current cursor position 
- [ ] L3 - How to go back to directory window after opening a file with enter 
- [ ] L4 - Figure out how to see usage of a keyword via go lsp

## Medium Efforts
- [ ] M1 - Open recent files by name
- [ ] M2 - Get that plugin which tells your inefficiencies of using vim
- [ ] M3 - Undo tree extension
- [ ] M4 - File tree extension

## High Efforts
- [ ] H1 - Understand 80%+ lines of your nvim config
