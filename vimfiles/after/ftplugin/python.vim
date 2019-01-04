" Tab settings per PEP 8
"
" We're going to let tabs display as the standard 8 characters, and use
" 'shiftwidth' and 'expandtab' to indent by 4 spaces.
"
" 'smarttab' is also set so that <BS> at the start of a line removes
" spaces.
"
" We could also have achieved this by setting 'softtabstop' to a negative value:
" The difference between the two occurs when you press <Tab> and you're *not* at
" the start of a line:
"
" - with `set smarttab`, <Tab> will jump to the next 'tabstop'
" - with `set softtabstop=-1`, <Tab> will jump to the next 'shiftwidth'
"
setlocal tabstop=8 shiftwidth=4 softtabstop=0 smarttab expandtab
setlocal list

" Auto formatting
"
" c - automatic formatting of comments (using the 'textwidth' setting below)
" q - `gq` formatting of comments
" j - remove comment leaders when joining lines
" r - add comment leader when pressing <Enter>
"
setlocal formatoptions=cqjr
setlocal textwidth=79

setlocal colorcolumn=80

" Set up 'makeprg' and 'errorformat'
compiler flake8
