return require('packer').startup(function(use)
  use { 
      { 'wbthomason/packer.nvim' },
      { 'christoomey/vim-tmux-navigator' },
      { 'jebaum/vim-tmuxify' },
      { 'Pocco81/auto-save.nvim',

      },
      { 'sdondley/instant.nvim' },
      { 'junegunn/fzf.vim', opt = true, cond = true, branch = 'master',
    					    requires = {'junegunn/fzf', opt = true, cond = true, cmd = 'fzf#install()' } },

      { 'vim-syntastic/syntastic',	    opt = true, ft = {'php', 'perl'}},
      { 'c9s/perlomni.vim', 		    opt = true, ft = {"perl"} },
      { 'windwp/nvim-autopairs', 		    opt = true, ft = {'php', 'perl'}, config = function() require("nvim-autopairs").setup {} end },
      { 'vimwiki/vimwiki', branch = 'dev',
          config = function()
              --vim.g.vimwiki_global_ext = 0
              vim.g.vimwiki_folding='custom'
              vim.g.vimwiki_toc_header = 'On This Page'
			  vim.g.vimwiki_list = {
                 {path = '~/vimwiki/', syntax = 'markdown', ext = '.md', name = 'nice'} }

          end
      },
     { 'tools-life/taskwiki', opt = true, ft = 'vimwiki', branch = 'master' },
  }
  end)
