set makeprg=literate/generate-all.sh\ /mnt/wd1/3rdPartyCode/inweb/Tangled/inweb
let &errorformat = '%.%#: %f\, line %l: %m'
nnoremap <silent> <buffer> ,mm :set isfname+=32<CR>:make<CR>:set isfname-=32<CR>:cwindow<CR>
setlocal isfname+=32
