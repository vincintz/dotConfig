return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.cmd.colorscheme "kanagawa"
            require("lualine").setup({
                options = { theme = "kanagawa" }
            })
        end
    },
}
