let s:tag_link_pattern = '|\k\+|'
let s:command_pattern = '`:\k\+`'
let s:option_pattern = '''[a-z]\{2,}''\|''t_..'''

let s:search_pattern = s:tag_link_pattern
let s:search_pattern .= '\|'
let s:search_pattern .= s:command_pattern
let s:search_pattern .= '\|'
let s:search_pattern .= s:option_pattern

function! s:search(forwards) abort
  if a:forwards
    let flags = 'sz'
  else
    let flags = 'sb'
  endif

  call search(s:search_pattern, flags)
endfunction

nnoremap <buffer> ]] <Cmd>call <SID>search(1)<CR>
nnoremap <buffer> [[ <Cmd>call <SID>search(0)<CR>

