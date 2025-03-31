return
{
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.clojure_lsp.setup({
        cmd = { "clojure-lsp" },
        filetypes = { "clojure", "clojurescript", "clojurec" },
        root_dir = lspconfig.util.root_pattern("project.clj", "deps.edn", ".git", "bb.edn"),
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<localleader>k', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<localleader>dg', vim.diagnostic.setloclist, opts)
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      })
    end
  }
}
