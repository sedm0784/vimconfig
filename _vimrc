" Rich's Vim Config

" N.B. Vim defaults to `nocompatible` whenever a vimrc or gvimrc is found
" during startup, so it's generally NOT necessary in a personal vimrc file,
" despite so many vim beginner guides recommending it.
"
" However, Vim defaults to `compatible` when selecting a vimrc with the
" command-line `-u` argument, so keeping this option just in case.
set nocompatible

if has("unix")
  set shell=/bin/sh
endif

" Pathogen {{{

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory

" If you need to disable some or all of the plugins loaded by pathogen, add
" them to the `g:pathogen_disabled` variable, like this:
"let g:pathogen_disabled=['plugin-name', 'another-plugin-name']

call pathogen#infect()
call pathogen#helptags()
" Turn on syntax highlighting
syntax on
" Turn on filetype detection etc
filetype plugin indent on

" }}}

" Basic options ----------------------------------------------------------- {{{

" Unicode, yo
set encoding=utf-8
scriptencoding utf-8

" Leader {{{
let mapleader = ","
let maplocalleader = "\\"
" }}}
" Tabs {{{

set smarttab
" Most of the time these will be set by Astronomer; these are just my
" defaults (for e.g. new files).
set tabstop=2
set shiftwidth=2
set expandtab

" }}}
" Indenting {{{

" Generally, I want dumb indenting on. I only want smarter indenting if I'm
" actually coding, which will be handled by plugins/filetype indenting
set autoindent
set nocindent
set nosmartindent

" }}}

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
" Indent all parts of wrapped lines equally
if exists('+breakindent')
  set breakindent
endif

" Automatically read changed files if they're unchanged in vim
set autoread

" Don't double space sentences when doing `J`, `gq`
set nojoinspaces

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

" Show incomplete commands in last line of screen
set showcmd

" Searching {{{

" Incremental
set incsearch
" Highlighted
set hlsearch

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

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

" Colorscheme {{{

if has("win32")
else
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      if has("gui_running") == 0
        "colorscheme zenburn
        set background=dark
        let g:solarized_termcolors=16
        colorscheme solarized
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
" Function to return the file path *without* the filename
" {{{
function! FilePathNoName()
  let l:path = expand("%:h")
  if strlen(l:path) > 0
    let l:path = l:path . "/"
  endif
  return l:path
endfunction
" }}}

set statusline=%{FilePathNoName()}            " File path
set statusline+=%#Question#                   " Set highlight
set statusline+=%t                            " File name
set statusline+=%*                            " Revert to usual coloring
set statusline+=%r%h%w%q                      " File status
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
" Abbreviations/typo corrections -------------------------------- {{{

iabbrev unsinged unsigned

cabbrev Set set
cabbrev Wq wq
cabbrev W w
cabbrev Q q
cabbrev Qall qall

" }}}
" Mappings ---------------------------------------------------------------- {{{

" Esc turns off highlighting {{{
if !exists('g:escape_mapped')
  augroup escape_mapping
    autocmd!
    autocmd InsertEnter * call s:setupEscapeMap()
  augroup END
endif

function! s:setupEscapeMap()
  nnoremap <Esc> :noh<CR><Esc>
  let g:escape_mapped = 1
  autocmd! escape_mapping InsertEnter *
  augroup! escape_mapping
endfunction
" Thanks to:
"   http://www.viemu.com/blog/2009/06/16/a-vim-and-viemu-mapping-you-really-cant-miss-never-type-noh-again/
" Need to be setup in an autocmd because it inteferes with startup terminal
" escape codes:
"   https://vi.stackexchange.com/questions/2614/why-does-this-esc-nmap-affect-startup
"
"
"

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
:nnoremap <leader>vs :source $MYVIMRC<cr>

" Edit vimrc
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Can't use this on Windows, because it overwrites softlink
    " Instead it's defined in local.vim
    :nnoremap <leader>ve :vsplit $MYVIMRC<cr>
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
" Setting toggles {{{
" Turning spell checking on and off {{{
nnoremap <leader>s :setlocal spell!<cr>:set spell?<cr>
" }}}
" Turning list on and off {{{
nnoremap <leader>l :setlocal list!<cr>:set list?<cr>
" }}}
" Turn expandtab on and off {{{
nnoremap <leader>e :setlocal expandtab!<cr>:set expandtab?<cr>
" }}}
" Turning wrap on and off {{{
nnoremap <leader>w :setlocal nowrap!<cr>:set wrap?<cr>
" }}}
" Turn colour column on and off {{{
function! ToggleColorColumn()
  if ! &colorcolumn
    if !exists("b:oldcolorcolumn")
      let b:oldcolorcolumn = 81
    endif
    execute "setlocal colorcolumn=" . b:oldcolorcolumn
  else
    let b:oldcolorcolumn = &l:colorcolumn
    setlocal colorcolumn=
  endif
endfunction

nnoremap <silent> <leader>c :call ToggleColorColumn()<cr>
" }}}
" Calculator {{{
vnoremap <leader>cal y`>a = <c-r>=<c-r>0<cr><esc>
"nnoremap <leader>cal yiWEa = <c-r>=<c-r>0<cr><esc>
nnoremap <leader>cal v?\v[0-9.+-/*() ]*<cr>y``a = <c-r>=<c-r>0<cr><esc>

" }}}
" }}}
" Don't search when using * and # {{{
nnoremap * *<C-o>
nnoremap # #<C-o>
" }}}
" Sane behaviour of Y (i.e. like C and D) {{{
nnoremap Y y$
" }}}
" The Silver Searcher {{{
if executable('ag')
  " Use ag over grep
  let &grepprg = "ag --vimgrep --hidden"
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " FIXME: Doesn't respect .gitignore. Why?
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f'
    \ }

endif
" }}}
" Smart quotes {{{
nnoremap <leader>sq1 :%s/\v '(.{-})'/ \&lsquo;\1\&rsquo;/gc<cr>
nnoremap <leader>sq2 :%s/\v "(.{-})"/ \&ldquo;\1\&rdquo;/gc<cr>
nnoremap <leader>sa :%s/'/\&rsquo;/gc<cr>
" }}}

" }}}
" New Commands ------------------------------------------------------------ {{{
" DiffSaved {{{
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffSaved call s:DiffWithSaved()
" }}}
" }}}
" Filetype options -------------------------------------------------------- {{{

" FIXME: It would be better to use ~/.vim/after/ftplugin/<filetype>.vim files
" for these settings. (So as not to have to use autocommands).

augroup filetypeoptions
  autocmd!

  " C/CPP {{{

  autocmd FileType cpp,c setlocal fo=cq

  " }}}
  " ConqueTerm {{{

  " Turn off listing of trailing spaces
  autocmd FileType conque_term setlocal listchars=tab:->

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
  autocmd FileType objc setlocal ts=4 sw=4 expandtab
  autocmd FileType objcpp setlocal ts=4 sw=4 expandtab

  " }}}
augroup END

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

" Keep minibuf explorer on top when moving windows
nnoremap <c-w>H :MBEToggle<cr><c-w>H:MBEToggle<cr>
nnoremap <c-w>J :MBEToggle<cr><c-w>J:MBEToggle<cr>
nnoremap <c-w>K :MBEToggle<cr><c-w>K:MBEToggle<cr>
nnoremap <c-w>L :MBEToggle<cr><c-w>L:MBEToggle<cr>
" Keep minibuf explorer displayed when removing all splits

nnoremap <c-w>o <c-w>o:MBEToggle<cr>

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

" }}}

let g:astronomer_super_secret_debug_option=1

" Source other files ------------------------------------------------------ {{{

" Computer-specific stuff
if filereadable($HOME."/.vim/local.vim")
  source $HOME/.vim/local.vim
endif

" }}}
