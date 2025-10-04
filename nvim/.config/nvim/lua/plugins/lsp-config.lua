return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- vim.lsp.enable("pyright")
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("luarocks")
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "html",
          "basedpyright",
        },
        automatic_installation = true,
      })
    end
  },
}
