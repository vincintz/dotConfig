return {
    -- old vim
    "christoomey/vim-tmux-navigator",
    "diepm/vim-rest-console",
    "editorconfig/editorconfig-vim",
    "mechatroner/rainbow_csv",
    "mattn/emmet-vim",
    "tpope/vim-commentary",
    "tpope/vim-unimpaired",
    "tpope/vim-surround",
    "tpope/vim-dadbod",
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
}
