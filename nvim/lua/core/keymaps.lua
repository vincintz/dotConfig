local keymap = vim.keymap

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<C-s>s", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<C-s>x", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<C-f1>", "<cmd>Telescope help_tags<cr>") -- list available help tags
