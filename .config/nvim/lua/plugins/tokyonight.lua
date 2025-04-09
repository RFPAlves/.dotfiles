return
{
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      local theme = require("tokyonight")
      local theme_util = require("tokyonight.util")

      local function on_colors(colors)
        colors.bg_statusline = theme_util.darken(colors.bg_dark, 0.5)
        return nil
      end

      local function on_highlights(highlight, colors)
        highlight.String = {fg = colors.green2}
        highlight.TelescopeNormal = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.TelescopeBorder = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.NvimTreeNormal = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.NvimTreeNormalNC = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.NvimTreeWinSeparator = {bg = colors.bg_statusline, fg = colors.bg_dark}
        highlight.FloatBorder = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.ColorColumn = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.Pmenu = {bg = colors.bg_statusline, fg = colors.fg_dark}
        highlight.NonText = {fg = theme_util.lighten(colors.bg, 0.9)}
        return nil
      end

      theme.setup({
        style = "night",
        styles = {
          comments = {italic = true},
          floats = "dark",
          functions = {},
          keywords = {italic = true},
          sidebars = "dark",
          variables = {}
        },
        on_colors = on_colors,
        on_highlights = on_highlights,
        terminal_colors = true
      })

      return vim.cmd("colorscheme tokyonight")
    end,
    lazy = false
  }
}
