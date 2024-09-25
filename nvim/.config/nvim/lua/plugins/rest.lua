return {
  "diepm/vim-rest-console",
  config = function()
    vim.g.vrc_trigger = "<leader>rr"
    vim.g.vrc_response_default_content_type = 'application/json'
    vim.g.vrc_output_buffer_name = '__REST_response__'
    vim.g.vrc_auto_format_response_patterns = {
      json = 'jq',
    }
    vim.keymap.set('n', 'rx', "<cmd>bdelete __REST_response__<cr>")
  end
}
