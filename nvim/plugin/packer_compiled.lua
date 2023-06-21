-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/steve/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/steve/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/steve/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/steve/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/steve/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["perlomni.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/opt/perlomni.vim",
    url = "https://github.com/c9s/perlomni.vim"
  },
  syntastic = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/opt/syntastic",
    url = "https://github.com/vim-syntastic/syntastic"
  },
  taskwiki = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/opt/taskwiki",
    url = "https://github.com/tools-life/taskwiki"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-tmuxify"] = {
    loaded = true,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/start/vim-tmuxify",
    url = "https://github.com/jebaum/vim-tmuxify"
  },
  vimwiki = {
    config = { "\27LJ\2\nÍ\a\0\0\3\0\r\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0004\1\a\0005\2\a\0>\2\1\0015\2\b\0>\2\2\0015\2\t\0>\2\3\0015\2\n\0>\2\4\0015\2\v\0>\2\5\0015\2\f\0>\2\6\1=\1\6\0K\0\1\0\1\0\4\vsyntax\rmarkdown\tname\tnice\bext\b.md\tpath\15~/vimwiki/\1\0\5\vsyntax\rmarkdown\rauto_toc\3\1\tpath ~/Documents/notes/tasknotes\tname\14tasknotes\bext\b.md\1\0\5\vsyntax\rmarkdown\rauto_toc\3\1\tpath\23~/Documents/notes/\tname\nnotes\bext\b.md\1\0\3\vsyntax\rmarkdown\tpath%~/Documents/vimwiki/client_wikis\bext\b.md\1\0\3\vsyntax\rmarkdown\tpath\22~/vimwiki/steve/*\bext\b.md\1\0\15\vsyntax\rmarkdown\tname\ncccfr\rauto_toc\3\1\17template_ext\t.tpl\21template_default\fdefault\23vimwiki_toc_header\17On this Page#html_filename_parameterization\3\1\18template_path8~/git_repos/websites/climate_change_chat/templates/\tpath.~/git_repos/websites/climate_change_chat/\21custom_wiki2html\25~/bin/wiki2html.raku\14path_html3~/git_repos/websites/climate_change_chat/html/\rcss_name\18css/style.css\bext\b.md\21links_space_char\6-\15output_dir3~/git_repos/websites/climate_change_chat/html/\17vimwiki_list\17On This Page\23vimwiki_toc_header\vcustom\20vimwiki_folding\6g\bvim\0" },
    loaded = true,
    path = "/Users/steve/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\nÍ\a\0\0\3\0\r\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0004\1\a\0005\2\a\0>\2\1\0015\2\b\0>\2\2\0015\2\t\0>\2\3\0015\2\n\0>\2\4\0015\2\v\0>\2\5\0015\2\f\0>\2\6\1=\1\6\0K\0\1\0\1\0\4\vsyntax\rmarkdown\tname\tnice\bext\b.md\tpath\15~/vimwiki/\1\0\5\vsyntax\rmarkdown\rauto_toc\3\1\tpath ~/Documents/notes/tasknotes\tname\14tasknotes\bext\b.md\1\0\5\vsyntax\rmarkdown\rauto_toc\3\1\tpath\23~/Documents/notes/\tname\nnotes\bext\b.md\1\0\3\vsyntax\rmarkdown\tpath%~/Documents/vimwiki/client_wikis\bext\b.md\1\0\3\vsyntax\rmarkdown\tpath\22~/vimwiki/steve/*\bext\b.md\1\0\15\vsyntax\rmarkdown\tname\ncccfr\rauto_toc\3\1\17template_ext\t.tpl\21template_default\fdefault\23vimwiki_toc_header\17On this Page#html_filename_parameterization\3\1\18template_path8~/git_repos/websites/climate_change_chat/templates/\tpath.~/git_repos/websites/climate_change_chat/\21custom_wiki2html\25~/bin/wiki2html.raku\14path_html3~/git_repos/websites/climate_change_chat/html/\rcss_name\18css/style.css\bext\b.md\21links_space_char\6-\15output_dir3~/git_repos/websites/climate_change_chat/html/\17vimwiki_list\17On This Page\23vimwiki_toc_header\vcustom\20vimwiki_folding\6g\bvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-autopairs', 'syntastic'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType perl ++once lua require("packer.load")({'nvim-autopairs', 'perlomni.vim', 'syntastic'}, { ft = "perl" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'taskwiki'}, { ft = "vimwiki" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
