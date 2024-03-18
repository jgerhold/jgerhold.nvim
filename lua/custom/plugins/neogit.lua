return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    -- "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    local neogit = require 'neogit'

    neogit.setup {}

    vim.keymap.set('n', '<leader>gs', neogit.open, { desc = 'Neo[g]it [s]tatus', silent = true, noremap = true })
    vim.keymap.set('n', '<leader>go', ':Neogit commit<CR›', { desc = '[g]it c[o]mmit', silent = true, noremap = true })
    vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { desc = '[g]it [p]ull', silent = true, noremap = true })
    vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { desc = '[g]it [P]ush', silent = true, noremap = true })
  end,
}
