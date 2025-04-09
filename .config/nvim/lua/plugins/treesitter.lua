return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        },
        ensure_installed = {
          "bash",
          "clojure",
          "dockerfile",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "yaml"
        }
      })
    end
  }
}
