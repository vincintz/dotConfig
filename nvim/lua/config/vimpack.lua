local pack = vim.pack
local kmap = vim.keymap

-- essentials
pack.add({
  'https://github.com/vimwiki/vimwiki',
})

-- navigate
pack.add({
  'https://github.com/mrjones2014/smart-splits.nvim'
})
kmap.set('n', '<A-h>', require('smart-splits').resize_left)
kmap.set('n', '<A-j>', require('smart-splits').resize_down)
kmap.set('n', '<A-k>', require('smart-splits').resize_up)
kmap.set('n', '<A-l>', require('smart-splits').resize_right)
kmap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
kmap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
kmap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
kmap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
kmap.set('n', '<C-\\>', '<cmd>wincmd p<cr>')


-- git
pack.add({
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/github/copilot.vim',
  'https://github.com/ducks/vimdeck.nvim',
})
vim.api.nvim_exec([[
  function! ToggleGitStatus()
    echo &l:filetype
    if &l:filetype == 'fugitive'
      close
    else
      Git
      resize 10
    endif
  endfunction

  function! ToggleGitBlame()
    if &l:filetype == 'fugitiveblame'
      close
    else
      G blame
    endif
  endfunction
]], false)
kmap.set('n', '<leader>gg', "<cmd>call ToggleGitStatus()<cr>")
kmap.set('n', '<leader>gb', "<cmd>call ToggleGitBlame()<CR>")

require("gitsigns").setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      kmap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)
  end
}
-- telescope
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/CopilotC-Nvim/CopilotChat.nvim',
})
require('CopilotChat').setup({
  trusted_tools = false,
  window = {
    layout = 'float',
    width = 0.9,
    height = 0.80,
  },
  show_help = false,
})
kmap.set('n', '<leader>1', '<cmd>CopilotChatModels<cr>', { desc = 'Select Copilot Model' })
kmap.set('n', '<leader>2', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle Copilot Chat' })
kmap.set('n', '<leader>3', function()
  require('CopilotChat').ask('/Review', {
    resources = { 'gitdiff:staged', 'gitdiff:unstaged' },
  })
end, { desc = 'Review code changes' })
kmap.set('v', '<leader>zr', function()
  require('CopilotChat').ask('/Review', {
    resources = { 'selection' },
  })
end, { desc = 'Review selection' })
require('telescope').setup({
  defaults = {
    preview = {
      treesitter = false,
    },
  },
  pickers = {
    live_grep = {
      additional_args = function()
        return {"--hidden"}
      end
    },
  },
})
kmap.set('n', 'fg', '<cmd>Telescope git_files theme=ivy<cr>')
kmap.set('n', 'fs', '<cmd>Telescope live_grep hidden=true theme=ivy<cr>')
kmap.set('n', 'fb', '<cmd>Telescope buffers theme=ivy<cr>')
kmap.set('n', 'ff', '<cmd>Telescope find_files hidden=true theme=ivy<cr>')
kmap.set('n', '<f1>', '<cmd>Telescope help_tags theme=ivy<cr>')
kmap.set('n', '<leader>q', '<cmd>Telescope quickfix theme=ivy<cr>')

-- mini
vim.pack.add({
  'https://github.com/nvim-mini/mini.files',
  'https://github.com/nvim-mini/mini.notify',
})
local mn_files = require('mini.files')
local mn_notify = require('mini.notify')
mn_files.setup({
  mappings = {
    close = "-",
    go_in = "L",
    go_in_plus = "l",
    reset = ",",
    reveal_cwd = ".",
  },
  windows = {
    preview = true,
  },
})
kmap.set("n", "-", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  mn_files.open(path)
  mn_files.reveal_cwd()
end, { desc = "Open Mini Files" })

mn_notify.setup()

-- pi-nvim (bridge to pi coding agent)
pack.add({
  'https://github.com/carderne/pi-nvim',
})
require('pi-nvim').setup({
  set_default_keymaps = true,
})

-- java
pack.add({
  'https://github.com/mfussenegger/nvim-jdtls',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, { 'gradlew', 'mvnw', 'pom.xml', 'build.gradle', 'settings.gradle', '.git' })
    if not root_dir then
      return
    end

    require('jdtls').start_or_attach({
      -- workspace keyed by project root, not cwd (the launcher's default)
      cmd = { 'jdtls', '-data', vim.fn.stdpath('cache') .. '/jdtls/' .. vim.fn.sha256(root_dir):sub(1, 16) },
      root_dir = root_dir,
      init_options = { bundles = {} },
      on_attach = function(_, bufnr)
        local map = function(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map('gd', vim.lsp.buf.definition, 'Go to definition')
        map('gD', vim.lsp.buf.declaration, 'Go to declaration')
        map('gr', vim.lsp.buf.references, 'Find references')
        map('gi', vim.lsp.buf.implementation, 'Go to implementation')
        map('gy', vim.lsp.buf.type_definition, 'Go to type definition')
        map('gO', vim.lsp.buf.document_symbol, 'Document symbols')
        map('<leader>ws', vim.lsp.buf.workspace_symbol, 'Workspace symbols')
        map('<leader>ci', vim.lsp.buf.incoming_calls, 'Incoming calls')
        map('<leader>co', vim.lsp.buf.outgoing_calls, 'Outgoing calls')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('K', vim.lsp.buf.hover, 'Hover')
        map('<leader>oi', require('jdtls').organize_imports, 'Organize imports')
      end,
    })
  end,
})

-- git-worktree
pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/ThePrimeagen/git-worktree.nvim'
})
require("git-worktree").setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false,
})
-- telescope extension
local status_ok, telescope = pcall(require, "telescope")
if status_ok then
    telescope.load_extension("git_worktree")
end
-- Toggle existing worktrees / Delete a worktree
vim.keymap.set("n", "<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end, { desc = "List/Switch Git Worktrees" })
-- Create a new worktree
-- vim.keymap.set("n", "<leader>gc", function()
--     require('telescope').extensions.git_worktree.create_git_worktree()
-- end, { desc = "Create Git Worktree" })
