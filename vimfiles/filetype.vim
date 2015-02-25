" my filetype file
if exists("did_load_filetypes")
  finish
endif

" Vim added a markdown filetype at some point
"augroup filetypedetect
"  au! BufRead,BufNewFile *.mkd   setfiletype mkd
"  au! BufRead,BufNewFile *.markdown setfiletype mkd
"augroup END

