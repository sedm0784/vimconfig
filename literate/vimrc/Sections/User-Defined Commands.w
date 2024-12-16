User-Defined Commands.

Defining custom commands.

@heading DiffSaved.
A command to diff against the saved version of the current file. In particular
this is useful when you have just recovered a swap file and want to know what
changes it contained before deciding whether to |:write| them.
=
function! s:DiffWithSaved()
  let filetype=&filetype
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

command! DiffSaved call s:DiffWithSaved()

@heading SyntaxQuery.
A command to display the syntax items and highlighting active at the cursor
location. This is a very slightly tweaked version of the example in given in
|:help synstack()|, the only difference being that I use the |:highlight|
command to display the current highlighting of each syntax item instead of
just printing them out with |:echo|.
=
function! s:syntax_query() abort
  for id in synstack(line("."), col("."))
    execute 'highlight' synIDattr(id, "name")
  endfor
endfunction

command! SyntaxQuery call s:syntax_query()
