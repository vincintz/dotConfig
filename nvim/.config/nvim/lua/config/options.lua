local g = vim.g
local o = vim.opt

-- leader key
g.mapleader = " "
g.maplocalleader = " "

-- line numbers
o.number = true
o.relativenumber = true

-- line settings
o.smartindent = true
o.wrap = false
o.signcolumn = "yes"
o.colorcolumn = "120"

-- os integration
o.clipboard = "unnamedplus"
o.termguicolors = true

-- when scrolling leave 10 rows/cols
o.scrolloff = 10
o.sidescrolloff = 10

-- search options
o.incsearch = true
o.smartcase = true
o.ignorecase = true
o.hlsearch = false

-- split options
o.splitbelow = true
o.splitright = true
o.diffopt:append {"vertical"}

-- tab settings
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.softtabstop = 2

-- show invisible characters
o.list = true
o.listchars = {
  tab = ">-",
  trail = ".",
  precedes = "<",
}

-- disable backup
o.backup = false
o.writebackup = false
o.swapfile = false

-- enhanced undo
o.undofile = true
o.undodir = vim.fn.expand("~/.vim/undodir")

-- refresh file content
o.autoread = true
o.autowrite = false

-- ignore patterns when expanding files
o.wildignore:append {
  "**/.git/**",
  "**/node_modules/**",
  "**/dist/**", 
  "**/dist-staging/**"
}

-- fix checkhealth warnings
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
