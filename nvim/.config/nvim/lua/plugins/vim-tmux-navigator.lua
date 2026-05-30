return {
  {
    "christoomey/vim-tmux-navigator",
    -- tmux integration only works on Unix; disable on Windows
    enabled = vim.fn.has("win32") == 0,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<c-w><c-h>" },
      { "<c-j>", "<c-w><c-j>" },
      { "<c-k>", "<c-w><c-k>" },
      { "<c-l>", "<c-w><c-l>" },
    },
  },
}
