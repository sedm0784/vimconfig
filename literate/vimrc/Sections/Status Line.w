Status Line.

Configuring the information display at the bottom of each window.

@ The status line is the configurable line at the bottom of each window that
is generally used to display context-dependent information, such as the file
name, type, etc.

@ By default, Vim only shows the status line when there is more than one
window. But I always want to be INFORMED about my status! Let's switch it on
all the time.
=
set laststatus=2

@heading Functions.
As soon as you add any kind of complexity to your status line, it's best to
break it up, by splitting the |:set statusline| command into a number of
calls, and by using functions for custom evaluated items.

I have four of these. The first three ALMOST duplicate functionality already
provided by the standard statusline items, but they're needed because I like a
couple of bits to be highlighted.

@heading File path.
You can use the |%f| item to include the relative path to the file in the
buffer. But I found it hard to spot the actual file name in this, so I add the
path separately so I can apply colour just to the filename |%t|.
=
function! FilePathNoName() abort
  let l:path = expand("%:h")
  if !empty(l:path)
    let l:path = l:path . "/"
  endif
  return l:path
endfunction

@heading Modified/modifiable flags.
The |%m| item displays |[+]| if the file is modified and |[-]| if the file is
NOT modifiable. I want it to be very obvious if the file is modified, so
again, I need a function to return just the |[+]| flag so I can colour this
differently.
=
function! StatuslineModified() abort
  return &modified ? '[+]' : ''
endfunction

@ And I also need a function just to return the modifiable flag.
=
function! StatuslineModifiable() abort
  return &modifiable ? '' : '[-]'
endfunction

@heading Items provided by plugins.
I have a couple of items in my status line that are provided by plugins.
//fugitive -> https://github.com/tpope/vim-fugitive// allows you to display
your git branch in the status line, and
//gutentags -> https://github.com/ludovicchabant/vim-gutentags.git// has one
that indicates when it is regenerating your ctags.

I can't add these directly to the status line, because I don't always have the
plugins installed.[1] So this function wraps the calls to the plugins so it
can suppress the errors that occur in that situation. I just use a single
function so I only need a single try/catch block: if either of the plugins is
installed they both will be.

[1] Notably, in //iVim -> https://apps.apple.com/app/ivim/id1266544660//,
neither plugin works as they both use system calls that don't exist on iOS.
=
function! StatuslinePluginItems() abort
  @<Obtain information from plugins@>

  let source_status = fugitive_status
  if !empty(fugitive_status) && !empty(gutentags_status)
    let source_status .= " "
  endif
  let source_status .= gutentags_status

  return source_status
endfunction

@ Calling |exists()| on an autoload function always appears to return false,
even if that function has already been called. I catch and ignore the errors
instead.
@<Obtain information from plugins@> =
  try
    let fugitive_status = fugitive#statusline()
    let gutentags_status = gutentags#statusline()
  catch /^Vim\%((\a\+)\)\=:E117:/ " catch error E117
    return ""
  endtry

@heading Setting the statusline.
Now we can set the status line, which we do by snapping the pieces together
like lego! Descriptions of the various added items follow below the code
block.
=
set statusline=%{FilePathNoName()}
set statusline+=%#Question#
set statusline+=%t
set statusline+=%*
set statusline+=%r%h%w%q
set statusline+=%#Error#
set statusline+=%{StatuslineModified()}
set statusline+=%*
set statusline+=%{StatuslineModifiable()}
set statusline+=\ %Y,%{&fileformat},%{&fileencoding}
set statusline+=%(\ %{StatuslinePluginItems()}%)
set statusline+=%=
set statusline+=\ hex=%02.4B
set statusline+=\ c%v/%{strlen(getline('.'))}
set statusline+=\ l%l/%L
set statusline+=\ %p%%

@heading The statusline items.

@heading File path and name.
(*) |%{FilePathNoName()}| -- First we add the file path using
//FilePathNoName//,
(*) Then we add the highlighted filename:
(-*) |%#Question#| -- Change the highlight colour. I'm arbitrarily using the
  |Question| highlight group,
(-*) |%t| -- Then add the highlighted filename,
(-*) |%*| -- And revert to the original colouring.

@heading Flags.
(*) |%r%h%w%q| -- Standard flags:
(-*) |%r| -- Displays |[RO]| if the file is read-only.
(-*) |%h| -- Displays |[help]| if the window is displaying a help buffer.
(-*) |%w| -- Displays |[Preview]| if the window is the preview window. (See
|:help preview-window|.)
(-*) |%q| -- Displays |[Quickfix List]| or |[Location List]| as appropriate.
(See |:help quickfix|.)
(*) Highlighted modified flag:
(-*) |%#Error#| -- Set the |Error| highlight colour,
(-*) |%{StatuslineModified()}| -- Add the highlighted |[+]| modified flag using
//StatuslineModified//,
(-*) |%*| -- Revert to original colouring
(*) |%{StatuslineModifiable()}| -- The |[-]| modifiable flag
(*) |\ %Y,%{&fileformat},%{&fileencoding}| -- A space followed by the file's
|filetype|, |fileformat|, and |fileencoding|, separated by commas.

@heading Plugin items.
There's one little quirk here. We want a space before the plugin items, but
ONLY if they actually exist. Wrapping the |\ %{StatuslinePluginItems()}| in an
item group with |%(...%)| means that if //StatuslinePluginItems// returns an
empty string[1], the entire group, including the preceding space, will be omitted
from the status line.

In an earlier version of this code I just included the space as part of the
string returned by //StatuslinePluginItems//, but there seems to be a weird
quirk here: when the |%{...}| immediately follows another |%{...}| the
space is dropped.[2]

[1] If the plugins are not installed.
[2] It's a known bug in Vim's statusline handling, but it looks like the Vim
maintainers don't have any plans to fix it. Because fiddly.
https://github.com/vim/vim/issues/3898

@ So e.g. This code:
= (text as code)
let &statusline = '[%{" *"}%{" *"}]'
set laststatus=2
=
...results in a status line containing:
= (text)
[ **]
=
...instead of the expected:
= (text)
[ * *]
=
Adding an extra BONUS space would also fix this, but the code above will be more
ROBUST if I change the status line at some later date.

@heading Flexible space.
The item |%=| causes a break in the status line into which any extra space is
allocated. As I just have one of these, the effect is that everything that
follows is right-aligned.

@heading Cursor info.
(*) |\ hex=%02.4B| -- The hex value of the character under the cursor. See
also the normal mode |ga| and |g8| commands, which include more info but
require TYPING with my FINGERS.
(*) |\ c%v/%{strlen(getline('.'))}| -- This displays what character the cursor
  is on and the line's length.
(*) |\ l%l/%L| -- And this displays what line it's on and how many lines are
in the buffer.
(*) |\ %p%%| -- And this displays the same info as a percentage.

@heading Truncation.
When the content gets too long for the space, I allow Vim to use the default
truncation point, which is the start of the line. You can specify a different
truncation position with the |%<| item.
