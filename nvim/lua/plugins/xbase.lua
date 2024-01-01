return {
  "xbase-lab/xbase",
  build = "make install",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require'xbase'.setup({})
  end,
}
