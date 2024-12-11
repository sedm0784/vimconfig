Colours and Highlighting.

Making it pretty.

@heading Setting the colour scheme.

N.B. I my GUI Vim colorscheme in //my gvimrc -> gvimrc//.
=
if has('gui_running') == 0
  if OperatingSystem('mac')
    " FIXME: Settle on a colorscheme
  elseif OperatingSystem('windows')
    let g:zenburn_high_Contrast=1
    colorscheme zenburn
  elseif OperatingSystem('linux')
    colorscheme zenburn
  endif
endif

@heading Apply tweaks.
I've yet to find a colour scheme that I'm 100% happy with. So I have this
function to make some minor tweaks to various schemes I've tried.
=
function! TweakColorScheme() abort
  if !exists('g:colors_name')
    return
  endif

  @<Tweaks for zenburn@>
  @<Tweaks for solarized@>
  @<Tweaks for inkpot@>
endfunction

@ We call it immediately, and also set up an autocommand to call it whenever we change the colour scheme.
=
call TweakColorScheme()

augroup colorschemetweaks
  autocmd!
  autocmd ColorScheme * call TweakColorScheme()
augroup END

@heading The tweaks.

@<Tweaks for zenburn@> =
  if g:colors_name ==? 'zenburn'
    " Highlight tabs like EOLs (less obtrusive)
    highlight! link SpecialKey NonText

    " Override colours used in git diffs
    highlight diffRemoved ctermfg=red
    highlight diffAdded ctermfg=green

@<Tweaks for solarized@> =
  elseif g:colors_name ==? 'solarized'
    " De-emphasize closed folds
    highlight Folded term=bold cterm=bold gui=bold guibg=NONE ctermbg=NONE

@<Tweaks for inkpot@> =
  elseif g:colors_name ==? 'inkpot'
    " Highlight code in markdown
    highlight link markdownCode PreProc
    highlight link markdownCodeBlock PreProc
    " De-emphasize closed folds and tabs
    highlight Deemphasized guifg=#555555
    highlight! link Folded Deemphasized
    highlight! link SpecialKey Deemphasized
  endif

@heading Highlight whitespace at the end of lines.
But only when not in insert mode. I got this from
http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html but that page is
gone now.
=
augroup highlightwhitespace
  autocmd!
  autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\v\s+%#@!$/
  autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\v\s+$/
  autocmd ColorScheme * highlight EOLWS guibg=red ctermbg=red
augroup END
highlight EOLWS guibg=red ctermbg=red

@heading Display cursorline in current window only.
=
augroup cursorline_toggle
  autocmd!
  autocmd WinLeave * setlocal nocursorline
  autocmd WinEnter * setlocal cursorline
augroup END
