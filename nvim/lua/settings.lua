-- settings
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

-- keymaps for common mistyped commands
vim.cmd [[
    command! Q q
    command! Qa qa
    command! W w
    command! Wq wq
]]

-- external linters
vim.keymap.set('n', 'lp', "<cmd>compiler pylint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lP', "<cmd>compiler pylint<cr><cmd>make $(git diff --name-only '**/*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lu', "<cmd>set makeprg=ruff<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lU', "<cmd>set makeprg=ruff<cr><cmd>make $(git ls-files '*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lj', "<cmd>compiler eslint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'lJ', "<cmd>compiler eslint<cr><cmd>make $(git ls-files '*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'ls', "<cmd>compiler shellcheck<cr><cmd>make %<cr><cmd>copen<cr>")
