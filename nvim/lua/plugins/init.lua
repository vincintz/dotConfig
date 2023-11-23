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
    -- old vim
    "chr4/nginx.vim",
    "christoomey/vim-tmux-navigator",
    "diepm/vim-rest-console",
    "editorconfig/editorconfig-vim",
    "lambdalisue/nerdfont.vim",
    "leafOfTree/vim-vue-plugin",
    "mechatroner/rainbow_csv",
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
    "tpope/vim-dadbod",
    "vimwiki/vimwiki",
    "vim-airline/vim-airline",
    -- nvim plugins
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
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

            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'NvimTree' },
                callback = function(args)
                    vim.api.nvim_create_autocmd('VimLeavePre', {
                        callback = function()
                            vim.api.nvim_buf_delete(args.buf, { force = true })
                            return true
                        end
                    })
                end,
            })

            vim.api.nvim_create_autocmd({ 'BufEnter' }, {
                pattern = 'NvimTree*',
                callback = function()
                    local view = require('nvim-tree.view')
                    local is_visible = view.is_visible()

                    local api = require('nvim-tree.api')
                    if not is_visible then
                        api.tree.open()
                    end
                end,
            })

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
