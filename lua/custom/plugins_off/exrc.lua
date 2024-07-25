return {
  'MunifTanjim/exrc.nvim',
  config = function()
    -- disable built-in local config file support
    vim.o.exrc = false

    require('exrc').setup {
      files = {
        '.nvim.lua',
        '.nvimrc.lua',
        '.nvimrc',
        '.exrc.lua',
        '.exrc',
      },
    }
  end,
}
