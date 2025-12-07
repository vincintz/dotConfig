kmap = vim.keymap
command = vim.api.nvim_create_user_command

-- map common mistyped commands
command('W', 'w', { nargs = 0 })
command('Q', 'qa', { nargs = 0 })
command('Wq', 'wq', { nargs = 0 })
command('WQ', 'wq', { nargs = 0 })

-- visual mode mappings
kmap.set('v', '<leader>j', "<cmd>'<,'>!jq<cr>")
kmap.set('v', '<leader>r', '"hy:%s/<C-r>h//gc<left><left><left>')

-- insert mode mappins
kmap.set('i', 'jj', '<esc>')

-- buffer navigation
kmap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
kmap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- split and resize
kmap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
kmap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
kmap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
kmap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
kmap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
kmap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- indenting in visual mode
kmap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
kmap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
