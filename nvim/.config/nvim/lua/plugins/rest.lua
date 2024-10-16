return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        request = {
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- stay in current windows (.http file) or change to results window (default)
        stay_in_current_window_after_split = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = true,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- table of curl `--write-out` variables or false if disabled
          -- for more granular control see Statistics Spec
          show_statistics = false,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end
  },
  {
    'diepm/vim-rest-console',
    config = function()
      vim.api.nvim_exec([[
        function! ToggleVrcResult(buffer_name)
          let l:bufnr = bufwinnr(a:buffer_name)
          if l:bufnr != -1
            " Delete the buffer
            execute 'bdelete' a:buffer_name
          else
            echo "Running VrcQuery()"
            call VrcQuery()
          endif
          echo ""
        endfunction
      ]], false)

      vim.g.vrc_set_default_mapping = 0
      vim.g.vrc_response_default_content_type = 'application/json'
      vim.g.vrc_output_buffer_name = '__REST_response__'
      vim.g.vrc_auto_format_response_patterns = {
        json = 'jq',
      }
      vim.keymap.set('n', '<leader>r', '<cmd>call ToggleVrcResult("__REST_response__")<cr>')
    end
  },
}
