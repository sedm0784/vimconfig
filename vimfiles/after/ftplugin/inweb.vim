set makeprg=literate/generate-all.sh
let &errorformat = '%.%#: %f\, line %l: %m'
nnoremap <silent> <buffer> ,mm :set isfname+=32<CR>:make<CR>:set isfname-=32<CR>:cwindow<CR>
setlocal isfname+=32
