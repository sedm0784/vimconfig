Title: help.vim
Author: Rich Cheng
Notation: InwebClassic
Purpose: Help file type configuration
Language: Vimscript

@ This file, installed at `.vim/after/ftplugins/python.vim` contains my Help
filetype specific configuration.

Vim's documentation is very well hyperlinked. I FACILITATE hopping around the
web of linked topics with a couple of mappings to move the cursor quickly
between links.

> [!NOTE]
> The *targets* of links are actually specified outside the help files
> themselves, in a tags file. The markup in the help file is strictly
> presentational. This means you don't actually NEED the word under your cursor
> to be a hyperlink to jump to it. Hit `CTRL-]` on any old word in a help file
> and if there's a topic for that word anywhere in the help, you'll jump to it.

=
@ We use these regular expression patterns to find links:
=
let s:tag_link_pattern = '|\k\+|'
let s:command_pattern = '`:\k\+`'
let s:option_pattern = '''[a-z]\{2,}''\|''t_..'''

@ Glue 'em together:
=
let s:search_pattern = s:tag_link_pattern
let s:search_pattern .= '\|'
let s:search_pattern .= s:command_pattern
let s:search_pattern .= '\|'
let s:search_pattern .= s:option_pattern

@ Because the pattern is a script local variable, we can't access it directly
from a mapping. We need a wrapper function. We use a `b` flag when we want to
search backwards. When searching forwards, we use the `z` flag because, while the
search behaviour without it isn't INCOMPREHENSIBLE, it's... uh... [not exactly
*intuitive*](https://vi.stackexchange.com/questions/29489/what-does-the-z-flag-for-search-do).

In both direction, we use the `s` flag to add an entry to the
[jumplist](https://vimhelp.org/motion.txt.html) when we invoke the search.
=
function! s:search(forwards) abort
  if a:forwards
    let flags = 'sz'
  else
    let flags = 'sb'
  endif

  call search(s:search_pattern, flags)
endfunction

@ Mappings to invoke it.
=
nnoremap <buffer> ]] <Cmd>call <SID>search(1)<CR>
nnoremap <buffer> [[ <Cmd>call <SID>search(0)<CR>
