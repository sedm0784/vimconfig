" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal nowrap cursorline

nnoremap <buffer> <leader>x :call <SID>cycle_highlighted_payment_type()<CR>
nnoremap <buffer> [e :call <SID>expenses_error_search(1)<CR>
nnoremap <buffer> ]e :call <SID>expenses_error_search(0)<CR>
" Until we have useful completion behaviour for dates, amounts, and notes,
" only use our completion for payment types and categories
inoremap <buffer> <expr> <Tab> <SID>tab_expression()

set omnifunc=CompleteExpenses

function s:expenses_error_search(backward) abort
  let flags = 's'
  if a:backward
    let flags .= 'b'
  endif
  if &wrapscan
    let flags .= 'w'
  else
    let flags .= 'W'
  endif
  call search(b:exre, flags)
endfunction
" 0 date
" 1 category
" 2 payment type
" 3 amount
" 4 notes
function! s:expenses_column()
  if col('.') == 1
    return 0
  else
    " Count commas in line *before* cursor
    " To slice before cursor, need to subtract one to get to character
    " before cursor, and another one because col is 1-based but slice
    " indexes are 0-based
    let index = col('.') - 2
    return count(getline('.')[:index], ',')
  endif
endfunction
function! CompleteExpenses(findstart, base) abort
  if a:findstart
    let start = col('.') - 1
    while start > 0 && getline('.')[start - 1] != ','
      let start -= 1
    endwhile
    return start
  else
    "let types = ['date', 'category', 'type', 'amount', 'notes']

    let expenses_column = s:expenses_column()

    if expenses_column == 0
      " Check nearest dates above and below
      " Complete longest matching prefix
      " Actually should probably do this every time we open a new empty line
    elseif expenses_column == 1
      let completions = [
            \ 'Baby',
            \ 'Car',
            \ 'Charity',
            \ 'Gifts',
            \ 'Groceries',
            \ 'Holiday',
            \ 'Home/Garden',
            \ 'Income',
            \ 'Joint Fun Times',
            \ 'Kittens',
            \ 'Lunch/Snacks',
            \ 'My Fun Times',
            \ 'Travel',
            \ 'One Offs',
            \ 'Other',
            \ ]
    elseif expenses_column == 2
      let completions = [
            \ 'Cash',
            \ 'Credit Card',
            \ 'Debit Card (Joint)',
            \ 'Debit Card',
            \ 'Regular Payment',
            \ 'Transfer',
            \ ]
    endif
    if exists('completions')
      call filter(completions, 'v:val =~? "^' .. a:base .. '"')
      return completions
    endif
    return [a:base]
  endif
endfunction
function! s:tab_expression() abort
  if pumvisible()
    return "\<C-P>"
  endif

  let expenses_column = s:expenses_column()
  if expenses_column == 1 || expenses_column == 2
    return "\<C-X>\<C-O>"
  else
    return "\<C-P>"
  endif
endfunction
function! s:cycle_highlighted_payment_type() abort
  syntax clear ExpensesCurrent

  if !exists('b:current_highlight')
    let b:current_highlight = 1
    syntax match ExpensesCurrent /Debit Card (Joint),-\?\d\+\(\.\d\d\)\?/
  elseif b:current_highlight == 1
    let b:current_highlight = 2
    syntax match ExpensesCurrent /\(Credit\|Debit Card\|Transfer\|Regular Payment\),-\?\d\+\(\.\d\d\)\?/
  elseif b:current_highlight == 2
    let b:current_highlight = 3
    syntax match ExpensesCurrent /Credit Card,-\?\d\+\(\.\d\d\)\?/
  elseif b:current_highlight == 3
    unlet b:current_highlight
  endif
endfunction
