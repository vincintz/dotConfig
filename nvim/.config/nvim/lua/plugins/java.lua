return {
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup({
        jdk = {
          auto_install = false,
        }
      })
      vim.lsp.enable('jdtls')
      -- Set JAVA_HOME to use JDK21
      vim.env.JAVA_HOME = 'C:\\Development\\tools\\Java\\jdk21.0.10_7'
    end,
  },
}

