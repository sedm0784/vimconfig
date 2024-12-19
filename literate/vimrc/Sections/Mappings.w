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
By default, Vim's regular expressions are configured in a way intended to make
the average search within source code as easy and quick to type as possible.
So some characters, such as |.| or |*| have a special meaning[1], and need to be
escaped with a preceding backslash to match their literal values. But others
work in exactly the opposite way: they need to be escaped in order to access
their special meaning. so e.g. |?| will match a question mark: you need to use
|\?| in order to specify that the previous atom is optional. Vim confidently
labels this behaviour "magic".

While I understand the reasoning behind it, in practice I usually find the
inconsistency confusing. On top of this, I seem to need the special meanings
quite frequently in my searches, and it's a pain to be constantly typing that
backslash. Backslash backslash backslash!

Vim provides a BUNCH of mechanisms for altering this behaviour: here I set up
a mapping that makes all my searches "very magic" by prepopulating the search
command-line with the |\v| atom. This means almost all non alphanumeric
characters use their special meanings unless you escape them.

If I ever want to quickly use a regular magic[2] search I just hit the
backspace a couple of times after entering the |/| search to delete the |\v|.

[1] "Any character", and "any number of the previous atom, including zero",
respectively.

[2] Or a nomagic, or a VERY nomagic
=
nnoremap / /\v
nnoremap ? ?\v

@heading RISC OS style F3 saving.
I've been using Vim for a long time. Back at the beginning of that long time,
I still used RISC OS, and still had muscle memory for its excellent and unique
drag and drop save mechanism.

I set this mapping up as its closest approximation. If someone had put a gun
to my head five minutes ago and asked me if the save dialog it opened was
prepopulated with the current file name then I'd wouldn't be typing this now
because I'd have said "yes" and then got shot in the head.

I don't actually use this. Did I mention NOSTALGIA?

I'm leaving it here just for YOUR benefit, dear reader. Did you know you could
map the function keys using either |<F3>| or |#3|. Did you know GUI Vim
offered access to GUI save/open dialogs via the |:browse| command?

Well now you do!
=
nnoremap #3 :browse w<CR>

@heading Quick email reformat (Re-wRap).
Oh hey here's another mapping I don't actually use any more. To this day I
still do the majority of my email handling in the terminal app mutt, using Vim
for writing the email bodies.

After reading some article about its superior wrapping algorithms I set up
these mappings to reformat my hard-wrapped paragraphs using the external tool
|par|.
= (text as code)
nnoremap <leader>rr vip:!par -q 72<CR>
vnoremap <leader>rr :!par -q 72<CR>

@ As the world moved on, this stopped working so well. Hard-wrapping can be
inflexible when emails are viewed on the WILDLY different screen sizes and
resolutions found today, so I started formatting my emails with
//format=flowed -> https://joeclark.org/ffaq.html//.

This was a clever idea some NERDS came up with where you could write emails
with hard-wrapped lines, but leaving whitespace at the end of a line would
cause mail clients to DISPLAY them with the lines joined together but also
soft-wrapped. Ingenious!

|par| didn't support |format=flowed|, but Vim does via the |w| entry in
|'formatoptions'|! So I updated my mappings to workaround a minor issue in
|gq|: it won't re-join short lines when |formatoptions| contains |w|. The
mappings therefore join the lines first with |J| before invoking |gq|. It
feels like there must be a reason why the normal-mode mapping also adds an
extra blank line below the re-formatted paragraph, but I have absolutely no
idea what that reason might be.
=
nnoremap <leader>rr vipJgvgqo<Esc>
vnoremap <leader>rr Jgvgq

@ It doesn't matter though, because unfortunately, it turns out there are
INSUFFICIENT NERDS writing emails. Some prolific email client or other[1]
couldn't be bothered to implement |format=flowed|, and because of this I
eventually stopped using it and now just write my emails with soft-wrapping
and am sad forever that the |>| quoted text markers are only visible on the
first line of the paragraph.

So the only reason I still have these lines in my vimrc is so I could give you
this little history lesson. I'm a born pedagogue!

[1] Outlook? Gmail?

@heading Easy vimrc Access.
I stole these off someone but I can't remember who.

It is convenient to be able to quickly open your vimrc and apply any changes
you've made in it.
=
" Edit vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<CR>

" Source vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>

@ If I were starting using Vim today, WITH all my knowledge intact, but
WITHOUT my muscle memory or existing vimrc file[1] I might be tempted to leave
these lines out of my vimrc entirely.

Sourcing any file is easy if you're already in it -- |:so %| isn't so hard to
jype -- and Vim provides a NIFTY mechanism for jumping to a preset location,
viz. uppercase marks.

I didn't see the point of these for YEARS until I found out that one great use
for them is as permanent bookmarks.

I have my |'T| mark set to a location in a |todo.txt| file, so |'T| will
quickly jump there whatever I'm doing at the time. Similarly, setting my |V|
mark to the top of my vimrc would faciliate FAST vimrc access without any
mappings.

[1] I don't know. Some kind of weirdly specific memory-and-hard-drive wipe
effect caused by ALIENS?

@heading Navigate wrapped lines visually by default.
This is the part of my configuration that I miss the most when editing
in an unconfigured copy of Vim. It is SO DISORIENTATING when pressing |j|
moves your cursor down more than one line.

The fix is to swap |j| and |k| with their "display lines" counterparts.
=
noremap j gj
noremap gj j
noremap k gk
noremap gk k

@heading Quicker window nav.
=
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

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
