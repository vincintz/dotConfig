return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 500,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    init = function()
      vim.keymap.set('n', '<leader>n', "<cmd>NoiceDismiss<cr>")
    end,
  },
}
