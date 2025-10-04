-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- system integration settings
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

-- when scrolling, leave 10 rows
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- line settings
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.cursorline = true

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

-- file handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.wildignore:append{'**/.git/**', '**/node_modules/**', '**/dist/**', '**/dist-staging/**'}
vim.opt.diffopt:append{'vertical'}

-- highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
