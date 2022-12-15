" Vim global plugin for XXXX
"
" Last change:  <TIMESTAMP>
" Maintainer:   <AUTHOR>
" License:      This file is placed in the public domain.

" If already loaded, we're done...
if exists("loaded_<FILEROOT>")
    finish
endif
let loaded_<FILEROOT> = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

" Implementation here...

" Restore previous external compatibility options
let &cpo = s:save_cpo
