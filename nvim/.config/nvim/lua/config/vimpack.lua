local pack = vim.pack
local kmap = vim.keymap

-- essentials
pack.add({
  'https://github.com/vimwiki/vimwiki',
  'https://github.com/github/copilot.vim',
})

-- navigate
pack.add({
  'https://github.com/mrjones2014/smart-splits.nvim'
})
kmap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
kmap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
kmap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
kmap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
kmap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

-- git
pack.add({
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/lewis6991/gitsigns.nvim',
})
vim.api.nvim_exec([[
  function! ToggleGitStatus()
    echo &l:filetype
    if &l:filetype == 'fugitive'
      close
    else
      Git
      resize 10
    endif
  endfunction

  function! ToggleGitBlame()
    if &l:filetype == 'fugitiveblame'
      close
    else
      G blame
    endif
  endfunction
]], false)
kmap.set('n', '<leader>g', "<cmd>call ToggleGitStatus()<cr>")
kmap.set('n', 'gb', "<cmd>call ToggleGitBlame()<CR>")

require("gitsigns").setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      kmap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)
  end
}
-- telescope
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim'
})
require('telescope').setup({
  defaults = {
    preview = {
      treesitter = false,
    },
  },
  pickers = {
    live_grep = {
      additional_args = function()
        return {"--hidden"}
      end
    },
  },
})
kmap.set('n', 'fg', '<cmd>Telescope git_files theme=ivy<cr>')
kmap.set('n', 'fs', '<cmd>Telescope live_grep hidden=true theme=ivy<cr>')
kmap.set('n', 'fb', '<cmd>Telescope buffers theme=ivy<cr>')
kmap.set('n', 'ff', '<cmd>Telescope find_files hidden=true theme=ivy<cr>')
kmap.set('n', '<f1>', '<cmd>Telescope help_tags theme=ivy<cr>')
kmap.set('n', '<leader>q', '<cmd>Telescope quickfix theme=ivy<cr>')

-- mini
vim.pack.add({
  'https://github.com/nvim-mini/mini.files',
  'https://github.com/nvim-mini/mini.notify',
})
local mn_files = require('mini.files')
local mn_notify = require('mini.notify')
mn_files.setup({
  mappings = {
    close = "-",
    go_in = "L",
    go_in_plus = "l",
    reset = ",",
    reveal_cwd = ".",
  },
  windows = {
    preview = true,
  },
})
kmap.set("n", "-", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  mn_files.open(path)
  mn_files.reveal_cwd()
end, { desc = "Open Mini Files" })

mn_notify.setup()

-- java
pack.add({
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
    version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/mfussenegger/nvim-dap',

  'https://github.com/nvim-java/nvim-java',
})

require('java').setup()
vim.lsp.enable('jdtls')
