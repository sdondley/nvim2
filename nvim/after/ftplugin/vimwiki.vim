set foldenable
setlocal foldlevel=0
setlocal foldmethod=expr
setlocal foldexpr=Fold(v:lnum)

function! Fold(lnum)
   let fold_level = strlen(matchstr(getline(a:lnum), '^' . g:vimwiki_header_type . '\+'))
   if (fold_level)
     return '>' . fold_level  " start a fold level
   endif
   if getline(a:lnum) =~? '\v^\s*$'
     if (strlen(matchstr(getline(a:lnum + 1), '^' . g:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines)
       return '-1' " don't fold last blank line before header
     endif
   endif
   return '=' " return previous fold level
endfunction
