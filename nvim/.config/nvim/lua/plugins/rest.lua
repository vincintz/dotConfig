return {
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
    vim.g.vrc_response_default_content_type = 'application/json'
    vim.g.vrc_output_buffer_name = '__REST_response__'
    vim.g.vrc_auto_format_response_patterns = {
      json = 'jq',
    }
    vim.keymap.set('n', '<leader>r', '<cmd>call ToggleVrcResult("__REST_response__")<cr>')
  end
}
