-- Alternatively, use `config = function() ... end` for full control over the configuration.
-- If you prefer to call `setup` explicitly, use:
--    {
--        'lewis6991/gitsigns.nvim',
--        config = function()
--            require('gitsigns').setup({
--                -- Your gitsigns configuration here
--            })
--        end,
--    }
--
-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [r]eset hunk' })
        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
  -- on_attach = function(bufnr)
  --   local gs = package.loaded.gitsigns

  --   local function map(mode, l, r, opts)
  --     opts = opts or {}
  --     opts.buffer = bufnr
  --     vim.keymap.set(mode, l, r, opts)
  --   end

  --   -- Navigation
  --   map('n', ']c', function()
  --     if vim.wo.diff then return ']c' end
  --     vim.schedule(function() gs.next_hunk() end)
  --     return '<Ignore>'
  --   end, {expr=true})

  --   map('n', '[c', function()
  --     if vim.wo.diff then return '[c' end
  --     vim.schedule(function() gs.prev_hunk() end)
  --     return '<Ignore>'
  --   end, {expr=true})

  --   -- Actions
  --   map('n', '<leader>hs', gs.stage_hunk)
  --   map('n', '<leader>hr', gs.reset_hunk)
  --   map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
  --   map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
  --   map('n', '<leader>hS', gs.stage_buffer)
  --   map('n', '<leader>hu', gs.undo_stage_hunk)
  --   map('n', '<leader>hR', gs.reset_buffer)
  --   map('n', '<leader>hp', gs.preview_hunk)
  --   map('n', '<leader>hb', function() gs.blame_line{full=true} end)
  --   map('n', '<leader>tb', gs.toggle_current_line_blame)
  --   map('n', '<leader>hd', gs.diffthis)
  --   map('n', '<leader>hD', function() gs.diffthis('~') end)
  --   map('n', '<leader>td', gs.toggle_deleted)

  --   -- Text object
  --   map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  -- end
}
-- vim: ts=2 sts=2 sw=2 et
