vim.g.encoding = "utf-8"
vim.g.mapleader = " "
vim.opt.syntax = "ON"

vim.opt.compatible = false
vim.opt.mouse = ""

-- tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- line settings
vim.opt.smartindent = true
vim.opt.wrap = false

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- search options
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- split location
vim.opt.splitbelow = true
vim.opt.splitright = true

-- show invisible characters
vim.opt.list = true
vim.opt.listchars = {
    tab = '>-',
    trail = '.',
    precedes = '<',
}

-- mark long lines
vim.opt.colorcolumn = "120"

vim.opt.ruler = true
vim.opt.scrolloff = 10

vim.keymap.set('n', 'lp', "<cmd>compiler pylint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lP', "<cmd>compiler pylint<cr><cmd>make $(git diff --name-only '**/*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lu', "<cmd>set makeprg=ruff<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lU', "<cmd>set makeprg=ruff<cr><cmd>make $(git ls-files '*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lj', "<cmd>compiler eslint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lJ', "<cmd>compiler eslint<cr><cmd>make $(git ls-files '*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'ls', "<cmd>compiler shellcheck<cr><cmd>make %<cr><cmd>copen<cr>")

vim.cmd [[
    command! Q q
    command! Qa qa
    command! W w
    command! Wq wq
]]

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "chr4/nginx.vim",
    "editorconfig/editorconfig-vim",
    "mattn/emmet-vim",
    "mhinz/vim-signify",
    {
        "rafi/awesome-vim-colorschemes",
        config = function()
            vim.cmd.colorscheme "tender"
        end
    },
    "tpope/vim-commentary",
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', 'gs', "<cmd>Git<cr><cmd>resize 10<cr>")
            vim.keymap.set('n', 'gb', "<cmd>Git blame<cr>")
            vim.keymap.set('n', 'gd', "<cmd>Gdiffsplit<cr><c-w><c-w>")
        end
    },
    "tpope/vim-unimpaired",
    "tpope/vim-surround",
    "vim-airline/vim-airline",
    "christoomey/vim-tmux-navigator",
    "diepm/vim-rest-console",
    "lambdalisue/nerdfont.vim",
    "leafOfTree/vim-vue-plugin",
    "mechatroner/rainbow_csv",
    "tpope/vim-dadbod",
    "vimwiki/vimwiki",
    -- new
    {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            telescope.load_extension("fzf")
            -- keymaps
            vim.keymap.set('n', 'ff', builtin.find_files, {})
            vim.keymap.set('n', 'fg', builtin.git_files, {})
            vim.keymap.set('n', 'fs', builtin.live_grep, {})
            vim.keymap.set('n', 'fb', builtin.buffers, {})
            vim.keymap.set('n', 'fh', builtin.help_tags, {})
            vim.keymap.set('n', 'fc', builtin.grep_string, {})

        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
            vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<cr>")
        end,
    },
    {
        "voldikss/vim-floaterm",
        config = function()
            -- settings
            vim.g.floaterm_width = 0.85
            vim.g.floaterm_height = 0.85
            -- keymaps
            vim.keymap.set('n', '<c-t>', "<cmd>FloatermToggle<cr>")
            vim.keymap.set('n', '<c-\\>', "<cmd>FloatermNew<cr>")
            vim.keymap.set('t', '<c-t>', "<cmd>FloatermToggle<cr>")
            vim.keymap.set('t', '<c-j>', "<cmd>FloatermNext<cr>")
            vim.keymap.set('t', '<c-k>', "<cmd>FloatermPrev<cr>")
            vim.keymap.set('v', '<c-t>', "<cmd>'<,'>FloatermSend<cr><cmd>FloatermToggle<cr>")
        end
    },
    {
        "ojroques/nvim-osc52",
        config = function()
            require('osc52').setup {
                max_length = 0,           -- Maximum length of selection (0 for no limit)
                silent = false,           -- Disable message on successful copy
                trim = false,             -- Trim surrounding whitespaces before copy
                tmux_passthrough = true,  -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
            }
            vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
            vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
            vim.keymap.set('v', '<c-c>', require('osc52').copy_visual)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
            mason_lspconfig.setup({
                ensure_installed = {
                    "pyright",
                },
                automatic_installation = true,
            })

        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({
            })
        end
    },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Documents", "~/Downloads", "/"},
            }
        end
    },
})
