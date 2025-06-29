return {
  {
    "tpope/vim-fugitive",
    config = function()
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

      vim.keymap.set('n', '<leader>g', "<cmd>call ToggleGitStatus()<cr>")
      vim.keymap.set('n', 'gb', "<cmd>call ToggleGitBlame()<CR>")
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
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
    end
  },
}
