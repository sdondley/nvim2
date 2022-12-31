return require('packer').startup(function(use)
  use { 
      { 'wbthomason/packer.nvim' },
      { 'christoomey/vim-tmux-navigator' },
      { 'jebaum/vim-tmuxify' },
      { 'Pocco81/auto-save.nvim',
        {
          trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
            -- function that determines whether to save the current buffer or not
            -- return true: if buffer is ok to be saved
            -- return false: if it's not ok to be saved
            condition = function(buf)
                if
                    vim.api.nvim_get_mode().mode == 'i' then
                    return false
                end
                local fn = vim.fn
                local utils = require("auto-save.utils.data")


                if
                    fn.getbufvar(buf, "&modifiable") == 1 and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                return false -- can't save
            end,
        }
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
