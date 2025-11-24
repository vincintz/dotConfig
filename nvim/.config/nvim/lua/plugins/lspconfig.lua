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
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })
    end,
  },
}
