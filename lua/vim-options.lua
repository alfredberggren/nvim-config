vim.cmd("set nu! rnu!")
vim.cmd("set colorcolumn=80")
vim.cmd("highlight ColorColumn ctermbg=237")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Navigating windows
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Navigating buffers
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>')
vim.keymap.set('n', '<C-d>', ':bdelete<CR>')
