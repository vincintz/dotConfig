return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Toggle Trouble" })
            vim.keymap.set("n", "<leader>s", "<cmd>Trouble symbols toggle focus=true<cr>", { desc = "Toggle Trouble" })
            require("trouble").setup {
            }
        end,
    }
}
