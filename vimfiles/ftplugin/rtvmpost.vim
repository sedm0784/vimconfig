" FIXME: This is copy/pasted from the site's vimrc. Move into a separate file
"        and source from both locations
function! s:preprocess() abort
  let saved_view = winsaveview()

  " Make a change and then revert it.
  normal! aa
  normal! x

  " Now we have two changes in the undolist which, when undone, will not affect
  " the actual state of the buffer.
  "
  " Next we perform our actual edits, joining them to the previous change in
  " the undolist.

  " Replace pairs of triplespaces outside blockquotes/code with `keystrokes`
  " code blocks
  undojoin | silent global!/\v^(\>|    )/substitute/\v   (\S+)   /{{< keystrokes >}}\1{{< \/keystrokes >}}/g

  " Replace single triplespaces at end of line outside blockquotes too
  undojoin | silent global!/\v^(\>|    )/substitute/\v   (\S+)$/{{< keystrokes >}}\1{{< \/keystrokes >}}/g

  " Replace pairs of triplespaces within blockquotes with en-spaces
  " Continue using en-spaces within blockquotes: the only place this is likely
  " relevant is within quotes from vimtutor, and switching to the shortcode
  " there would be a bit more work due to:
  "
  " - the existing formatting of the blockquote
  " - the less-consistent way that this type of formatting is used in
  "   vimtutor: it's not always neat pairs.
  "
  "undojoin | silent global/^>/substitute/\v   (\S+)   /{{< keystrokes >}}\1{{< \/keystrokes >}}/g
  undojoin | silent global/^>/substitute/   /\&ensp;\&ensp;\&ensp;/g

  " Write a copy with an .md extension
  execute "write!" expand('<afile>:p:r') . '.md'

  " Revert all changes.
  " The first undo reverts all the real edits and the `x`.
  " The second undo reverts the `aa`.
  normal 2u

  call winrestview(saved_view)
endfunction

augroup preprocess_hugo
  autocmd!
  autocmd BufWritePre *.rtvmpost call s:preprocess()
augroup END

" Convert the formatting from fibonacci.txt into HTML dd/dt tags. Note that I
" now have a dd shortcode that should be used in favour of raw HTML tags, as
" it allows Markdown formatting within.
function s:process_dt(dt_long) abort
  if a:dt_long
    normal! A</dt>
    normal! +
  else
    execute "normal! 9|gea</dt>\<CR>"
  endif
  normal! <<.i  <dd>
  normal! -
  normal! i  <dt>
  normal! +
  call search('$\n\S', 's')
  execute "normal! A</dd>\<CR>"
  normal! +
endfunction

command! ProcessDT call s:process_dt()
nnoremap <buffer> <leader>p :call <SID>process_dt(0)<CR>
nnoremap <buffer> <leader>q :call <SID>process_dt(1)<CR>
