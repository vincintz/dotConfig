return {
  {
    "christoomey/vim-tmux-navigator",
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
