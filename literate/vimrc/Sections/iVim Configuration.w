iVim Configuration.

Configuration specific to the iOS port of Vim.

@ The iOS port of Vim requires a few options that aren't applicable to other
operating systems.
=
if OperatingSystem("ios")
  @<Configure keyboard strip@>
  @<iVimClippy@>
  @<Disable GitGutter@>
endif

@heading Custom keyboard configuration.
iVim adds a configurable extra row of keys above your normal on-screen
keyboard that provides Escape and Ctrl keys, and a bunch of other numbers and
symbols without easy access to which using Vim would be an ORDEAL.

= (figure iVim before.png at width 500)

However!

(1) The default set of keys does not include backtick or tilde.

(2) Some of the symbols are accessed by swiping on the keys, and it's hard to
enter the forward slash and question mark keys, because they require starting
a swipe very near the edge of the screen and then swiping off the screen
diagonally.[1]

[1] The concept is that you're dragging the symbol from the corner/edge into
the centre of the key. The keys are TINY.

@ I fix both of these problems by adding a new key at the far right of the
strip.

= (figure iVim after.png at width 500)

@<Configure keyboard strip@> =
@<Add new button with colon/tilde@>
@<Replace original colon with backtick@>

@ The new button has a colon in the middle and a tilde at the top so it no
longer requires diagonal swipes.

@<Add new button with colon/tilde@> =
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

@ But there was already a colon symbol on the button that was previously at
the end of the keyboard row. The colon is an important key in Vim, but TWO
seems excessive! We replace the old one -- now on the row's penultimate key --
with a backtick.

@<Replace original colon with backtick@> =
isetekbd replace {'buttons':[{'keys':[{'title':'`',
                                     \'type':'insert',
                                     \'contents':'`'}],
                            \'locations':[0]
                            \}],
                \'locations':[9]}

@heading iVimClippy.
//vimclippy -> http://normalmo.de/posts/vimclippy/// is a shell
function I wrote that allows you to rapidly edit the contents of your
clipboard in Vim. iVimClippy is the iOS version, which uses an iOS Shortcut
to add this functionality to your Home Screen. Check out my blog post for
details about
//how it works -> http://normalmo.de/posts/ivimclippy///.

@<iVimClippy@> =
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

@heading Disable GitGutter.
GitGutter is a plugin that shows a git diff in your sign column and adds
mappings for quickly jumping between changes[1]. It's SUPER helpful, but
cannot work on iOS because it needs to call out to Git to obtain your
repository status, which iOS doesn't allow (or at least, not in the same way
as on other operating systems).

[1] Plus a bunch of other features I don't use.
@<Disable GitGutter@> =
let g:gitgutter_enabled = 0
