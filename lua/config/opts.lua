vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd.set("relativenumber")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("tabstop=4")
vim.cmd.set("expandtab")

vim.keymap.set('n', '<leader>fs', vim.cmd.Ex)
