Mappings.

@heading FIXME Original Unconverted.
=
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
