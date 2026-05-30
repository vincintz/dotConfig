-- Lazy-load telescope on key press
local telescope_loaded = false

local function setup_telescope()
  if telescope_loaded then return end
  telescope_loaded = true
  
  vim.cmd.packadd("telescope.nvim")
  vim.cmd.packadd("telescope-fzf-native.nvim")
  
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
  
  -- Set up keymaps after loading
  vim.keymap.set("n", "fg", "<cmd>Telescope git_files theme=ivy<cr>", { noremap = true })
  vim.keymap.set("n", "fs", "<cmd>Telescope live_grep hidden=true theme=ivy<cr>", { noremap = true })
  vim.keymap.set("n", "fb", "<cmd>Telescope buffers theme=ivy<cr>", { noremap = true })
  vim.keymap.set("n", "ff", "<cmd>Telescope find_files hidden=true theme=ivy<cr>", { noremap = true })
  vim.keymap.set("n", "fh", "<cmd>Telescope harpoon marks theme=ivy<cr>", { noremap = true })
  vim.keymap.set("n", "<f1>", "<cmd>Telescope help_tags theme=ivy<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>q", "<cmd>Telescope quickfix theme=ivy<cr>", { noremap = true })
end

-- Create commands to trigger lazy-load
vim.api.nvim_create_user_command("TelescopeGitFiles", function()
  setup_telescope()
  vim.cmd("Telescope git_files theme=ivy")
end, {})

vim.api.nvim_create_user_command("TelescopeLiveGrep", function()
  setup_telescope()
  vim.cmd("Telescope live_grep hidden=true theme=ivy")
end, {})

vim.api.nvim_create_user_command("TelescopeBuffers", function()
  setup_telescope()
  vim.cmd("Telescope buffers theme=ivy")
end, {})

vim.api.nvim_create_user_command("TelescopeFindFiles", function()
  setup_telescope()
  vim.cmd("Telescope find_files hidden=true theme=ivy")
end, {})

-- Initial keymaps that trigger lazy-load
vim.keymap.set("n", "fg", function()
  setup_telescope()
  vim.cmd("Telescope git_files theme=ivy")
end, { noremap = true })

vim.keymap.set("n", "fs", function()
  setup_telescope()
  vim.cmd("Telescope live_grep hidden=true theme=ivy")
end, { noremap = true })

vim.keymap.set("n", "fb", function()
  setup_telescope()
  vim.cmd("Telescope buffers theme=ivy")
end, { noremap = true })

vim.keymap.set("n", "ff", function()
  setup_telescope()
  vim.cmd("Telescope find_files hidden=true theme=ivy")
end, { noremap = true })

vim.keymap.set("n", "fh", function()
  setup_telescope()
  vim.cmd("Telescope harpoon marks theme=ivy")
end, { noremap = true })

vim.keymap.set("n", "<f1>", function()
  setup_telescope()
  vim.cmd("Telescope help_tags theme=ivy")
end, { noremap = true })

vim.keymap.set("n", "<leader>q", function()
  setup_telescope()
  vim.cmd("Telescope quickfix theme=ivy")
end, { noremap = true })
