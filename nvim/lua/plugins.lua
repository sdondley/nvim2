return require('packer').startup(function(use)
  use { 
      { 'wbthomason/packer.nvim' },
      { 'christoomey/vim-tmux-navigator' },
      { 'jebaum/vim-tmuxify' },
      { 'vim-syntastic/syntastic',	    opt = true, ft = {'php', 'perl'}},
      { 'c9s/perlomni.vim', 		    opt = true, ft = {"perl"} },
      { 'windwp/nvim-autopairs', 		    opt = true, ft = {'php', 'perl'}, config = function() require("nvim-autopairs").setup {} end },
      { 'vimwiki/vimwiki', branch = 'dev',
      config = function()
          --vim.g.vimwiki_global_ext = 0
          vim.g.vimwiki_folding='custom'
          vim.g.vimwiki_toc_header = 'On This Page'
			vim.g.vimwiki_list = {
		       { path = '~/git_repos/websites/climate_change_chat/',
		         auto_toc = 1,
		         syntax = 'markdown',
		         vimwiki_toc_header = 'On this Page',
		         links_space_char = '-',
		         ext = '.md',
		         name = 'cccfr',
		        custom_wiki2html = '~/bin/wiki2html.raku',
		      --   custom_wiki2html' = 'vimwiki_markdown',
		         template_path = '~/git_repos/websites/climate_change_chat/templates/',
		         template_default = 'default',
		         template_ext = '.tpl',
		         html_filename_parameterization = 1,
		         path_html = '~/git_repos/websites/climate_change_chat/html/',
		         output_dir = '~/git_repos/websites/climate_change_chat/html/',
		         css_name = 'css/style.css' },
		     {path = '~/vimwiki/steve/*', syntax = 'markdown', ext = '.md'},  
		     {path = '~/Documents/vimwiki/client_wikis', syntax = 'markdown', ext = '.md'}, 
		     {path = '~/Documents/notes/', auto_toc = 1, syntax = 'markdown', ext = '.md', name = 'notes'}, 
		     {path = '~/Documents/notes/tasknotes', auto_toc = 1, syntax = 'markdown', ext = '.md', name = 'tasknotes'}, 
		     {path = '~/vimwiki/', syntax = 'markdown', ext = '.md', name = 'nice'} }

      end

      },
     { 'tools-life/taskwiki', opt = true, ft = 'vimwiki', branch = 'master' },
  }
  end)
