return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable {
        "basedpyright",
        "jdtls",
        "lua_ls",
        "ts_ls",
      }
    end,
  },
}
