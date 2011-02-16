" my filetype file
if exists("did\_load\_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.mkd   setfiletype mkd
  au! BufRead,BufNewFile *.markdown setfiletype mkd
augroup END

