local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
nvimtree.setup({
  -- disable window_picker
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
