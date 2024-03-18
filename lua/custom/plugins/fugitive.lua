return {
  'tpope/vim-fugitive',
  keys = { -- load the plugin only when using it's keybinding:
    -- { '<leader>gs', 'vim.cmd.Git' },
    { '<leader>gB', ':Git blame<CR>', { desc = '[g]it [B]lame', silent = true, noremap = true } },
  },
  config = function()
    -- vim.keymap.set('n', '<leader>gB', ':Git blame<CR>', { desc = '[g]it [B]lame', silent = true, noremap = true })
  end,
}
