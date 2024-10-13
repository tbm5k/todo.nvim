# todo.nvim

Keep notion aside

## What is todo

As it's name dicates, the plugin is your todo list manager. Renders your todos and fixes
all within your neovim terminal.

It gives you a list containing the line number and comment of the todo or fix

## Getting started
### Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'tbm5k/todo.nvim'
```

## Usage

Using lua

```lua
vim.keymap.set('n', '<Leader>tt', require("todo").findTodos, { desc = "find todos" })
vim.keymap.set('n', '<Leader>tf', require("todo").findFixes, { desc = "find fixes" })
```


