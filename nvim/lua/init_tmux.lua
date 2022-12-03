vim.cmd[[
"tmuxify
let g:tmuxify_custom_command = 'tmux split-window -h'
let g:file_name = expand('%:p')
let g:file = @%
let g:tmuxify_run = { 'raku': '/Users/stevedondley/run_perl6_tests.bash ' . g:file_name . ' ' . g:file}

" tmux navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :up<cr>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :up<cr>:TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :up<cr>:TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :up<cr>:TmuxNavigateRight<cr>
inoremap <silent> <c-h><c-h> <esc>:w<cr>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j><c-j> <esc>:w<cr>:TmuxNavigateDown<cr>
inoremap <silent> <c-k><c-k> <esc>:w<cr>:TmuxNavigateUp<cr>
inoremap <silent> <c-l><c-l> <esc>:w<cr>:TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
]]
