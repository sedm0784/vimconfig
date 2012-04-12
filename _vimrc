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
nnoremap #3 :browse w<CR>

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
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap! <left> <nop>
noremap! <right> <nop>
"We want to be able to use up and down for accessing command/search
"history
inoremap <up> <nop>
inoremap <down> <nop>

"The following worked quite well for instinctive movements, but was
"counter-intuitive when I actually stopped to think about things. This turned
"out to be surprisingly often. Better to retrain myself to use the standard
"meanings.
"
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
nnoremap <esc> :noh<return><esc>
"(Thanks to http://www.viemu.com/blog/2009/06/16/a-vim-and-viemu-mapping-you-really-cant-miss-never-type-noh-again/)

"Turn on syntax highlighting
syntax on

"Find *[Tom's comments]* for liveblogs
nnoremap <leader>ftc /\*\[[^]*]\{-}\]\*/s+2<CR>
nnoremap <leader>ftnc /\(^\[.\{-}\]\*\\|[^*]\[.\{-}\]\*\\|\*\[.\{-}\]$\\|\*\[.\{-}\][^*]\)<CR>

"This is the regular expression used for finding broken comments:
"\(^\[.\{-}\]\*\|[^*]\[.\{-}\]\*\|\*\[.\{-}\]$\|\*\[.\{-}\][^*]\)
"
"It's an alternation built from the following four smaller regexps:
"
"Comments missing start asterisks:
"^\[.\{-}\]\*     - at start of line
"[^*]\[.\{-}\]\*  - mid line
"
"Comments missing end asterisks:
"\*\[.\{-}\]$     - at end of line
"\*\[.\{-}\][^*]  - mid line

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
"set statusline=%f%m%r%h%w\ %Y,%{&ff}\ %{fugitive#statusline()}\ %=ascii=%b\ hex=%02.2B\ c%v/%{strlen(getline('.'))}\ l%l/%L\ %p%%
set statusline=%f%m%r%h%w                     " Relative filepath and status
set statusline+=\ %Y,%{&ff}                   " Filetype and file format
set statusline+=\ %{fugitive#statusline()}    " Git status
set statusline+=\ %=                          " >> space <<
set statusline+=ascii=%b                      " ASCII of char under cursor
set statusline+=\ hex=%02.2B                  " Hex value of char under cursor
set statusline+=\ c%v/%{strlen(getline('.'))} " Character position/line length
set statusline+=\ l%l/%L                      " Line number/File length (in lines)
set statusline+=\ %p%%                        " Position in file.
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
nnoremap <leader>rr vip:!par -q 72<CR>
vnoremap <leader>rr :!par -q 72<CR>

"Source common spelling corrections
source $HOME/.vim/iabbrev.vim

"Mapping to source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
"Mapping to edit vim
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    "Can't use this on Windows, because it overwrites softlink
    "Instead it's defined in local.vim
    :nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  endif
endif

" Highlight whitespace at the end of lines
" from http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
augroup highlightwhitespace
  autocmd!
  autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
  autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
augroup END
highlight EOLWS guibg=red ctermbg=red

"Local stuff
if filereadable($HOME."/.vim/local.vim")
  source $HOME/.vim/local.vim
endif

" My filetype options
augroup filetypeoptions
  autocmd!

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

"Use iTerm2 bar cursors in insert mode in terminal Vim
"
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


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
nnoremap <leader>tlt :TlistToggle<CR>

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

"CtrlP
let g:ctrlp_map = '<leader><leader>'

" NEURATRON SPECIFIC BUILD STUFF
" ==============================

" Don't set directory. It seems to get set by something
" else later on (visvim, perhaps?)
":cd D:\Neuratron\Neuratron\ PhotoScore_Unicode
set makeprg=buildAudioScoreDebug.bat
set errorformat=1>%f(%l):\ error\ C%n:\ %m

"End of Rich's Stuff

" ******************************************************

set nocompatible
