return {
    {
      "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', 'gs', "<cmd>Git<cr><cmd>resize 10<cr>")
            vim.keymap.set('n', 'gd', "<cmd>Gdiffsplit<cr>")
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set('n', 'gb', "<cmd>Git blame<cr>")
        end
    },
}
