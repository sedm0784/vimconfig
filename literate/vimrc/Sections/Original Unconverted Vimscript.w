Original Unconverted Vimscript.

This section contains everything left over from my original .vimrc file that hasn't been imported into new sections.

@heading FIXME Original vimrc.
Any remaining unimported Vimscript is pasted below:
=
" Fold on 3{s and manually
set foldmethod=marker

" Liveblog highlighting {{{

" Find *[Tom's comments]* for liveblogs
" N.B. Had to escape the '|' chars so Vim doesn't think they are pipes
nnoremap <leader>ftc /\v\*\[[^]*]{-}\]\*/s+2<CR>
nnoremap <leader>ftnc /\v(^\[.{-}\]\*\|[^*]\[.{-}\]\*\|\*\[.{-}\]$\|\*\[.{-}\][^*])<CR>

" This is the regular expression used for finding broken comments:
" (^\[.{-}\]\*|[^*]\[.{-}\]\*|\*\[.{-}\]$|\*\[.{-}\][^*])
"
" It's an alternation built from the following four smaller regexps:
"
" Comments missing start asterisks:
" ^\[.{-}\]\*     - at start of line
" [^*]\[.{-}\]\*  - mid line
"
" Comments missing end asterisks:
" \*\[.{-}\]$     - at end of line
" \*\[.{-}\][^*]  - mid line

" }}}

" Filetype options -------------------------------------------------------- {{{

" FIXME: It would be better to use ~/.vim/after/ftplugin/<filetype>.vim files
" for these settings. (So as not to have to use autocommands).

augroup filetypeoptions
  autocmd!

  " C/CPP {{{

  autocmd FileType cpp,c setlocal fo=cq

  " }}}
  " ConqueTerm {{{

  " Turn off listing of trailing spaces
  autocmd FileType conque_term setlocal listchars=tab:->

  " }}}
  " Markdown {{{

  autocmd FileType mkd setlocal ai formatoptions=tcroqnj comments=n:>

  " }}}
  " AutoHotKey {{{

  " Tabs should be converted to a group of 4 spaces.
  autocmd FileType autohotkey setlocal ts=4 sw=4 expandtab
  " }}}
  " Vim {{{

  autocmd FileType vim setlocal foldmethod=marker

  " }}}
  " Objective C {{{

  " Convert tabs to 4 spaces, which is how Xcode is setup by default
  autocmd FileType objc setlocal ts=4 sw=4 expandtab
  autocmd FileType objcpp setlocal ts=4 sw=4 expandtab

  " }}}
augroup END

" }}}

" Source other files ------------------------------------------------------ {{{

" Computer-specific stuff
if filereadable($HOME."/.vim/local.vim")
  source $HOME/.vim/local.vim
endif

" }}}
