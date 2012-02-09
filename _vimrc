"Rich's Stuff

"Don't be like vi!
set nocompatible

set ts=2
set sw=2
set expandtab
set smarttab

" Generally, I want dumb indenting on. I only want smarter indenting if I'm
" actually coding, which will be handled by plugins/filetype indenting
set autoindent
set nocindent
set nosmartindent

"setup display of tabs and trailing whitespace
set list
"set listchars=tab:->,trail:~ 
set listchars=tab:->

"Keep this many lines above and below cursor
set scrolloff=3

"Display as much as possible of long lines
set display+=lastline

"RISC OS style F3 saving
map #3 :browse w<CR>

"Searching for Tom's comments in liveblogs
nnoremap #4 /\*\[.\{-}\]\*/s+2<CR>

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

"navigate wrapped lines visually by default
noremap j gj
noremap gj j
noremap k gk
noremap gk k

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
"noremap w W
"noremap W w
"noremap b B
"noremap B b
"noremap e E
"noremap E e
"noremap ge gE
"noremap gE ge

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

"In insert mode, complete with a menu, inserting longest substring, and
"with extra preview info
set completeopt=menu,longest,preview

"Turn off beeps
set visualbell

"Turn on British spell checking
set spell
set spelllang=en_gb

"Posh statusline, always present
set statusline=%f%m%r%h%w\ %Y,%{&ff}\ %{fugitive#statusline()}\ %=ascii=%b\ hex=%02.2B\ c%v/%{strlen(getline('.'))}\ l%l/%L\ %p%%
set laststatus=2

"format options
set formatoptions=tcrqnw

"Put new splits below and to the right of current windows
set splitbelow
set splitright

"Visually indicate matching brackets as they are entered
set showmatch
set matchtime=5

"Put all backups in one place
set backupdir=$HOME/.vim/backups

if has("win32")
  "By default, Vim would attempt to store swap files for new files in c:\Windows\System32, but UAC will not allow this on Windows 7. Instead, use the temp directory
  set directory=.,$TEMP
endif

if has("win32")
else
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      if has("gui_running") == 0
        "Use 256 colours in Mac shell
        set t_Co=256
        colorscheme zenburn
      endif
    endif
  endif
endif

"Quick email reformat (Re-wRap)
vmap <leader>rr :!par -q 72<CR>

"Source common spelling corrections
source $HOME/.vim/iabbrev.vim

" Highlight whitespace at the end of lines
" from http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS guibg=red

" My filetype options
augroup filetypeoptions
  " Markdown options
  autocmd FileType mkd setlocal ai formatoptions=tcroqn2 comments=n:>

  " Python options
  "Tabs should be converted to a group of 4 spaces.
  "This is the official Python convention
  "(http://www.python.org/dev/peps/pep-0008/)
  autocmd FileType python setlocal ts=4 sw=4 fo=cq

  autocmd FileType cpp,c setlocal fo=cq

  " ConqueTerm Options
  " Turn off listing of trailing spaces
  autocmd FileType conque_term setlocal listchars=tab:->
augroup END

" PLUGINS AND EXTENSIONS
" ======================

" Use pathogen to easily modify the runtime path to include all " plugins under the ~/.vim/bundle directory
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Required for NERD Commenter and just general goodness
filetype plugin indent on

"GetLatestScripts automatic installation
let g:GetLatestVimScripts_allowautoinstall=1

"Use CPP comments in std_c c.vim syntax highlighting
let c_cpp_comments = 0

"cppomnicomplete stuff
"set completeopt-=preview

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

"TwitVim
let twitvim_enable_python = 1
let twitvim_browser_cmd = 'firefox.exe'
let twitvim_count = 50
let twitvim_bitly_user = "sedm0784"
let twitvim_bitly_key = "R_9dab47b2ba36972d08a4509ef2552156"

"SuperTab
"Default completion type
let g:SuperTabDefaultCompletionType = "context"
"Fallback completion type
let g:SuperTabContextDefaultCompletionType = "<c-p>"
"Use enhanced longest match so you can continue doing longest substring
"after typing more letters
let g:SuperTabLongestEnhanced = 1

"Gundo
nnoremap <F5> :GundoToggle<CR>

" NEURATRON SPECIFIC BUILD STUFF
" ==============================

" Don't set directory. It seems to get set by something
" else later on (visvim, perhaps?)
":cd D:\Neuratron\Neuratron\ PhotoScore_Unicode
:set makeprg=buildAudioScoreDebug.bat
:set errorformat=1>%f(%l):\ error\ C%n:\ %m

"End of Rich's Stuff

" ******************************************************

set nocompatible
