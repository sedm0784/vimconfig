Original Unconverted Vimscript.

This section currently contains my entire original .vimrc file.

@heading Original vimrc. Everything in the original vimrc is pasted below:
=
" Rich's Vim Config

if &compatible
  " Vim defaults to `compatible` when selecting a vimrc with the command-line
  " `-u` argument. Override this.
  set nocompatible
endif

if has("unix")
  set shell=/bin/sh
endif

" Detect operating system ------------------------------------------------- {{{
let s:operating_system = "unknown"
if has("win32")
  let s:operating_system = "windows"
elseif has("ios")
  let s:operating_system = "ios"
elseif has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let s:operating_system = "mac"
  elseif s:uname == "Linux\n"
    let s:operating_system = "linux"
  elseif s:uname =~ "MINGW64"
    let s:operating_system = "windows"
  endif
endif
function! OperatingSystem(os) abort
  return a:os == s:operating_system
endfunction
"
" }}}
" Basic options ----------------------------------------------------------- {{{

" Turn on syntax highlighting. Ken Thompson doesn't like it, but I do.
syntax on
"
" Turn on filetype detection etc
filetype plugin indent on

" Unicode, yo
set encoding=utf-8
scriptencoding utf-8

" Leader {{{
" I use leader a lot, so make it easier to type than the default backslash.
let mapleader = ","
" For a long time, I had LocalLeader set to backslash and did an
" opposite-direction   f   repeat by pressing comma and waiting for 'timeout'.
" This is, let's say, *suboptimal*, so now I'm using the value suggested by
" :help maplocalleader: underscore. Now that I can reverse   f   efficiently
" it's all kind of academic: I don't think I've *ever* used an underscore
" motion *or* a LocalLeader mapping.
let maplocalleader = "_"
nnoremap \ ,
" }}}
" Tabs {{{

" Most of the time these will be set by Astronomer; these are just my
" defaults (for e.g. new files).
"set tabstop=2
"set shiftwidth=2
"set expandtab

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

" Do NOT "fix" last line by adding an <EOL> if one not present. If I want to
" add the <EOL> I can do so by either setting 'endofline' or 'fixeol' before
" saving.
if exists('+fixeol')
  set nofixeol
endif

" Keep this many lines above and below cursor
set scrolloff=3
" Ditto for horizontal scrolling
set sidescrolloff=10

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

" Turn off beeps
set visualbell

" Format options
set formatoptions=tcrqnj

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

" Modified version of Damian Conway's Die Blinkënmatchen: highlight matches
"
" This is how long you want the blinking to last in milliseconds. If you're
" using an earlier Vim without the `+timers` feature, you need a much shorter
" blink time because Vim blocks while it waits for the blink to complete.
let s:blink_length = has("timers") ? 500 : 100

if has("timers")
  " This is the length of each blink in milliseconds. If you just want an
  " interruptible non-blinking highlight, set this to match s:blink_length
  " by uncommenting the line below
  let s:blink_freq = 50
  "let s:blink_freq = s:blink_length
  let s:blink_match_id = 0
  let s:blink_timer_id = 0
  let s:blink_stop_id = 0

  " Toggle the blink highlight. This is called many times repeatedly in order
  " to create the blinking effect.
  function! BlinkToggle(target_pat, timer_id)
    if s:blink_match_id > 0
      " Clear highlight
      call BlinkClear()
    else
      " Set highlight
      let s:blink_match_id = matchadd('ErrorMsg', a:target_pat, 101)
      redraw
    endif
  endfunction

  " Remove the blink highlight
  function! BlinkClear()
    call matchdelete(s:blink_match_id)
    let s:blink_match_id = 0
    redraw
  endfunction

  " Stop blinking
  "
  " Cancels all the timers and removes the highlight if necessary.
  function! BlinkStop(timer_id)
    " Cancel timers
    if s:blink_timer_id > 0
      call timer_stop(s:blink_timer_id)
      let s:blink_timer_id = 0
    endif
    if s:blink_stop_id > 0
      call timer_stop(s:blink_stop_id)
      let s:blink_stop_id = 0
    endif
    " And clear blink highlight
    if s:blink_match_id > 0
      call BlinkClear()
    endif
  endfunction

  augroup die_blinkmatchen
    autocmd!
    autocmd CursorMoved * call BlinkStop(0)
    autocmd InsertEnter * call BlinkStop(0)
  augroup END
endif

function! HLNext(blink_length, blink_freq)
  let target_pat = '\c\%#'.@/
  if has("timers")
    " Reset any existing blinks
    call BlinkStop(0)
    " Start blinking. It is necessary to call this now so that the match is
    " highlighted initially (in case of large values of a:blink_freq)
    call BlinkToggle(target_pat, 0)
    " Set up blink timers.
    let s:blink_timer_id = timer_start(a:blink_freq, function('BlinkToggle', [target_pat]), {'repeat': -1})
    let s:blink_stop_id = timer_start(a:blink_length, 'BlinkStop')
  else
    " Vim doesn't have the +timers feature. Just use Conway's original
    " code.
    "
    " Highlight the match
    let ring = matchadd('ErrorMsg', target_pat, 101)
    redraw
    " Wait
    exec 'sleep ' . a:blink_length . 'm'
    " Remove the highlight
    call matchdelete(ring)
    redraw
  endif
endfunction

" Set up maps for n and N that blink the match
execute printf("nnoremap <silent> n n:call HLNext(%d, %d)<cr>", s:blink_length, has("timers") ? s:blink_freq : s:blink_length)
execute printf("nnoremap <silent> N N:call HLNext(%d, %d)<cr>", s:blink_length, has("timers") ? s:blink_freq : s:blink_length)

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
if OperatingSystem("mac")
  if has("gui_running") == 0
    " FIXME: Settle on a colorscheme
  endif
elseif OperatingSystem("windows")
  let g:zenburn_high_Contrast=1
  colorscheme zenburn
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
" {{{ Other colour tweaks
function! UpdateMiscellaneousColours() abort
  if !exists("g:colors_name")
    return
  endif

  if g:colors_name ==? "zenburn"
    " Highlight tabs like EOLs (less obtrusive)
    highlight! link SpecialKey NonText

    " Override colours used in git diffs
    highlight diffRemoved ctermfg=red
    highlight diffAdded ctermfg=green

  elseif g:colors_name ==? "solarized"
    " De-emphasize closed folds
    highlight Folded term=bold cterm=bold gui=bold guibg=NONE ctermbg=NONE

  elseif g:colors_name ==? "inkpot"
    " Highlight code in markdown
    highlight link markdownCode PreProc
    highlight link markdownCodeBlock PreProc
    " De-emphasize closed folds and tabs
    highlight Deemphasized guifg=#555555
    highlight! link Folded Deemphasized
    highlight! link SpecialKey Deemphasized
  endif
endfunction
" }}}

" Function to update colours that I don't like in color schemes
function! TweakColorScheme() abort
  call UpdateMiscellaneousColours()
endfunction

" Call it now, and also set up an autocommand to call it when we change the
" colour scheme.
call TweakColorScheme()
augroup colorschemetweaks
  autocmd!
  autocmd ColorScheme * call TweakColorScheme()
augroup END

" {{{ Display cursorline in current window only
augroup cursorline_toggle
  autocmd!
  autocmd WinLeave * setlocal nocursorline
  autocmd WinEnter * setlocal cursorline
augroup END
" }}}

" }}}
" Status Line ------------------------------------------------------------- {{{

" Always display status line
set laststatus=2

" Function to return '[+]' if file is modified {{{
function! StatuslineModified()
  if (&modified)
    return '[+]'
  else
    return ''
  endif
endfunction

" }}}
" Function to return '[-]' if file is NOT modifiable {{{
function! StatuslineModifiable() "
  if (&modifiable)
    return ''
  else
    return '[-]'
  endif
endfunction

" }}}
" Function to return the file path *without* the filename {{{
function! FilePathNoName()
  let l:path = expand("%:h")
  if strlen(l:path) > 0
    let l:path = l:path . "/"
  endif
  return l:path
endfunction
" }}}
" Function to return source control status ignoring errors {{{
"
" Calling exists() on an autoload function always appears to return false,
" even if the function has already been called. Catch the errors instead.
function! StatuslineSourceControl() abort
  try
    return " " .. fugitive#statusline() .. " " .. gutentags#statusline()
  catch /^Vim\%((\a\+)\)\=:E117:/ " catch error E117
      " Ignore errors that occur if functions don't exist
  endtry
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
set statusline+=%{StatuslineSourceControl()}  " Source control status
set statusline+=\ %=                          " >> space <<
set statusline+=dec=%b                        " Value of byte(s) under cursor in decimal (e.g. for finding ASCII/Unicode)
set statusline+=\ hex=%02.4B                  " Hex value of byte(s) under cursor
set statusline+=\ c%v/%{strlen(getline('.'))} " Character position/line length
set statusline+=\ l%l/%L                      " Line number/File length (in lines)
set statusline+=\ %p%%                        " Position in file.

" }}}
" Abbreviations/typo corrections ------------------------------------------ {{{

iabbrev unsinged unsigned

" Holding down the shift key too long when entering command-line mode:
"
cabbrev <expr> W (getcmdtype() == ':' && getcmdpos() == 2) ? 'w' : 'W'
" :wq can take an ++opt and an argument (I never use this, but ¯\_(ツ)_/¯)
cabbrev <expr> Wq (getcmdtype() == ':' && getcmdpos() == 3) ? 'wq' : 'Wq'

command! -bang Q q<bang>
command! -bang Qall qall<bang>
command! -bang Qal qall<bang>
command! -bang Cn cn<bang>
" Could (should?) also do this one with cabbrev like W. Command seems
" neater somehow.
command! -complete=option -nargs=* Set set <args>
command! -complete=option -nargs=* Setl setl <args>
command! -bang Wqall wqall<bang>

" }}}
" Mappings ---------------------------------------------------------------- {{{

" Esc turns off highlighting {{{
augroup escape_mapping
  autocmd!
  autocmd InsertEnter * call s:setupEscapeMap()
augroup END

function! s:setupEscapeMap()
  nnoremap <Esc> :noh<CR><Esc>
endfunction
" Older, possibly over-engineered version
"if !exists('g:escape_mapped')
"  augroup escape_mapping
"    autocmd!
"    autocmd InsertEnter * call s:setupEscapeMap()
"  augroup END
"endif

"function! s:setupEscapeMap()
"  nnoremap <Esc> :noh<CR><Esc>
"  let g:escape_mapped = 1
"  autocmd! escape_mapping InsertEnter *
"  augroup! escape_mapping
"endfunction
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

" No longer use par: it doesn't support format=flowed
"nnoremap <leader>rr vip:!par -q 72<CR>
"vnoremap <leader>rr :!par -q 72<CR>

" A plain `gq` will not join short lines if 'formatoptions' contains `w`. We
" must first join them.
" N.B. Make sure 'formatoptions' contains `j` before using this mapping!
nnoremap <leader>rr vipJgvgqo<Esc>
vnoremap <leader>rr Jgvgq

" }}}
" Easy vimrc Access {{{

" Source vimrc
nnoremap <leader>vs :source $MYVIMRC<cr>

" Edit vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>

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
" Use arrow keys for quickfix {{{

nnoremap <up> :cwindow<CR>
nnoremap <down> :cc<CR>
nnoremap <left> :cp<CR>
nnoremap <right> :cn<CR>
noremap! <left> <nop>
noremap! <right> <nop>
" We want to be able to use up and down for accessing command/search history
inoremap <up> <nop>
inoremap <down> <nop>

" }}}
" Disable Ex mode {{{
nnoremap Q <nop>
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
vnoremap <leader>cal y`>a = <c-r>=<c-r>0<cr><esc>:nohls<cr>
"nnoremap <leader>cal yiWEa = <c-r>=<c-r>0<cr><esc>
"nnoremap <leader>cal v?[0-9. ()*/+-]*<cr>y``a = <c-r>=<c-r>0<cr><esc>
nnoremap <leader>cal :let cal_wrap=&whichwrap<cr>:set whichwrap-=l<cr>:silent! normal l<cr>:silent! normal l<cr>?\d[0-9. ()*/+-]*<cr>y/[0-9. ()*/+-]*\d/e<cr>`]a = <c-r>=<c-r>0<cr><esc>:nohls<cr>:let &whichwrap=cal_wrap<cr>

" }}}
" }}}
" Don't search when using * and # {{{
nnoremap * *<C-o>
nnoremap # #<C-o>
" }}}
" Sane behaviour of Y (i.e. like C and D) {{{
nnoremap Y y$
" }}}
" Smart quotes {{{
nnoremap <leader>sq1 :%s/\v '(.{-})'/ \&lsquo;\1\&rsquo;/gc<cr>
nnoremap <leader>sq2 :%s/\v "(.{-})"/ \&ldquo;\1\&rdquo;/gc<cr>
nnoremap <leader>sa :%s/'/\&rsquo;/gc<cr>
" }}}
" Find in Files {{{
nnoremap <leader>ff :grep <C-R><C-W><C-F>hviw<C-G>
" This is literally the only thing I use select mode for, so I think this is
" safe to map globally. If it becomes a problem, map in CmdwinEnter autocommand.
snoremap <CR> <Esc><CR>
" }}}
" Invoke Make {{{
nnoremap <leader>mm :Make<cr>
" }}}
" File Jumps. Ctrl-O/Ctrl-I skipping current file {{{
" Skip entries in the jumplist that are in the same file
function! s:jump_skipping_file(backwards) abort
  let this_buffer = bufnr('%')
    while this_buffer == bufnr('%')
      execute "normal!" a:backwards ? "\<C-O>" : "1\<C-I>"
    endwhile
endfunction
nnoremap <leader><C-O> :call <SID>jump_skipping_file(v:true)<CR>
nnoremap <leader><C-I> :call <SID>jump_skipping_file(v:false)<CR>
" }}}
" Dictionary completion with 'nospell' {{{
"
" Dictionary completion of natural language words only works if either 'spell'
" or 'dictionary' is set. If neither is set, set 'spell' temporarily to allow
" completion.
"
inoremap <expr> <C-X><C-K> !empty(&dictionary) <bar><bar> &spell ? '<C-X><C-K>' : '<C-O>:call <SID>dictionary_complete_nospell()<CR><C-X><C-K>'

function! s:dictionary_complete_nospell() abort
  set spell
  augroup dictionary_complete_nospell
    autocmd!
    autocmd CompleteDone <buffer> ++once set nospell
  augroup END
endfunction
" }}}
" Faster tselect {{{
nnoremap <leader><C-]> :tselect <C-R><C-W><CR>
" }}}
" Visual mode zz {{{
" FIXME: I wrote this for someone asking on Mastodon, but leaving it here for
"        now so I remember to polish it, and maybe even start using it!
function! s:visual_zz() abort
  let ends = [line('v'), line('.')]
  let top = min(ends)
  let bottom = max(ends)
  let middle = line('w0') + winheight(0) / 2.0 - 0.5

  let delta_top = middle - top
  let delta_bottom = bottom - middle
  if delta_top == delta_bottom
    return ''
  elseif delta_top < delta_bottom
    let command = "\<C-E>"
  else
    let command = "\<C-Y>"
  endif
  let l:count = float2nr(abs(delta_top - delta_bottom)) / 2
  return l:count .. command
endfunction
xnoremap <expr> zz <SID>visual_zz()
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
" SyntaxQuery: Display the syntax stack at current cursor position {{{
function! s:syntax_query() abort
  for id in synstack(line("."), col("."))
    execute 'hi' synIDattr(id, "name")
  endfor
endfunction
command! SyntaxQuery call s:syntax_query()
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

  autocmd FileType mkd setlocal ai formatoptions=tcroqnj comments=n:>

  " }}}
  " AutoHotKey {{{

  " Tabs should be converted to a group of 4 spaces.
  autocmd FileType autohotkey setlocal ts=4 sw=4 expandtab
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
" The Silver Searcher / ripgrep ------------------------------------------- {{{
if executable('rg')
  " Use rg over grep
  let &grepprg = "rg --vimgrep --hidden"

  if !has("win32")
    " FIXME: This doesn't work on Windows. Don't know why.
    " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'rg -F --files %s'

    " rg is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
elseif executable('ag')
  " Use ag over grep
  let &grepprg = "ag --vimgrep --hidden"

  if !has("win32")
    " FIXME: This is untested on Windows.
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
endif
" }}}
" Use bar cursors in insert mode in terminal Vim -------------------------- {{{

if exists('$TMUX')
  " Surround escape sequences with a DCS sequence and replace <esc> with 
  " <esc><esc> for tmux to pass it on to the terminal
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif


" }}}
" Disable click-through cursor positioning when Vim not foreground app ---- {{{
augroup MouseHack
  autocmd!
  autocmd FocusLost * set mouse=
  autocmd FocusGained * call timer_start(200, 'ReenableMouse')
augroup END

function! ReenableMouse(timer_id)
  set mouse=a
endfunction
" }}}
" iVim specific config ---------------------------------------------------- {{{
if OperatingSystem("ios")

" kbd {{{
" Replace colon with backtick
  isetekbd replace {'buttons':[{'keys':[{'title':'`',
                                       \'type':'insert',
                                       \'contents':'`'}],
                              \'locations':[0]
                              \}],
                  \'locations':[9]}
" And add new button with colon/tilde
  isetekbd insert {'buttons':[
                             \{'keys':[{'title':':',
                                       \'type':'insert',
                                       \'contents':':'}]},
                             \{'keys':[{'title':'~',
                                      \ 'type':'insert',
                                      \ 'contents':'~'}],
                             \'locations':[1]}
                             \],
                  \'locations':[10,10]}
" }}}
" iVimClippy {{{
  function! s:vimclippy() abort
    edit vimclippy
    silent put! +
    $delete
    1
    augroup vimclippy
      autocmd!
      autocmd BufWriteCmd vimclippy %yank + | set nomodified
    augroup END
  endfunction

  command! VimClippy call s:vimclippy()
" }}}

  let g:gitgutter_enabled = 0
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

let g:astronomer_super_secret_debug_option=1

" Source other files ------------------------------------------------------ {{{

" Computer-specific stuff
if filereadable($HOME."/.vim/local.vim")
  source $HOME/.vim/local.vim
endif

" }}}
