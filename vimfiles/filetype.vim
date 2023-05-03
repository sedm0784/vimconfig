" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.rtvmpost setfiletype markdown.rtvmpost
augroup END
