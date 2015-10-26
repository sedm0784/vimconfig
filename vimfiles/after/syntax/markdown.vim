"This is the regular expression used for highlighting broken comments:
"(^\[[^\]]{-}\]\*|[^*]\[[^\]]{-}\]\*|\*\[[^\[]{-}\]$|\*\[[^\[]{-}\][^*])
"
"It's an alternation built from the following four smaller regexps:
"
"Comments missing start asterisks:
"^\[[^\]]{-}\]\*     - at start of line
"[^*]\[[^\]]{-}\]\*  - mid line
"
"Comments missing end asterisks:
"\*\[[^\[]{-}\]$     - at end of line
"\*\[[^\[]{-}\][^*]  - mid line

"Highlight *[Tom's comments]* for liveblogs
syntax match TomComment /\v\*\[[^]*]{-}\]\*/
"Highlight comments missing start or end asterisks
syntax match TomBrokenComment /\v(^\[[^\]]{-}\]\*|[^*]\[[^\]]{-}\]\*|\*\[[^\[]{-}\]$|\*\[[^\[]{-}\][^*])/

highlight TomComment guifg=#6c71c4 ctermfg=lightmagenta
highlight TomBrokenComment guifg=#dc322f ctermfg=red

" Auto lists: Automatically continue/end lists by adding markers if the
" previous line is a list item, or removing them when they are empty
function! s:auto_list()
  let l:preceding_line = getline(line(".") - 1)
  if l:preceding_line =~ '\v^\d+\.\s.'
    " The previous line matches any number of digits followed by a full-stop
    " followed by one character of whitespace followed by one more character
    " i.e. it is an ordered list item

    " Continue the list
    let l:list_index = matchstr(l:preceding_line, '\v^\d*')
    call setline(".", l:list_index + 1. ". ")
  elseif l:preceding_line =~ '\v^\d+\.\s$'
    " The previous line matches any number of digits followed by a full-stop
    " followed by one character of whitespace followed by nothing
    " i.e. it is an empty ordered list item

    " End the list and clear the empty item
    call setline(line(".") - 1, "")
  elseif l:preceding_line[0] == "-" && l:preceding_line[1] == " "
    " The previous line is an unordered list item
    if strlen(l:preceding_line) == 2
      " ...which is empty: end the list and clear the empty item
      call setline(line(".") - 1, "")
    else
      " ...which is not empty: continue the list
      call setline(".", "- ")
    endif
  endif
endfunction

" N.B. Currently only enabled for return key in insert mode, not for normal
" mode 'o' or 'O'
inoremap <buffer> <CR> <CR><Esc>:call <SID>auto_list()<CR>A
