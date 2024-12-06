Status Line.

Configuring the information display at the bottom of each window.

@ The status line is the configurable line at the bottom of each window that
is generally used to display context-dependent information, such as the file
name, type, etc.

@ By default, Vim only shows the status line when there is more than one
window. But I always want to be informed about my status! Let's switch it on
all the time.
=
set laststatus=2

@heading Functions
As soon as you add any kind of complexity to your status line, it's best to
break it up, by splitting the |:set statusline| command into a number of
calls, and by using functions for custom evaluated items.

I have five of these. The first three ALMOST duplicate functionality already
provided by the standard statusline items, but they're needed because I like a
couple of bits to be highlighted differently.

@heading File path.
You can use the |%f| item to include the relative path to the file in the
buffer. But I found it hard to spot the actual file name in this, so I need
to add the path separately so that I can apply colour just to the filename
|%t|.
=
function! FilePathNoName() abort
  let l:path = expand("%:h")
  if !empty(l:path)
    let l:path = l:path . "/"
  endif
  return l:path
endfunction

@heading Modified/modifiable flags.
The |%m| item displays |[+]| if the file is modified and |[-]| if the file is
NOT modifiable. I want it to be very obvious if the file is modified, so
again, I need a function to return just the |[+]| flag so I can colour this
differently.
=
function! StatuslineModified() abort
  return &modified ? '[+]' : ''
endfunction

@ And I also need a function just to return the modifiable flag.
=
function! StatuslineModifiable() abort
  return &modifiable ? '' : '[-]'
endfunction

@heading Items provided by plugins.
I have a couple of items in my status line that are provided by plugins.
//fugitive -> https://github.com/tpope/vim-fugitive// allows you to display
your git branch in the status line, and
//gutentags -> https://github.com/ludovicchabant/vim-gutentags.git// has one
that indicates when it is regenerating your ctags.

I can't add these directly to the status line, because I don't always have the
plugins installed.[1] So this function wraps the calls to the plugins so it
can suppress the errors that occur if the plugins aren't installed. I just use
a single function so I only need a single try/catch block: if either of the
plugins is installed they both will be.

[1] Notably, in //iVim -> https://apps.apple.com/app/ivim/id1266544660//,
neither plugin works as they both use system calls that don't exist on iOS.
=
function! StatuslinePluginItems() abort
  @<Call plugin status functions@>

  let source_status = fugitive_status
  if !empty(fugitive_status) && !empty(gutentags_status)
    let source_status .= " "
  endif
  let source_status .= gutentags_status

  return source_status
endfunction

@ Calling |exists()| on an autoload function always appears to return false,
even if that function has already been called. I catch and ignore the errors
instead.
@<Call plugin status functions@> =
  try
    let fugitive_status = fugitive#statusline()
    let gutentags_status = gutentags#statusline()
  catch /^Vim\%((\a\+)\)\=:E117:/ " catch error E117
    return ""
  endtry

@
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
set statusline+=%(\ %{StatuslinePluginItems()}%)  " Source control status
set statusline+=%=                          " >> space <<
set statusline+=\ dec=%b                        " Value of byte(s) under cursor in decimal (e.g. for finding ASCII/Unicode)
set statusline+=\ hex=%02.4B                  " Hex value of byte(s) under cursor
set statusline+=\ c%v/%{strlen(getline('.'))} " Character position/line length
set statusline+=\ l%l/%L                      " Line number/File length (in lines)
set statusline+=\ %p%%                        " Position in file.
