"let g:taskwiki_dont_fold=1
setlocal foldenable 
setlocal foldmethod=expr
setlocal foldexpr=VimwikiFoldLevelCustom(v:lnum)

function! MyFoldText()
    let comment = substitute(getline(v:foldstart),"^ *","",1)
    let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
    let txt = '+ ' . comment 
    return txt
endfunction
set foldtext=MyFoldText()

function! VimwikiFoldLevelCustom(lnum)
    let pounds = strlen(matchstr(getline(a:lnum), '^#\+[^[:space:]]'))
    if (pounds)
      return '>' . pounds  " start a fold level
    endif
    if getline(a:lnum) =~? '\v^\s*$'
      if (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
        return '-1' " don't fold last blank line before header
      endif
    endif
    return '=' " return previous fold level
endfunction

