return
{
  {
    "preservim/nerdtree",
    config = function()
      vim.keymap.set({ 'n' }, '<localleader>e', ':NERDTreeToggle<CR>')
    end
  }
}
