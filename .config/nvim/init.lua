require("configs.lazy")

vim.keymap.set({ 'n' }, '<C-s>', ':w<CR>')
vim.keymap.set({ 'i' }, '<C-s>', '<C-o>:w<CR>')
vim.keymap.set({ 'n' }, '<localleader>q', ':q<CR>')
vim.keymap.set({ 'n' }, '<localleader>Q', ':qa<CR>')

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

function cleanNamespace()
  local file = "file://" .. vim.fn.expand('%:p')
  local line = vim.fn.line('.') - 1
  local column = vim.fn.col('.') - 1
  local params = {
    command = "clean-ns",
    arguments = {file, line, column}
  }

  vim.lsp.buf.execute_command(params)
end

vim.api.nvim_create_user_command("CleanNS", function()
  cleanNamespace()
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.clj",
  callback = function()
    -- Format code before saving
    vim.lsp.buf.format()
  end,
})
