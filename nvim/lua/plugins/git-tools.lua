return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', 'gs', "<cmd>Git<cr><cmd>resize 10<cr>")
      vim.keymap.set('n', 'gb', "<cmd>Git blame<cr>")
      -- vim.keymap.set('n', 'gd', "<cmd>Gdiffsplit<cr><c-w><c-w>")
    end
  },
  "mhinz/vim-signify",
}
