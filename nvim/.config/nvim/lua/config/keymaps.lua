-- keymaps for common mistyped commands
vim.cmd [[
    command! Q q
    command! Qa qa
    command! W w!
    command! Wq wq
]]

-- visual mode mappings
vim.keymap.set('v', '<leader>j', "<cmd>'<,'>!jq<cr>")
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//gc<left><left><left>')

-- insert mode mappins
vim.keymap.set('i', 'jj', '<esc>')

-- buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- split and resize
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- external linters
vim.keymap.set('n', 'Lp', "<cmd>compiler pylint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'LP', "<cmd>compiler pylint<cr><cmd>make $(git diff --name-only '**/*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'Lu', "<cmd>set makeprg=ruff<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'LU', "<cmd>set makeprg=ruff<cr><cmd>make $(git diff --name-only '**/*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'Lj', "<cmd>compiler eslint<cr><cmd>make %<cr><cmd>copen<cr>")
vim.keymap.set('n', 'LJ', "<cmd>compiler eslint<cr><cmd>make $(git ls-files '*.py')<cr><cmd>copen<cr>")
vim.keymap.set('n', 'Ls', "<cmd>compiler shellcheck<cr><cmd>make %<cr><cmd>copen<cr>")
