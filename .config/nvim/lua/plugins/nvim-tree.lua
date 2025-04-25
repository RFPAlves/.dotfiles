return {
  {
    "nvim-tree/nvim-tree.lua",
    branch = "master",
    config = function()
      require("nvim-tree").setup({
        on_attach = on_attach,
        sort_by = "case_sensitive",

        view = {
          adaptive_size = true
        },

        renderer = {
          group_empty = true,

          indent_markers = {
            enable = false,
          },

          icons = {
            git_placement = "after",
            webdev_colors = false,

            glyphs = {
              bookmark = "\239\145\186",
              folder = {
                default = "\239\132\148",
                open = "\239\132\149",
              },
            },
          },
        },

        filters = {
          custom = { "^\\.git$" },
        }
      })
    end,
    init = function()
      vim.keymap.set("n", "<localleader>tt", ":NvimTreeToggle<CR>", {noremap = true})
      vim.keymap.set("n", "<localleader>tf", ":NvimTreeFocus<CR>", {noremap = true})
      vim.keymap.set("n", "<localleader>tc", ":NvimTreeCollapse<CR>", {noremap = true})
      return vim.keymap.set("n", "<localleader>tr", ":NvimTreeFindFile<CR>", {noremap = true})    
    end
  }
}
