return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 
      { 'wbthomason/packer.nvim', opt = false },
      { 'christoomey/vim-tmux-navigator',	    opt = true, cond = true },
      { 'jebaum/vim-tmuxify', 		    opt = true, cond = true },
  }
  end)
