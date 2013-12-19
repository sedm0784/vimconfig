" Rich's Vim Config

" Don't be like vi!
set nocompatible

" Basic options ----------------------------------------------------------- {{{

" Leader {{{
let mapleader = ","
let maplocalleader = "\\"
" }}}
" Tabs {{{

set ts=2
set sw=2
set expandtab
set smarttab

" }}}
" Indenting {{{

" Generally, I want dumb indenting on. I only want smarter indenting if I'm
" actually coding, which will be handled by plugins/filetype indenting
set autoindent
set nocindent
set nosmartindent

" }}}

" Unicode, yo
set encoding=utf-8

" Try all file formats
if has("win32")
set fileformats=dos,unix,mac
else
set fileformats=unix,dos,mac
endif

" Keep this many lines above and below cursor
set scrolloff=3

" Display as much as possible of long lines
set display+=lastline

" Allow hidden buffers
set hidden

" Fold on 3{s and manually
set foldmethod=marker

" Turn on line numbers and ruler
set number
set ruler

" Ignore case, if lowercase
set ignorecase
set smartcase

" Directions can wrap too!
set whichwrap=b,s,h,l,<,>

" Backspace can backspace over anything
set backspace=indent,eol,start

" Only break at word boundaries 
set linebreak

" Automatically read changed files if they're unchanged in vim
set autoread

" The following worked quite well for instinctive movements, but was
" counter-intuitive when I actually stopped to think about things. This turned
" out to be surprisingly often. Better to retrain myself to use the standard
" meanings.
"
" Switch word and bigword navigation
"noremap w W
"noremap W w
"noremap b B
"noremap B b
"noremap e E
"noremap E e
"noremap ge gE
"noremap gE ge

" Turn off beeps
set visualbell

" Turn on British spell checking
set spell
set spelllang=en_gb

" Format options
set formatoptions=tcrqnw

" Put new splits below and to the right of current windows
set splitbelow
set splitright

" Visually indicate matching brackets as they are entered
set showmatch
set matchtime=5

" Put all backups in one place
set backupdir=$HOME/.vim/backups

if has("win32")
  " By default, Vim would attempt to store swap files for new files in
  " c:\Windows\System32, but UAC will not allow this on Windows 7. Instead,
  " use the temp directory
  set directory=.,$TEMP
endif

" Searching {{{

" Incremental
set incsearch
" Highlighted
set hlsearch

" }}}
" Completions {{{

" Turn on wildmenu for command completion
set wildmenu

" First wildmenu invocation inserts longest substring, second inserts full
set wildmode=longest:full,full

" In insert mode, complete with a menu, inserting longest substring, and
" with extra preview info
set completeopt=menu,longest,preview

" }}}

" }}}
" Colours ----------------------------------------------------------------- {{{

" Turn on syntax highlighting
syntax on

" Colorscheme {{{

if has("win32")
else
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      if has("gui_running") == 0
        " Use 256 colours in Mac shell
        set t_Co=256
        colorscheme zenburn
      endif
    endif
  endif
endif

" }}}
" Liveblog highlighting {{{

" Find *[Tom's comments]* for liveblogs
" N.B. Had to escape the '|' chars so Vim doesn't think they are pipes
nnoremap <leader>ftc /\v\*\[[^]*]{-}\]\*/s+2<CR>
nnoremap <leader>ftnc /\v(^\[.{-}\]\*\|[^*]\[.{-}\]\*\|\*\[.{-}\]$\|\*\[.{-}\][^*])<CR>

" This is the regular expression used for finding broken comments:
" (^\[.{-}\]\*|[^*]\[.{-}\]\*|\*\[.{-}\]$|\*\[.{-}\][^*])
"
" It's an alternation built from the following four smaller regexps:
"
" Comments missing start asterisks:
" ^\[.{-}\]\*     - at start of line
" [^*]\[.{-}\]\*  - mid line
"
" Comments missing end asterisks:
" \*\[.{-}\]$     - at end of line
" \*\[.{-}\][^*]  - mid line

" }}}
" Display of whitespace, etc {{{

" Setup display of tabs and trailing whitespace
set list
"set listchars=tab:->,trail:~ 
"set listchars=tab:->
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«

" Highlight whitespace at the end of lines
" from http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
augroup highlightwhitespace
  autocmd!
  autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\v\s+%#@!$/
  autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\v\s+$/
augroup END
highlight EOLWS guibg=red ctermbg=red

" }}}
" {{{ MBE color tweaks

" Defaults
"hi link MBENormal                Comment
"hi link MBEChanged               String
"hi link MBEVisibleNormal         Special
"hi link MBEVisibleActive         Boolean
"hi link MBEVisibleChanged        Special
"hi link MBEVisibleChangedActive  Error
hi link MBENormal                Comment
hi link MBEChanged               String
hi link MBEVisibleNormal         Special
hi link MBEVisibleActive         DiffAdd
hi link MBEVisibleChanged        String
hi link MBEVisibleChangedActive  Error

" }}}

" }}}
" Status Line ------------------------------------------------------------- {{{

" Always display status line
set laststatus=2

" Function to return '[+]' if file is modified
function! StatuslineModified() " {{{
  if (&modified)
    return '[+]'
  else
    return ''
  endif
endfunction

" }}}
" Function to return '[-]' if file is NOT modifiable
function! StatuslineModifiable() " {{{
  if (&modifiable)
    return ''
  else
    return '[-]'
  endif
endfunction

" }}}

set statusline=%f%r%h%w%q                     " Relative filepath and statusjk
set statusline+=%#Error#                      " Set highlight
set statusline+=%{StatuslineModified()}       " Display if modified
set statusline+=%*                            " Revert to usual coloring
set statusline+=%{StatuslineModifiable()}     " Display if file *not* modifiable
set statusline+=\ %Y,%{&ff},%{&fileencoding}  " Filetype and file format
set statusline+=\ %{fugitive#statusline()}    " Git status
set statusline+=\ %=                          " >> space <<
set statusline+=dec=%b                        " Value of byte(s) under cursor in decimal (e.g. for finding ASCII/Unicode)
set statusline+=\ hex=%02.4B                  " Hex value of byte(s) under cursor
set statusline+=\ c%v/%{strlen(getline('.'))} " Character position/line length
set statusline+=\ l%l/%L                      " Line number/File length (in lines)
set statusline+=\ %p%%                        " Position in file.

" }}}
" Abbreviations ----------------------------------------------------------- {{{

iabbrev unsinged unsigned

cabbrev Set set
cabbrev Wq wq
cabbrev W w
cabbrev Q q

" }}}
" Mappings ---------------------------------------------------------------- {{{

" Esc turns off highlighting {{{
nnoremap <esc> :noh<return><esc>
" (Thanks to
" http://www.viemu.com/blog/2009/06/16/a-vim-and-viemu-mapping-you-really-cant-miss-never-type-noh-again/)

" }}}
" Always use very magic searches {{{

nnoremap / /\v
nnoremap ? ?\v

" }}}
" RISC OS style F3 saving {{{

nnoremap #3 :browse w<CR>

" }}}
" Quick email reformat (Re-wRap) {{{

nnoremap <leader>rr vip:!par -q 72<CR>
vnoremap <leader>rr :!par -q 72<CR>

" }}}
" Easy vimrc Access {{{

" Source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit vimrc
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Can't use this on Windows, because it overwrites softlink
    " Instead it's defined in local.vim
    :nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  endif
endif

" }}}
" Navigate wrapped lines visually by default {{{

noremap j gj
noremap gj j
noremap k gk
noremap gk k

" }}}
" Quicker window nav {{{
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
" }}}
" Disable arrow keys {{{

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap! <left> <nop>
noremap! <right> <nop>
" We want to be able to use up and down for accessing command/search history
inoremap <up> <nop>
inoremap <down> <nop>

" }}}
" Turning spell checking on and off {{{
nnoremap <leader>s1 :setlocal spell<cr>
nnoremap <leader>s0 :setlocal nospell<cr>
" }}}
" Turning list on and off {{{
nnoremap <leader>l1 :setlocal list<cr>
nnoremap <leader>l0 :setlocal nolist<cr>
" }}}
" Turn expandtab on and off {{{
nnoremap <leader>e1 :setlocal expandtab<cr>
nnoremap <leader>e0 :setlocal noexpandtab<cr>
" }}}
" Don't search when using * and # {{{
nnoremap * *<C-o>
nnoremap # #<C-o>
" }}}
" Sane behaviour of Y (i.e. like C and D) {{{
nnoremap Y y$
" }}}

" }}}
" Filetype options -------------------------------------------------------- {{{

augroup filetypeoptions
  autocmd!

  " C/CPP {{{

  autocmd FileType cpp,c setlocal fo=cq

  " }}}
  " ConqueTerm {{{

  " Turn off listing of trailing spaces
  autocmd FileType conque_term setlocal listchars=tab:->
augroup END

  " }}}
  " Markdown {{{

  autocmd FileType mkd setlocal ai formatoptions=tcroqn2 comments=n:>

  " }}}
  " AutoHotKey {{{

  " Tabs should be converted to a group of 4 spaces.
  autocmd FileType autohotkey setlocal ts=4 sw=4 expandtab
  " }}}
  " Python {{{

  " Tabs should be converted to a group of 4 spaces.
  " This is the official Python convention
  " (http://www.python.org/dev/peps/pep-0008/)
  autocmd FileType python setlocal ts=4 sw=4 fo=cq expandtab

  " }}}
  " Vim {{{

  autocmd FileType vim setlocal foldmethod=marker

  " }}}
  " Objective C {{{

  " Convert tabs to 4 spaces, which is how Xcode is setup by default
  autocmd FileType objc setlocal ts=4 sw=4
  autocmd FileType objcpp setlocal ts=4 sw=4

  " }}}

" }}}
" Use iTerm2 bar cursors in insert mode in terminal Vim {{{

" iTerm2 is OS X only
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " tmux will only forward escape sequences to the terminal if surrounded by a
    " DCS sequence
    " http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
  endif
endif

" }}}
" Plugins ----------------------------------------------------------------- {{{

" Pathogen {{{

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" }}}

" Required for NERD Commenter and just general goodness
filetype plugin indent on

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
" minibufexpl.vim {{{

" Allow <Ctrl>+<Tab> and <Ctrl>+<Shift>+<Tab> to switch between buffers
let g:miniBufExplMapCTabSwitchBufs = 1
" Try to place buffers into a windows which has a modifiable buffer (for
" compatability with taglist and nerdtree etc
let g:miniBufExplModSelTarget = 1
" Let mbe attempt to force syntax coloring to workaround a vim bug
" Commented out until c.vim syntax highlighting bugs are fixed
" let g:miniBufExplForceSyntaxEnable = 1
" MiniBufExplorer always on top
let g:miniBufExplSplitBelow = 0

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
let g:ctrlp_cmd = 'CtrlPBuffer'

" }}}
" Utl {{{

let g:utl_cfg_hdl_mt_generic = "silent !open '%p'"
let g:utl_cfg_hdl_scm_http_system = "silent !open '%u'"

" }}}

" }}}
" Source other files ------------------------------------------------------ {{{

" Computer-specific stuff
if filereadable($HOME."/.vim/local.vim")
  source $HOME/.vim/local.vim
endif

" }}}

