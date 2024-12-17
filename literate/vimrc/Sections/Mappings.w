Mappings.

Defining custom mappings.

@ N.B. There are a handful of mappings in other sections, but these ones are
all self-contained and/or unrelated to functionality elsewhere.

There's no particular meaning to the order in which they are listed: it's
mainly just chronological with respect to when I added them.

@heading Esc turns off search highlighting.
What better way to start than with a mapping that you really SHOULDN'T copy
into your own vimrc. If this wasn't already burned into my muscle memory I
probably wouldn't add it today.[1]

So having established that you don't want it, I should probably explain what
this mapping is.

Vim's |'hlsearch'| option causes Vim to highlight all search matches. Once
you're done searching, you probably don't want the search matches to remain
highlighted FOREVER, but you also don't want to turn off |'hlsearch'|
entirely, because then you'd have to turn it on again the next time you
search, which would be a drag.

Vim provides a |:nohlsearch| command to turn off the highlighting temporarily
until the next search. Problem solved! Except it's a bit awkward to type all
the time, even in its maximally abbreviated form, |:noh|.

So it's nice to have a mapping to run this command quickly. I use |<Esc>|
for this, after reading it suggested at
//viemu.com -> http://www.viemu.com/blog/2009/06/16/a-vim-and-viemu-mapping-you-really-cant-miss-never-type-noh-again///.

But after using this for a while I started to find it had a few odd side
effects.
//As explained by the good people at the Vi & Vim StackExchange -> https://vi.stackexchange.com/questions/2614/why-does-this-esc-nmap-affect-startup//,
it turns out this is due to the mapping intefering with the escape codes Vim
uses for communicating with the terminal at startup.

The solution was to set it up with an autocommand a bit later on after
startup. |VimEnter| was apparently still too early to avoid the problems I was
seeing, so, either because my solution predated Vim's |+timers| feature, or
possibly just because I hadn't learned how to use them yet, I set it up to
create the mapping when I enter insert mode.

[1] I'd likely use |:nnoremap <C-L>:noh<CR><C-L>| instead, tagging along with
the "clear-screen" function instead of the "return to normal mode" one.
=
augroup escape_mapping
  autocmd!
  autocmd InsertEnter * nnoremap <Esc> :nohlsearch<CR><Esc>
augroup END

@ Astute readers will have noticed that this re-creates the mapping EVERY TIME
I enter insert mode. In practice, I don't find this to be an issue -- it's
essentially instantaneous. However, for many years before deciding it was
over-engineered, I used a more complicated version that only fired once before
deleting all traces of the autocommand that triggered it.

= (text as code)
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

@heading Always use very magic searches.
=

nnoremap / /\v
nnoremap ? ?\v

@heading RISC OS style F3 saving.
=

nnoremap #3 :browse w<CR>

@heading Quick email reformat (Re-wRap).
=
" No longer use par: it doesn't support format=flowed
"nnoremap <leader>rr vip:!par -q 72<CR>
"vnoremap <leader>rr :!par -q 72<CR>

" A plain `gq` will not join short lines if 'formatoptions' contains `w`. We
" must first join them.
" N.B. Make sure 'formatoptions' contains `j` before using this mapping!
nnoremap <leader>rr vipJgvgqo<Esc>
vnoremap <leader>rr Jgvgq

@heading Easy vimrc Access.
=
" Source vimrc
nnoremap <leader>vs :source $MYVIMRC<cr>

" Edit vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>

@heading Navigate wrapped lines visually by default.
=
noremap j gj
noremap gj j
noremap k gk
noremap gk k

@heading Quicker window nav.
=
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

@heading Use arrow keys for quickfix.
=
nnoremap <up> :cwindow<CR>
nnoremap <down> :cc<CR>
nnoremap <left> :cp<CR>
nnoremap <right> :cn<CR>
noremap! <left> <nop>
noremap! <right> <nop>
" We want to be able to use up and down for accessing command/search history
inoremap <up> <nop>
inoremap <down> <nop>

@heading Disable Ex mode.
=
nnoremap Q <nop>

@heading Setting toggles.
=
" Turning spell checking on and off {{{

nnoremap <leader>s :setlocal spell!<cr>:set spell?<cr>

" Turning list on and off {{{

nnoremap <leader>l :setlocal list!<cr>:set list?<cr>

" Turn expandtab on and off {{{

nnoremap <leader>e :setlocal expandtab!<cr>:set expandtab?<cr>

" Turning wrap on and off {{{

nnoremap <leader>w :setlocal nowrap!<cr>:set wrap?<cr>

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

@heading Calculator.
=
vnoremap <leader>cal y`>a = <c-r>=<c-r>0<cr><esc>:nohls<cr>
"nnoremap <leader>cal yiWEa = <c-r>=<c-r>0<cr><esc>
"nnoremap <leader>cal v?[0-9. ()*/+-]*<cr>y``a = <c-r>=<c-r>0<cr><esc>
nnoremap <leader>cal :let cal_wrap=&whichwrap<cr>:set whichwrap-=l<cr>:silent! normal l<cr>:silent! normal l<cr>?\d[0-9. ()*/+-]*<cr>y/[0-9. ()*/+-]*\d/e<cr>`]a = <c-r>=<c-r>0<cr><esc>:nohls<cr>:let &whichwrap=cal_wrap<cr>

@heading Don't search when using * and #.
=
nnoremap * *<C-o>
nnoremap # #<C-o>

@heading Sane behaviour of Y (i.e. like C and D).
=
nnoremap Y y$

@heading Smart quotes.
=
nnoremap <leader>sq1 :%s/\v '(.{-})'/ \&lsquo;\1\&rsquo;/gc<cr>
nnoremap <leader>sq2 :%s/\v "(.{-})"/ \&ldquo;\1\&rdquo;/gc<cr>
nnoremap <leader>sa :%s/'/\&rsquo;/gc<cr>

@heading Find in Files.
=
nnoremap <leader>ff :grep <C-R><C-W><C-F>hviw<C-G>
" This is literally the only thing I use select mode for, so I think this is
" safe to map globally. If it becomes a problem, map in CmdwinEnter autocommand.
snoremap <CR> <Esc><CR>

@heading Invoke Make.
=
nnoremap <leader>mm :Make<cr>

@heading File Jumps. Ctrl-O/Ctrl-I skipping current file.
=
" Skip entries in the jumplist that are in the same file
function! s:jump_skipping_file(backwards) abort
  let this_buffer = bufnr('%')
    while this_buffer == bufnr('%')
      execute "normal!" a:backwards ? "\<C-O>" : "1\<C-I>"
    endwhile
endfunction
nnoremap <leader><C-O> :call <SID>jump_skipping_file(v:true)<CR>
nnoremap <leader><C-I> :call <SID>jump_skipping_file(v:false)<CR>

@heading Dictionary completion with 'nospell'.
=
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

@heading Faster tselect.
=
nnoremap <leader><C-]> :tselect <C-R><C-W><CR>

@heading Visual mode zz.
=
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
