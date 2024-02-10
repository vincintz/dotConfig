-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- system integration settings
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"


-- when scrolling, leave 10 rows
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- line settings
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.colorcolumn = "120"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- search options
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- split options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- show invisible characters
vim.opt.list = true
vim.opt.listchars = {
    tab = '>-',
    trail = '.',
    precedes = '<',
}

-- keymaps for common mistyped commands
vim.cmd [[
    command! Q q
    command! Qa qa
    command! W w!
    command! Wq wq
]]

-- external linters
vim.keymap.set('n', 'Lp', "<cmd>compiler pylint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'LP', "<cmd>compiler pylint<cr><cmd>make $(git diff --name-only '**/*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'Lu', "<cmd>set makeprg=ruff<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'LU', "<cmd>set makeprg=ruff<cr><cmd>make $(git diff --name-only '**/*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'Lj', "<cmd>compiler eslint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'LJ', "<cmd>compiler eslint<cr><cmd>make $(git ls-files '*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'Ls', "<cmd>compiler shellcheck<cr><cmd>make %<cr><cmd>copen<cr>")

-- buffer navigation
vim.keymap.set('n', 'K', "<cmd>bprevious<cr>")
vim.keymap.set('n', 'J', "<cmd>bnext<cr>")
vim.keymap.set('n', 'X', "<cmd>bdelete<cr>")
