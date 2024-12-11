Snippets and Typos.

@heading FIXME: Original Unconverted.
=
" Abbreviations/typo corrections ------------------------------------------ {{{

iabbrev unsinged unsigned

" Holding down the shift key too long when entering command-line mode:
"
cabbrev <expr> W (getcmdtype() == ':' && getcmdpos() == 2) ? 'w' : 'W'
" :wq can take an ++opt and an argument (I never use this, but ¯\_(ツ)_/¯)
cabbrev <expr> Wq (getcmdtype() == ':' && getcmdpos() == 3) ? 'wq' : 'Wq'

command! -bang Q q<bang>
command! -bang Qall qall<bang>
command! -bang Qal qall<bang>
command! -bang Cn cn<bang>
" Could (should?) also do this one with cabbrev like W. Command seems
" neater somehow.
command! -complete=option -nargs=* Set set <args>
command! -complete=option -nargs=* Setl setl <args>
command! -bang Wqall wqall<bang>

" }}}
