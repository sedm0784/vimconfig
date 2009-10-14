"Rich's Stuff

"Don't be like vi!
set nocompatible

"Tabs should be converted to a group of 4 spaces.
"This is the official Python convention
"(http://www.python.org/dev/peps/pep-0008/)
set ts=2
set sw=2
set expandtab
set smarttab

"setup display of tabs and trailing whitespace, but turn it off by default
set nolist
set listchars=tab:->,trail:~ 

"Keep this many lines above and below cursor
set scrolloff=3

"RISC OS style F3 saving
map #3 :browse w<CR>

"Allow hidden buffers
set hidden

"Fold on 3{s and manually
set foldmethod=marker

"turn on line numbers and ruler
set number
set ruler

"ignore case, if lowercase
set ignorecase
set smartcase

"directions can wrap too!
set whichwrap=b,s,h,l,<,>

"backspace can backspace over anything
set backspace=indent,eol,start

"only break at word boundaries 
set linebreak

"navigate wrapped lines visually
map j gj
map k gk

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"switch word and bigword navigation
noremap w W
noremap W w
noremap b B
noremap B b
noremap e E
noremap E e
noremap ge gE
noremap gE ge

"Searching
"Incremental
set incsearch
"Highlighted
set hlsearch
"With Esc mapped to turn off highlighting. Genius!
:nnoremap <esc> :noh<return><esc>
"(Thanks to http://www.viemu.com/blog/2009/06/16/a-vim-and-viemu-mapping-you-really-cant-miss-never-type-noh-again/)

"Turn on syntax highlighting
syntax on

"Turn on wildmenu for command completion
set wildmenu

"First wildmenu invocation inserts longest substring, second inserts full
set wildmode=longest:full,full

"In insert mode, complete with a menu, inserting longest substring
set completeopt=menu,longest

"Turn off beeps
set visualbell

"Turn on spell checking
set spell

"Posh statusline, always present
set statusline=%F%m%r%h%w\ [FMT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [0x=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

"format options
set formatoptions=tcroqnw

"Put all backups in one place
set backupdir=$HOME/.vim/backups

" PLUGINS AND EXTENSIONS
" ======================
"GetLatestScripts automatic installation
let g:GetLatestVimScripts_allowautoinstall=1

"Use CPP comments in std_c c.vim syntax highlighting
let c_cpp_comments = 0

"cppomnicomplete stuff
set completeopt-=preview

"minibufexpl.vim
" Allow <Ctrl>+<Tab> and <Ctrl>+<Shift>+<Tab> to switch between buffers
let g:miniBufExplMapCTabSwitchBufs = 1
" Try to place buffers into a windows which has a modifiable buffer (for
" compatability with taglist and nerdtree etc
let g:miniBufExplModSelTarget = 1
" Let mbe attempt to force syntax coloring to workaround a vim bug
" Commented out until c.vim syntax highlighting bugs are fixed
"let g:miniBufExplForceSyntaxEnable = 1

"taglist stuff
:map <leader>tlt :TlistToggle<CR>

"Fuzzyfinder Textmate mode
:map <leader>tm :FuzzyFinderTextMate<CR>

" markdown format options
augroup mkd
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:>
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END


" NEURATRON SPECIFIC BUILD STUFF
" ==============================

" Don't set directory. It seems to get set by something
" else later on (visvim, perhaps?)
":cd D:\Neuratron\Neuratron\ PhotoScore_Unicode
:set makeprg=buildAudioScoreDebug.bat
:set errorformat=1>%f(%l)\ :\ error\ C%n:\ %m

"End of Rich's Stuff

" ******************************************************

set nocompatible
