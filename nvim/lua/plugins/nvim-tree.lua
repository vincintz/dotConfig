return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                update_focused_file = {
                    enable = true,
                },
                filters = { custom = { "^.git$", "__pycache__" } },
            }
            vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<cr>")

            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- workaround to work with sessions
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'NvimTree' },
                callback = function(args)
                    vim.api.nvim_create_autocmd('VimLeavePre', {
                        callback = function()
                            vim.api.nvim_buf_delete(args.buf, { force = true })
                            return true
                        end
                    })
                end,
            })

            vim.api.nvim_create_autocmd({ 'BufEnter' }, {
                pattern = 'NvimTree*',
                callback = function()
                    local view = require('nvim-tree.view')
                    local is_visible = view.is_visible()

                    local api = require('nvim-tree.api')
                    if not is_visible then
                        api.tree.open()
                    end
                end,
            })

        end,
    },
}
