return {
  {
    "echasnovski/mini.ai",
    version = "*",
    config = function()
      require('mini.ai').setup()
    end,
  },
  {
    "echasnovski/mini.bracketed",
    version = "*",
    config = function()
      require('mini.bracketed').setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    version = "*",
    config = function()
      require('mini.comment').setup()
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        mappings = {
          close = '-',
          go_in = "L",
          go_in_plus = "l",
          reset = ',',
          reveal_cwd = '.',
        },
        windows = {
          preview = true,
        },
      })
      vim.keymap.set("n", "-", function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
        MiniFiles.open(path)
        MiniFiles.reveal_cwd()
      end, { desc = "Open Mini Files" })
    end,
  },
  {
    "echasnovski/mini.notify",
    version = "*",
    config = function()
      require('mini.notify').setup()
    end,
  },
}
