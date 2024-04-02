return {
  'christoomey/vim-tmux-navigator',
  config = function()
    vim.keymap.set('n', '<c-h>', ':TmuxNavigateLeft<cr>', { desc = 'Tmux focus to the left window' })
    vim.keymap.set('n', '<c-j>', ':TmuxNavigateDown<cr>')
    vim.keymap.set('n', '<c-k>', ':TmuxNavigateUp<cr>')
    vim.keymap.set('n', '<c-l>', ':TmuxNavigateLeft<cr>')
  end,
}
