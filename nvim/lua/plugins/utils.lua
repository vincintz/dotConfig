vim.g.user_emmet_leader_key = "<C-m>"

return {
    "christoomey/vim-tmux-navigator",
    "diepm/vim-rest-console",
    "editorconfig/editorconfig-vim",
    "mechatroner/rainbow_csv",
    "tpope/vim-commentary",
    "vimwiki/vimwiki",
    "AndrewRadev/tagalong.vim",
    "mattn/emmet-vim",
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Documents", "~/Downloads", "/"},
            }
            vim.keymap.set("n", "<leader>s", require("auto-session.session-lens").search_session, {
                noremap = true,
            })
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
            require("outline").setup {}
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.keymap.set("n", "<leader>p", "<cmd>Barbecue toggle<CR>", { desc = "Toggle Breadcrumbs" })
            require("barbecue").setup {}
        end,
    },
    {
        "sontungexpt/url-open",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
        config = function()
            local status_ok, url_open = pcall(require, "url-open")
            if not status_ok then
                return
            end
            url_open.setup ({})
            vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")
        end,
    },
}
