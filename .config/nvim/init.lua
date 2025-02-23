require("configs.lazy")

--local lspconfig = require("lspconfig")
--lspconfig.clojure_lsp.setup{}

vim.keymap.set({ 'n' }, '<C-s>', ':w<CR>')
vim.keymap.set({ 'i' }, '<C-s>', '<C-o>:w<CR>')
vim.keymap.set({ 'n' }, '<localleader>q', ':q<CR>')
vim.keymap.set({ 'n' }, '<localleader>Q', ':qa<CR>')
vim.keymap.set({ 'n' }, '<C-h>', '<C-w><C-h>')

vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true
vim.opt.backspace = '2'
vim.opt.syntax = 'enable'

-- Indentation
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.wrap = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- Searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable backups and swapfiles
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.api.nvim_set_option("clipboard", "unnamed")
