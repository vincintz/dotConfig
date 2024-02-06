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
                    "pyright",
                    "lua_ls",
                    "tsserver",
                    "html",
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
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilites = capabilities,
            })
            lspconfig.html.setup({
                capabilites = capabilities,
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
            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

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
        end
    },
}
