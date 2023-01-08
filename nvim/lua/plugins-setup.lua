-- Bootstrap packer.nvim - https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- reload neovim when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- ask packer to manage itself
  use 'https://github.com/wbthomason/packer.nvim'

  -- used by most plugins
  use('https://github.com/nvim-lua/plenary.nvim')

  -- file tree
  use('https://github.com/nvim-tree/nvim-tree.lua')
  use('https://github.com/nvim-tree/nvim-web-devicons')

  -- collection of colorschemes
  use('https://github.com/rafi/awesome-vim-colorschemes')

  -- fuzzy finding w/ telescope
  use({ 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({ 'https://github.com/nvim-telescope/telescope.nvim', branch = '0.1.x' })

  -- editor config
  use('https://github.com/gpanders/editorconfig.nvim')

  -- git integration
  use('https://github.com/tpope/vim-fugitive')
  use {'https://github.com/lewis6991/gitsigns.nvim', config = function()
    require('gitsigns').setup()
  end}

  -- wiki tool
  use('https://github.com/vimwiki/vimwiki')

  -- database tool
  use('https://github.com/tpope/vim-dadbod')

  -- terminal
  use {'https://github.com/akinsho/toggleterm.nvim', tag = '*'}

  -- /Bootstrap
  if packer_bootstrap then
    require('packer').sync()
  end
end)
