" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.rtvmpost setfiletype markdown.rtvmpost
  au! BufRead,BufNewFile expenses.csv setfiletype csv.expenses
augroup END
