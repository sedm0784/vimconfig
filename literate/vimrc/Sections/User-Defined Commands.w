User-Defined Commands.

@heading FIXME Original Unconverted.
=
" New Commands ------------------------------------------------------------ {{{
" DiffSaved {{{
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffSaved call s:DiffWithSaved()
" }}}
" SyntaxQuery: Display the syntax stack at current cursor position {{{
function! s:syntax_query() abort
  for id in synstack(line("."), col("."))
    execute 'hi' synIDattr(id, "name")
  endfor
endfunction
command! SyntaxQuery call s:syntax_query()
" }}}
" }}}
