return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("neogit").setup({})
            vim.keymap.set('n', 'gs', "<cmd>Neogit kind=split<cr><cmd>resize 10<cr>")
            vim.keymap.set('n', 'gd', "<cmd>DiffviewOpen<cr>")
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
