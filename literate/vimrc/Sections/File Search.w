File Search.

:grep etc.

@heading FIXME: Original Unconverted.
=
" The Silver Searcher / ripgrep ------------------------------------------- {{{
if executable('rg')
  " Use rg over grep
  let &grepprg = "rg --vimgrep --hidden"

  if !has("win32")
    " FIXME: This doesn't work on Windows. Don't know why.
    " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'rg -F --files %s'

    " rg is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
elseif executable('ag')
  " Use ag over grep
  let &grepprg = "ag --vimgrep --hidden"

  if !has("win32")
    " FIXME: This is untested on Windows.
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
endif
" }}}
