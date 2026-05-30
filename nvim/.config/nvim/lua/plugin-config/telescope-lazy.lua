-- Lazy-load telescope on key press
local function setup_telescope()
  if not vim.fn.exists(":Telescope") then
    vim.cmd.packadd("telescope.nvim")
    vim.cmd.packadd("telescope-fzf-native.nvim")
    vim.cmd.packadd("plenary.nvim")
  end
  
  require"telescope".setup {
    defaults = {
      preview = {
        treesitter = false,
      },
    },
    pickers = {
      live_grep = {
        additional_args = function()
          return {"--hidden"}
        end
      },
    },
  }
  
  -- Keymaps
  vim.keymap.set("n", "fg", "<cmd>Telescope git_files theme=ivy<cr>")
  vim.keymap.set("n", "fs", "<cmd>Telescope live_grep hidden=true theme=ivy<cr>")
  vim.keymap.set("n", "fb", "<cmd>Telescope buffers theme=ivy<cr>")
  vim.keymap.set("n", "ff", "<cmd>Telescope find_files hidden=true theme=ivy<cr>")
  vim.keymap.set("n", "fh", "<cmd>Telescope harpoon marks theme=ivy<cr>")
  vim.keymap.set("n", "<f1>", "<cmd>Telescope help_tags theme=ivy<cr>")
  vim.keymap.set("n", "<leader>q", "<cmd>Telescope quickfix theme=ivy<cr>")
end

-- Load on first telescope keymap press
vim.keymap.set("n", "fg", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("fg", true, true, true))
end)
vim.keymap.set("n", "fs", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("fs", true, true, true))
end)
vim.keymap.set("n", "fb", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("fb", true, true, true))
end)
vim.keymap.set("n", "ff", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("ff", true, true, true))
end)
vim.keymap.set("n", "fh", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("fh", true, true, true))
end)
vim.keymap.set("n", "<f1>", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<f1>", true, true, true))
end)
vim.keymap.set("n", "<leader>q", function()
  setup_telescope()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<leader>q", true, true, true))
end)
