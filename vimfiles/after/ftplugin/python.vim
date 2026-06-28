setlocal tabstop& shiftwidth=4 softtabstop=0 smarttab expandtab

setlocal list

setlocal formatoptions=cqjr
setlocal textwidth=79

setlocal colorcolumn=80

compiler flake8

let g:include_blanks_in_fold_above = 1
set foldexpr=alternate_indent_foldexpr#foldlevel(v:lnum)
set foldmethod=expr

if has('packages')
  packadd vim-python-pep8-indent
endif

