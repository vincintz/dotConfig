vim.g.encoding = "utf-8"
vim.g.mapleader = " "
vim.opt.syntax = "ON"

vim.opt.compatible = false

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

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "https://github.com/chr4/nginx.vim",
    "https://github.com/editorconfig/editorconfig-vim",
    "https://github.com/mattn/emmet-vim",
    "https://github.com/mhinz/vim-signify",
    {
        "https://github.com/rafi/awesome-vim-colorschemes",
        config = function()
            vim.cmd.colorscheme "tender"
        end
    },
    "https://github.com/tpope/vim-commentary",
    {
        "https://github.com/tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', 'gs', "<cmd>Git<cr><cmd>resize 10<cr>")
            vim.keymap.set('n', 'gb', "<cmd>Git blame<cr>")
            vim.keymap.set('n', 'gd', "<cmd>Gdiffsplit<cr><c-w><c-w>")
        end
    },
    "https://github.com/tpope/vim-unimpaired",
    "https://github.com/tpope/vim-surround",
    "https://github.com/vim-airline/vim-airline",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/diepm/vim-rest-console",
    "https://github.com/lambdalisue/nerdfont.vim",
    "https://github.com/leafOfTree/vim-vue-plugin",
    "https://github.com/mechatroner/rainbow_csv",
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/vimwiki/vimwiki",

    -- new
    {
        "https://github.com/nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', 'ff', builtin.find_files, {})
            vim.keymap.set('n', 'fs', builtin.live_grep, {})
            vim.keymap.set('n', 'fb', builtin.buffers, {})
            vim.keymap.set('n', 'fh', builtin.help_tags, {})
        end,
    },
    {
        "https://github.com/nvim-tree/nvim-tree.lua",
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
})
