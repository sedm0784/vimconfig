Plugin Configuration.

Plugin-specific configuration options.

@ This section contains options and other configuration tweaks I have for
various plugins I have installed. Weirdly, they mostly seem to be options for
plugins I rarely use. (Whereas the plugins I DO use on a more daily basis seem
to be more of the out-of-the-box type. Go figure!)

@heading A.vim.
A is a terrific little plugin that adds the command |:A| for switching quickly
between "alternate" files. In my use, this means switching between header and
implementation files. I add a few extra extensions so it works properly with
Objective-C/C++ files.
=
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC,m,mm"
let g:alternateExtensions_H = "C,CPP,CXX,CC,M,MM"
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_CPP = "H,HPP"
let g:alternateExtensions_c = "h"
let g:alternateExtensions_C = "H"
let g:alternateExtensions_cxx = "h"
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h"

@heading CtrlP.
CtrlP is a terrific buffer/file opening plugin, but these days I only really
use it for its Most Recently Used list. These are the options I used back
before I became an odious vanilla-Vim hipster when I used it for everything.
=
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

if executable('rg')
  if !has("win32")
    " FIXME: This doesn't work on Windows. I don't know why!
    " Use rg in CtrlP for listing files.
    let g:ctrlp_user_command = 'rg -F --files %s'

+  55     " FIXME: This is untested on Windows.
    " rg is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
elseif executable('ag')
  if !has("win32")
    " FIXME: This is untested on Windows.
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
endif

if !exists("g:ctrlp_user_command")
  " If the variable already exists, it's because we set it to use ripgrep or the
  " Silver Searcher, above. `git ls-files` is actually slightly faster in my
  " testing, but keep using the existing value because it will also find new
  " files that haven't been added to the repository yet.
  let g:ctrlp_user_command = { 'types': { 1: ['.git', 'cd %s && git ls-files'], 2: ['.hg', 'hg --cwd %s locate -I .'], }, 'fallback': 'find %s -type f' }
endif

@heading GetLatestScripts.
GetLatestScripts is a slightly odd plugin for obtaining and installing plugins
that predates the packaging plugin you're probably using by many years. I
thought it was kind of cool though, and installed a handful of plugins with it
before Tim Pope wrote pathogen.
=
" Automatic installation
let g:GetLatestVimScripts_allowautoinstall=1

@heading Gundo.
Gundo is a great plugin for visualising and navigating the undo tree, but it
doesn't work half the time because most of my Vim installations don't have
functioning Python integrations[1][2], and so these days I mostly get by with
the |g-|/|g+| normal mode commands and the |:earlier| and |:later| ex
commands. But every now and again it's useful, so I still have this mapping to
open it quickly.

[1] One day I will get to grips with how to get the Vim/Python interface
configured reliably on all operating systems.

[2] Undotree does roughly the same thing as Gundo in native Vimscript, so if
this feature sounds interesting to you I'd recommend trying that out first.
=
nnoremap <F5> :GundoToggle<CR>

@ The auther of Gundo, Steve Losh, is also responsible for two other highly
significant facets of my Vim experience:

(1) He either INVENTED or perhaps just POPULARISED the idea of mapping your
Caps Lock key to act like Ctrl when held down or Escape when tapped. This is
LOVELY to use, but also TERRIBLE because whenever I type on someone else's
computer I'm constantly toggle Caps Lock at inappropriate times.

(2) //He taught me Vimscript. -> https://learnvimscriptthehardway.stevelosh.com//

@heading SuperTab.
Coming from other editors, SuperTab is one of the very first plugins I
installed. I don't love it, and keep meaning to investigate other plugins or
just see if I can get used to just using only the native CTRL-X keystrokes for
completions, but, for now, this is how I complete.
=
" Default completion type
let g:SuperTabDefaultCompletionType = "context"

" Fallback completion type
let g:SuperTabContextDefaultCompletionType = "<c-p>"
" Use enhanced longest match so you can continue doing longest substring
" after typing more letters
let g:SuperTabLongestEnhanced = 1

@heading Tagbar.
Tagbar is a plugin that opens a separate window containing the tags in the
current file to allow you to get an overview of its structure. I use it
infrequently, but like to be able to open it quickly when I do.
=
nnoremap <leader>tbt :TagbarToggle<CR>

@heading TwitVim.
Reading and writing tweets inside Vim was SO COOL. Of course it's hopelessly
broken these days. These options are only still in here because of NOSTALGIA.
=
let twitvim_enable_python = 1
let twitvim_browser_cmd = 'firefox.exe'
let twitvim_count = 50

@heading Utl.
Utl is a plugin for detecting and opening various types of links within the
buffer's contents. I'm pretty sure I only installed it because it's a
dependency of vim-orgmode[1] and I have no recollection of setting up the
following options. Looks like they're configuring certain types of links to
open with macOS's built in |open| command.

[1] which I haven't used for years.
=
let g:utl_cfg_hdl_mt_generic = "silent !open '%p'"
let g:utl_cfg_hdl_scm_http_system = "silent !open '%u'"

@heading Vim-Slime.
Original and best.

Actually I don't know if it's the best[1] Vim slime-a-like, but it's the one I
discovered first, and I like it.

[1] Or, indeed, the original.
=
if has('terminal')
  let g:slime_target = "vimterminal"
else
  let g:slime_target = "tmux"
endif

@ An extra thanks to Vim-Slime's author: Jonathan Palardy, for
//teaching me awk -> https://blog.jpalardy.com/posts/why-learn-awk///.
