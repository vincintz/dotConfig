return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', 'Gs', "<cmd>Git<cr><cmd>resize 10<cr>")
      vim.keymap.set('n', 'Gb', "<cmd>Git blame<cr>")
      vim.keymap.set('n', 'Gd', "<cmd>Gdiffsplit<cr><c-w><c-w>")
    end
  },
  "mhinz/vim-signify",
}
