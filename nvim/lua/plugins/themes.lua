return {
    {
        "rafi/awesome-vim-colorschemes",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "tender"
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            config = function()
                require("lualine").setup()
                options = { theme = "auto" }
            end
        },
    }
}
