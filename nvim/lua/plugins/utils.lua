return {
    "christoomey/vim-tmux-navigator",
    "diepm/vim-rest-console",
    "editorconfig/editorconfig-vim",
    "mechatroner/rainbow_csv",
    "tpope/vim-commentary",
    "vimwiki/vimwiki",
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Documents", "~/Downloads", "/"},
            }
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        "hedyhli/outline.nvim",
        config = function()
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
            require("outline").setup {
            }
        end,
    },
}
