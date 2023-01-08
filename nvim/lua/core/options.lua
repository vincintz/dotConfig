-- for conciseness
local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false

-- tab key settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- show marker column
opt.colorcolumn = "120"

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- colorscheme
vim.cmd("colorscheme happy_hacking")
