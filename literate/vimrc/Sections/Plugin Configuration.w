Plugin Configuration.

@heading FIXME Original Unconverted.
=
" Plugins ----------------------------------------------------------------- {{{

" GetLatestScripts {{{

" Automatic installation
let g:GetLatestVimScripts_allowautoinstall=1

" }}}
" std_c c.vim {{{

" Use CPP comments in syntax highlighting
let c_cpp_comments = 0

" }}}
" cppomnicomplete {{{

"set completeopt-=preview

" }}}
" tagbar {{{

nnoremap <leader>tbt :TagbarToggle<CR>

" }}}
" TwitVim {{{

let twitvim_enable_python = 1
let twitvim_browser_cmd = 'firefox.exe'
let twitvim_count = 50
let twitvim_bitly_user = "sedm0784"
let twitvim_bitly_key = "R_9dab47b2ba36972d08a4509ef2552156"

" }}}
" SuperTab {{{

" Default completion type
let g:SuperTabDefaultCompletionType = "context"

" Fallback completion type
let g:SuperTabContextDefaultCompletionType = "<c-p>"
" Use enhanced longest match so you can continue doing longest substring
" after typing more letters
let g:SuperTabLongestEnhanced = 1

" }}}
" Gundo {{{

nnoremap <F5> :GundoToggle<CR>

" }}}
" CtrlP {{{

let g:ctrlp_map = '<leader><leader>'
" Start in buffer mode. Then press <c-f> for MRU, <c-b> for file search
let g:ctrlp_cmd = 'CtrlPBuffer'
" Search file names (not full paths) by default. Press <c-d> to toggle
let g:ctrlp_by_filename = 1
" Set working directory based on current file, pwd if an ancestor, nearest
" ancestor with a .git file
let g:ctrlp_working_path_mode = 'ra'
" Update match window after typing stops for 250ms
let g:ctrlp_lazy_update = 250
" Ignore Mac temp files
let g:ctrlp_mruf_exclude = '\v(\/private)?\/var\/folders\/t\d\/.*'

if !exists("g:ctrlp_user_command")
  " If the variable already exists, it's because we set it to use ripgrep or the
  " Silver Searcher, above. `git ls-files` is actually slightly faster in my
  " testing, but keep using the existing value because it will also find new
  " files that haven't been added to the repository yet.
  let g:ctrlp_user_command = { 'types': { 1: ['.git', 'cd %s && git ls-files'], 2: ['.hg', 'hg --cwd %s locate -I .'], }, 'fallback': 'find %s -type f' }
endif

" }}}
" Utl {{{

let g:utl_cfg_hdl_mt_generic = "silent !open '%p'"
let g:utl_cfg_hdl_scm_http_system = "silent !open '%u'"

" }}}
" NERDCommenter {{{
" Add comment markers at very start of line
let NERDDefaultAlign = 'start'
" Don't remove extra spaces when removing comments (because it clashes with
" 'start' setting above
let NERDRemoveExtraSpaces = 0
" }}}
" A.vim {{{
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC,m,mm"
let g:alternateExtensions_H = "C,CPP,CXX,CC,M,MM"
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_CPP = "H,HPP"
let g:alternateExtensions_c = "h"
let g:alternateExtensions_C = "H"
let g:alternateExtensions_cxx = "h"
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h"
" }}}
" Vim-Slime {{{
if has('terminal')
  let g:slime_target = "vimterminal"
else
  let g:slime_target = "tmux"
endif
" }}}

" }}}
