-- Harpoon setup (lazy-loaded on first use)
local function setup_harpoon()
  vim.cmd.packadd("harpoon")
  local harpoon = require("harpoon")
  harpoon:setup()
  
  vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon: Add" })
  vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menu" })
  vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
  vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
  vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
  vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
end

-- Load harpoon on first keymap press
vim.keymap.set("n", "<leader>a", function()
  setup_harpoon()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<leader>a", true, true, true))
end, { desc = "Harpoon: Add" })
