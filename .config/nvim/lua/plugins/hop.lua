return {
  {
    "smoka7/hop.nvim",
    config = function()
      require("hop").setup()
    end,
    init = function()
      vim.keymap.set("n", "<localleader>hl", ":HopLine<CR>", { noremap = true })
      vim.keymap.set("n", "<localleader>hw", ":HopWord<CR>", { noremap = true })
    end
  }
}
