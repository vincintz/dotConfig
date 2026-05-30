vim.pack.add {

  { src = 'https://github.com/vimwiki/vimwiki' },
  -- theme
  { src = 'https://github.com/vague-theme/vague.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  -- nvim-mini
  { src = 'https://github.com/nvim-mini/mini.notify', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.ai', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.bracketed', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.comment', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.files', version = 'stable' },
}

-- theme
vim.cmd.colorscheme 'vague'
require('lualine').setup {
  options = { theme = 'codedark' }
}

-- nvim-mini
require('mini.notify').setup()
require('mini.ai').setup()
require('mini.bracketed').setup()
require('mini.comment').setup()
require('mini.files').setup {
  mappings = {
    close = 'q',
    go_in = 'L',
    go_in_plus = 'l',
    reset = ',',
    reveal_cwd = '.',
  },
  windows = {
    preview = true,
  },
}
