local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end

toggleterm.setup({
  size = 25,
  open_mapping = [[<C-\>]],
  direction = "horizontal",
  close_on_exit = true,
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- -------------------------------------
-- Custom Terminals
-- -------------------------------------
local Terminal  = require('toggleterm.terminal').Terminal
local opts = {noremap = true, silent = true}

-- htop
local htop = Terminal:new({ cmd = "htop", direction = "float", hidden = true, close_on_exit = true })
function _htop_toggle()
  htop:toggle()
end
vim.api.nvim_set_keymap("n", "<C-t>h", "<cmd>lua _htop_toggle()<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-t>h", "<cmd>lua _htop_toggle()<CR>", opts)

-- node
local node = Terminal:new({ cmd = "node", hidden = true, close_on_exit = true })
function _node_toggle()
  node:toggle()
end
vim.api.nvim_set_keymap("n", "<C-t>n", "<cmd>lua _node_toggle()<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-t>n", "<cmd>lua _node_toggle()<CR>", opts)

-- python
local python = Terminal:new({ cmd = "python3", hidden = true, close_on_exit = true })
function _python_toggle()
  python:toggle()
end
vim.api.nvim_set_keymap("n", "<C-t>p", "<cmd>lua _node_toggle()<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-t>p", "<cmd>lua _node_toggle()<CR>", opts)
