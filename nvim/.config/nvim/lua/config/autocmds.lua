local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

-- highlight when yanking
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = autogroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
