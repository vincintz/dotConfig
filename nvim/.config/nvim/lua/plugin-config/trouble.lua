-- Trouble diagnostics (lazy-loaded)
local function setup_trouble()
  vim.cmd.packadd("trouble.nvim")
  require("trouble").setup()
  vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: Toggle" })
end

-- Load on first use
vim.keymap.set("n", "<leader>xx", function()
  setup_trouble()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<leader>xx", true, true, true))
end, { desc = "Trouble: Toggle" })
