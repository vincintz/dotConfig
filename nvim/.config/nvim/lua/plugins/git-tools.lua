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
      require("gitsigns").setup()
    end
  },
}
