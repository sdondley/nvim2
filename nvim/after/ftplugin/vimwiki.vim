let g:fold_blank_lines = 0   "set to 1 to fold blank lines
let g:header_type = '#'      "set to '=' for wiki syntax

setlocal foldenable
setlocal foldlevel=1
setlocal foldmethod=expr
setlocal foldexpr=Fold(v:lnum)

function! Fold(lnum)
   let fold_level = strlen(matchstr(getline(a:lnum), '^#\+'))
   if (fold_level)
     return '>' . fold_level
   endif
   if getline(a:lnum) =~? '\v^\s*$'
     if (strlen(matchstr(getline(a:lnum + 1), '^#\+')) > 0 && !g:fold_blank_lines)
       return '-1'
     endif
   endif
   return '='
endfunction

let b:first_fold = 0
set viewoptions-=options


imap <silent><script><expr> <C-]> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" attempt to set up persistent folds
augroup folds
  autocmd!
  autocmd BufWinLeave,BufWrite,BufUnload *.* mkview
  autocmd BufWinEnter *.* silent! loadview
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

"nnoremap <leader>www :silent w!<cr>:silent Vimwiki2HTML<cr>:silent !git add .<cr>:silent !git commit . -m 'update site'<cr>:silent !git push<cr>
"nnoremap <leader>wwwa :w!<cr>:silent VimwikiAll2HTML<cr>:silent !git add .<cr>:silent !git commit . -m 'update site'<cr>:silent !git push<cr>
nnoremap <leader>www :silent w!<cr>:Vimwiki2HTML<cr>:call PushSite()<cr>
nnoremap <leader>wwwa :silent w!<cr>:silent VimwikiAll2HTML<cr>:call PushSite()<cr>

function! PushSite()
    :silent !cd private; git add .
    :silent !cd private; git commit . -m 'update site'
    :silent !cd html/private; git add .
    :silent !cd html/private; git commit . -m 'update site'
    :silent !git add .
    :silent !git commit . -m 'update site'
    :silent !git push --recurse-submodules=on-demand
endfunction

function! ListFiles()
    let path = expand('%:p:h') . '/files'
    let out = '# Files' . "\n" . '<ul><div class="file-listing">'
    let html = system("tree -nDhH files" . ' ' . path)
    let html = substitute(html, '<.*Tree</h1><p>', '', 'g')
    let html = substitute(html, '\s\+<hr>.*</html>', '', 'g')
    let html = html . '</div></ul>'

    :put =(out . html)
endfunction

function! MyFoldText()
    let comment = substitute(getline(v:foldstart),"^ *","",1)
    let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
    let txt = '+ ' . comment 
    return txt
endfunction
set foldtext=MyFoldText()

augroup AutoCorrect
    autocmd!
    "autocmd  FileType  vimwiki  EnableAutocorrect
augroup END

" link line to wiki pages
inoremap <Leader>wll <esc>ma^v$
nnoremap <Leader>wll ^v$F#be

" link bulleted line to wiki pages
inoremap <Leader>wlb <esc>ma^wv$
nnoremap <Leader>wlb ^/\A*\zs\a<cr>:set nohls<cr>v$F#be

nmap <Leader>wlbs <leader>wlbo<right><esc>:call WebLink('i')<cr>

" bullet links to outside urls
inoremap <Leader>wlbo <esc>ma^<RIGHT><RIGHT>i[<esc>$a]()<esc>i
nnoremap <Leader>wlbo ^<RIGHT><RIGHT>i[<esc>$a]()<esc>i

" open wiki link in new tab
nnoremap <leader>wnt :VimwikiTabnewLink<cr>
nnoremap <leader>wtn :VimwikiTabnewLink<cr>

" get url
inoremap <Leader>gh <esc>:call WebLink('h')<cr>
nnoremap <Leader>gh a<esc>:call WebLink('h')<cr>

inoremap <Leader>gu <esc>:call WebLink('u')<cr>
nnoremap <Leader>gu a<esc>:call WebLink('u')<cr>

syntax region AnnotationInner start=/==AN/ end=/N==/ containedin=Annotation conceal
syntax region Annotation start=/\s==AN/ end=/N==\s/ oneline containedin=TaskWithAnn conceal
hi AnnotationInner ctermfg=cyan
hi Annotation ctermfg=cyan

" add a marker to the end of the task to indicate if an annotation is present
function! AnnotationMarkerInsert()
    if (stridx(getline('.'), '==ANN==') == -1)
      execute "normal! $F#hi==ANN==\<esc>:w!"
    endif
endfunction

syntax region TaskWithAnn start=/\]\s\+/rs=e+1,hs=e+1 end=/==ANN==/re=e-8,he=e-8 oneline containedin=TaskWikiTask,VimwikiListTodo
hi TaskWithAnn ctermfg=white

" get www content
nnoremap <Leader>gw :read !~/bin/copy_safari_url.osa; lynx -dump -nolist $(pbpaste)<cr>

" create link line to a new page
inoremap <leader>wlp <esc>:call NewWikiPage()<cr>
nnoremap <leader>wlp :call NewWikiPage()<cr>

function! NewWikiPage()
    :normal '^'
    let char = matchstr(getline('.'), '\%' . col('.') . 'c.')
    if (char == '*') 
        :normal w
    endif
    :exe "normal y$i[\<esc>$a](\<esc>pa)\<esc>:VimwikiFollowLink\<cr>:VimwikiTOC\<cr>o\<cr># \<esc>p:w\<cr>a\<cr>\<cr>"
            
endfunction

inoremap <leader>wta <esc>gg$a<cr><cr>##<space>Tasks<space><bar><bar><space>project:<esc>maa<space>project.is:<space>+st<cr><cr>###<space>Outstanding<space><bar><space>+PENDING<cr><cr>###<space>Completed<space><bar><space>+COMPLETED $C<esc>`a

nnoremap <Leader>wx <right>F[xf]d$

" add new task to Outstanding tasks
nnoremap <leader>toa 1G/### Outstan<cr>:noh<cr>o* [ ] 

" close up all folds except outstanding task
nnoremap <leader>tfo 1G/### Outstan<cr>:noh<cr>mazM`azvzaza

nnoremap <leader>tx o* [ ] 
inoremap <leader>tx <esc>o* [ ] 

inoremap <leader>tpp <c-x><c-u>

" new indented outdented bullets
inoremap <leader>i <esc>:call Dent('in')<cr>
inoremap <leader>o <esc>:call Dent('out')<cr>
nnoremap <leader>i :call Dent('in')<cr>
nnoremap <leader>o :call Dent('out')<cr>

function Dent(type)
    let dent_type = a:type

    if (dent_type == 'in')
        :exe "normal o\<c-t> "
        startinsert
    endif

    if (dent_type == 'out')
        :exe "normal o\<c-d> "
        startinsert
    endif

endfunction

nnoremap <c-d> <<
nnoremap <c-t> >>

" split links
nnoremap <leader>wsh :VimwikiSplitLink<cr>
nnoremap <leader>wsv :VimwikiVSplitLink<cr>

" attempt to set up persistent folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" link to another wiki page easily
" determine shortcut
inoremap <leader>wxo <esc>Bi[[<esc>ea<c-x><c-o>
inoremap <leader>wox <esc>maF[xv`a<left>y`aa]()<esc><left>"+p<right>a

" turn off opening folds when jump
"set foldopen-=all
set foldopen+=mark
set foldopen+=tag
set foldopen+=search

" for opening files in vim
function! VimwikiLinkHandler(link)
" Use Vim to open external files with the 'vfile:' scheme.  E.g.:
"   1) [[vfile:~/Code/PythonProject/abc123.py]]
"   2) [[vfile:./|Wiki Home]]
let link = a:link
if link =~# '^vfile:'
  let link = link[1:]
else
  return 0
endif
let link_infos = vimwiki#base#resolve_link(link)
if link_infos.filename == ''
  echomsg 'Vimwiki Error: Unable to resolve link!'
  return 0
else
  exe 'tabnew ' . fnameescape(link_infos.filename)
  return 1
endif
endfunction

" for project name completion
" uses user defined completion
" taken from https://vi.stackexchange.com/questions/4584/how-to-create-my-own-autocomplete-function

let s:matches=system("/bin/bash -c 'task _projects'")
function! vimwiki#CompleteFA(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] !~ ':')
            let start -= 1
        endwhile
        return start
    else
        " find classes matching "a:base"
        let res = []
        for m in split(s:matches)
            if m =~ a:base
                call add(res, m)
            endif
        endfor
        return res
    endif
endfun
setlocal completefunc=vimwiki#CompleteFA



"""""""""""""" task annotation handling """"""""""""""""""""""""""""""
" add task maps
" open task (or create one if it doesn't already exist

"nnoremap <leader>to :call AnnotationMarkerInsert()<cr>:<c-\>eprintf('vsplit \| term taskopen -A %s', GetUUID())<cr><cr>
nnoremap <leader>to :call TaskAnnotateWithNote()<cr>

function! TaskAnnotateWithNote()
    :write!
    let uuid = GetUUID()
    call AnnotationMarkerInsert()
    :write!
    let command = printf('vsplit | term taskopen -A %s', uuid)
    execute command
endfunction

nnoremap <leader>tfa :call TaskAnnotateWithFile()<cr>
nmap <leader>taf <leader>tfa
nmap <leader>tau <leader>gua
nmap <leader>tan <leader>to

function! TaskAnnotateWithFile()
    call inputsave()
    let name = input('Enter file path: ', '', 'file')
    call inputrestore()
    if name
        execute printf('!task %s annotate -- %s', GetUUID(), name)
        call AnnotationMarkerInsert()
    endif
endfunction


" add url to task annotation
nnoremap <leader>gua :call TaskAnnotateWithURL()<cr>
function! TaskAnnotateWithURL()
    let uuid = GetUUID()

    " runs an applescript
    silent !~/bin/copy_safari_url.osa
    let url = getreg('+')
    let url = substitute(url, '#', '%23', '')
    execute '!task' uuid 'annotate' escape(url, '%')
    call AnnotationMarkerInsert()
endfunction


" helper function to get task UUID from task on current line
function! GetUUID()
    " split line into parts
    let parts = split(getline('.'), '#')

    " strip whitespace from last portion of line
    let uuid = substitute(parts[-1], '\s\+$', '', '')

    return uuid
endfunction


nnoremap <leader>sg :call RunPerl('search_google', getline('.'))<cr>
inoremap <leader>sg <esc>:call RunPerl('search_google', getline('.'))<cr>a

" runs the perl scrpit, argument is subroutine to run
" output from script is inserted into the buffer
function! RunPerl(subroutine, arg)
    "call InsertText(system('~/bin/taskwiki_helper.pl ' . a:subroutine . ' "' . shellescape(a:arg) . '"'))
    call InsertText(system('~/bin/taskwiki_helper.pl ' . a:subroutine . ' ' . shellescape(a:arg) ))
endfunction

" Insert text at the current cursor position.
function! InsertText(text)
    let cur_line_num = line('.')
    let cur_col_num = col('.')
    let orig_line = getline('.')
    let modified_line =
        \ strpart(orig_line, 0, cur_col_num - 1)
        \ . a:text
        \ . strpart(orig_line, cur_col_num - 1)
    " Replace the current line with the modified line.
    call setline(cur_line_num, modified_line)
    " Place cursor on the last character of the inserted text.
    call cursor(cur_line_num, cur_col_num + strlen(a:text))
endfunction

nnoremap <leader>am :call RunPerl('activate_mic', '')<cr>i
nnoremap <leader>g :call RunPerl('grammarly', '')<cr>i
inoremap <leader>am <esc>:call RunPerl('activate_mic', '')<cr>a
nnoremap <leader>kns :call RunPerl('kill_note_swaps', '')
nnoremap <leader>tv :call PasteTasksClean()<cr>

" paste copied tasks without task ids
function! PasteTasksClean()
    let tasks = getreg('+')
    let clean_tasks = substitute(tasks, '\(\s\+==ANN==\)*\s\+#[0-9a-f]\{8\}[ \t]*\n', '\n', 'g')
    call setreg('+', clean_tasks)
    :put +
    
    
endfunction

" generates a link in markdown using an extern script
function! WebLink(type)
    if a:type == 'i'
        call InsertText(system('~/bin/taskwiki_helper.pl markdown_link_from_url ' . 'u'))
        return
    endif
    let current = getline('.')
    call setline(line('.'), current . system('~/bin/taskwiki_helper.pl markdown_link_from_url ' . a:type))
endfunction

function! OpenTerm()
    set nonumber
    startinsert
endfunction

function! CloseTerm()
    call feedkeys('<cr>')
endfunction

augroup termops
    autocmd!
    autocmd TermOpen *taskopen* call OpenTerm()
    autocmd TermClose *taskopen* call CloseTerm()
augroup END

autocmd BufEnter *.txt set filetype=vimwiki

:iab <expr> dts strftime("%b %d, %Y")
:iab <expr> dtts strftime("%b %d, %Y %H:%M")

nnoremap <leader>wb :VimwikiTable 2 2<cr>
inoremap <leader>wb <esc>:VimwikiTable 2 2<cr>
nnoremap <leader>whhh :VimwikiAll2HTML<cr>

:iab co2 CO₂
:iab CO2 CO₂
:iab n2 N₂
:iab N2 N₂

augroup TaskWiki
autocmd!
"au BufEnter *.md :TaskWikiBufferLoad
augroup END