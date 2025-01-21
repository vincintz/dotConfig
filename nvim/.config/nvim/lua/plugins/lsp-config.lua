return {
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
          "pylsp",
        },
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local util = require 'lspconfig.util'
      lspconfig.pyright.setup({
        capabilites = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      })
      lspconfig.ts_ls.setup({
        capabilites = capabilities,
      })
      lspconfig.html.setup({
        capabilites = capabilities,
      })
      lspconfig.eslint.setup({
        root_dir = util.root_pattern(
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json"
        ),
      })
      lspconfig.emmet_language_server.setup({
        filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" }
      })
      lspconfig.lua_ls.setup({
        capabilites = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "jit" },
            },
          },
        },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({name = 'DiagnosticSignError', text = '✘'})
      sign({name = 'DiagnosticSignWarn', text = '▲'})
      sign({name = 'DiagnosticSignHint', text = '⚑'})
      sign({name = 'DiagnosticSignInfo', text = '»'})
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      })
    end,
  },
}
