iVim Configuration.

@heading FIXME Original Unconverted.
=
" iVim specific config ---------------------------------------------------- {{{
if OperatingSystem("ios")

" kbd {{{
" Replace colon with backtick
  isetekbd replace {'buttons':[{'keys':[{'title':'`',
                                       \'type':'insert',
                                       \'contents':'`'}],
                              \'locations':[0]
                              \}],
                  \'locations':[9]}
" And add new button with colon/tilde
  isetekbd insert {'buttons':[
                             \{'keys':[{'title':':',
                                       \'type':'insert',
                                       \'contents':':'}]},
                             \{'keys':[{'title':'~',
                                      \ 'type':'insert',
                                      \ 'contents':'~'}],
                             \'locations':[1]}
                             \],
                  \'locations':[10,10]}
" }}}
" iVimClippy {{{
  function! s:vimclippy() abort
    edit vimclippy
    silent put! +
    $delete
    1
    augroup vimclippy
      autocmd!
      autocmd BufWriteCmd vimclippy %yank + | set nomodified
    augroup END
  endfunction

  command! VimClippy call s:vimclippy()
" }}}

  let g:gitgutter_enabled = 0
endif
" }}}
