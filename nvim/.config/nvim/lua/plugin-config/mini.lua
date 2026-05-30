-- Mini plugins setup
require("mini.ai").setup()
require("mini.bracketed").setup()
require("mini.comment").setup()
require("mini.notify").setup()

-- Mini files setup with keymaps
local MiniFiles = require("mini.files")
MiniFiles.setup({
  mappings = {
    close = "-",
    go_in = "L",
    go_in_plus = "l",
    reset = ",",
    reveal_cwd = ".",
  },
  windows = {
    preview = true,
  },
})

vim.keymap.set("n", "-", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  MiniFiles.open(path)
  MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })
