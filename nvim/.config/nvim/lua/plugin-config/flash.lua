-- Flash.nvim setup (lazy-loaded on first use)
local function setup_flash()
  vim.cmd.packadd("flash.nvim")
  require("flash").setup()
end

-- Lazy-load Flash on keymaps
vim.keymap.set({ "n", "x", "o" }, "s", function()
  setup_flash()
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  setup_flash()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
