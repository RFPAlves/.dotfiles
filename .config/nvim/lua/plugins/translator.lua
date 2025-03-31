return {
  {
    "voldikss/vim-translator",
    config = function()
      vim.api.nvim_set_var("translator_target_lang", "pt")
      vim.api.nvim_set_var("translator_source_lang", "auto")
      vim.api.nvim_set_var("translator_default_engines", {"google"})
      vim.api.nvim_set_var("translator_window_type", "preview")

      vim.keymap.set({ 'v' }, '<localleader>t', ':TranslateW<CR>')
    end
  }
}
