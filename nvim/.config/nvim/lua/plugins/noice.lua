return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 500,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    init = function()
      vim.keymap.set('n', '<leader>n', "<cmd>NoiceDismiss<cr>")
    end,
  },
}
