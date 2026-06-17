vim.cmd("set nu! rnu!")
vim.cmd("set colorcolumn=80")
vim.cmd("highlight ColorColumn ctermbg=237")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
    end,
})

vim.g.mapleader = " "

-- Navigating windows
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Navigating buffers
vim.keymap.set('n', '<S-Tab>', ':bnext<CR>')
vim.keymap.set('n', '<C-d>', ':bdelete<CR>')
