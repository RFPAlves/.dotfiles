require("configs.lazy")

vim.keymap.set({ 'n' }, '<C-s>', ':w<CR>')
vim.keymap.set({ 'i' }, '<C-s>', '<C-o>:w<CR>')
vim.keymap.set({ 'n' }, '<localleader>q', ':q<CR>')
vim.keymap.set({ 'n' }, '<localleader>Q', ':qa<CR>')

vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.wrap = false

-- Searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable temporary backup files
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.expandtab = false
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "clojure",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
    vim.bo.autoindent = true
    vim.bo.smartindent = false
  end
})
