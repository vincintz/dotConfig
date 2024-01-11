return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ensure_installed = { "python", "swift" },
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                enable = true,
                max_lines = 2,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 2,
                trim_scope = "inner",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end
    },
}
