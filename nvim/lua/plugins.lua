return require('packer').startup(function(use)
  use { 
      { 'wbthomason/packer.nvim' },
      { 'christoomey/vim-tmux-navigator' },
      { 'jebaum/vim-tmuxify' },
      { 'vimwiki/vimwiki', branch = 'dev',
      config = function()
          vim.g.vimwiki_toc_header = 'On This Page'
          vim.g.vimwiki_folding='custom'
          vim.g.vimwiki_global_ext = 0
          vim.g.vimwiki_list = {{path = '~/vimwiki/steve/', syntax = 'markdown', ext = '.md'}}
      end
      },
  }
  end)
