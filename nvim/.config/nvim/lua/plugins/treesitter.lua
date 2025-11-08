return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require"nvim-treesitter".install {
        "bash",
        "go",
        "html",
        "javascript",
        "lua",
        "python",
        "tsx",
        "typescript",
      }
    end,
  },
}
