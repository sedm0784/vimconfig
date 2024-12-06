Status Line.

Configuring the information display at the bottom of each window.

@ The status line is the configurable line at the bottom of each window that is generally used to
display context-dependent information, such as the file name, type, etc.

@ =
" Always display status line
set laststatus=2

@ Function to return '[+]' if file is modified
=
function! StatuslineModified()
  if (&modified)
    return '[+]'
  else
    return ''
  endif
endfunction

@ Function to return '[-]' if file is NOT modifiable
=
function! StatuslineModifiable() "
  if (&modifiable)
    return ''
  else
    return '[-]'
  endif
endfunction

@ Function to return the file path *without* the filename
=
function! FilePathNoName()
  let l:path = expand("%:h")
  if strlen(l:path) > 0
    let l:path = l:path . "/"
  endif
  return l:path
endfunction

@ Function to return source control status ignoring errors
=
"
" Calling exists() on an autoload function always appears to return false,
" even if the function has already been called. Catch the errors instead.
function! StatuslineSourceControl() abort
  try
    let fugitive_status = fugitive#statusline()
    let gutentags_status = gutentags#statusline()
  catch /^Vim\%((\a\+)\)\=:E117:/ " catch error E117
    " Ignore errors that occur if functions don't exist i.e. if the plugins are
    " not installed. Note that if one is installed then they both will be. If
    " this changes in the future I will have to have two separate try blocks.
    return ""
  endtry

  let source_status = fugitive_status
  let source_status .= empty(fugitive_status) ? "" : ""
  let source_status .= gutentags_status

  return source_status
endfunction

@ I'm not sure why the double space is required.

= (text as code)
function! StatusFunction() abort
  return " *"
endfunction

set statusline=[%{StatusFunction()}%{StatusFunction()}]
set laststatus=2

@ Results in a status line containing:
= (text)
[ **]

@ Setup the status line
=
set statusline=%{FilePathNoName()}            " File path
set statusline+=%#Question#                   " Set highlight
set statusline+=%t                            " File name
set statusline+=%*                            " Revert to usual coloring
set statusline+=%r%h%w%q                      " File status
set statusline+=%#Error#                      " Set highlight
set statusline+=%{StatuslineModified()}       " Display if modified
set statusline+=%*                            " Revert to usual coloring
set statusline+=%{StatuslineModifiable()}     " Display if file *not* modifiable
set statusline+=\ %Y,%{&ff},%{&fileencoding}  " Filetype and file format
set statusline+=%(\ %{StatuslineSourceControl()}%)  " Source control status
set statusline+=[end]
set statusline+=%=                          " >> space <<
set statusline+=dec=%b                        " Value of byte(s) under cursor in decimal (e.g. for finding ASCII/Unicode)
set statusline+=\ hex=%02.4B                  " Hex value of byte(s) under cursor
set statusline+=\ c%v/%{strlen(getline('.'))} " Character position/line length
set statusline+=\ l%l/%L                      " Line number/File length (in lines)
set statusline+=\ %p%%                        " Position in file.
