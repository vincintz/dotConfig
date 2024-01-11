return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
            require("trouble").setup {
            }
        end,
    }
}
