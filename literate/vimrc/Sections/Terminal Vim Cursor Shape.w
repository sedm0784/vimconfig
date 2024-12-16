Terminal Vim Cursor Shape.

Configuring terminal Vim to use a bar cursor when in insert mode.

@ In order to get my terminals to switch cursors when in insert mode, I set
Vim's |t_SI| and |t_EI| terminal options to send the DECSCUSR escape codes to
change cursor shape.
=
if exists('$TMUX')
  @<Set tmux compatible codes@>
else
  @<Set the standard DECSCUSR codes@>
endif

@ In all the following, I'm using the |:let &{option-name}| technique for
setting options so I can use |\e| escape sequences instead of having to
include raw |ESC| control characters in my vimrc.

@ I've written "standard" here, but I'm actually a bit unclear about WHICH
standard defines these codes. The VT100 has codes for changing shape, but
doesn't appear to include specifically the |5| value I use to specify a bar
shape. Could this be from xterm? Who knows! Terminals are wild.

@<Set the standard DECSCUSR codes@> =
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

@ If we're in tmux, we need to wrap the DECSCUSR codes in some extra stuff to
instruct tmux to pass them on to the terminal. Specifically, we need to
surround them with a DCS sequence[1] and replace |ESC| with |ESC||ESC|.

[1] If you are wondering with a blank look on your face what this means, then
that makes two of us! Did I mention that Terminals are wild?

@<Set tmux compatible codes@> =
let &t_SI = "\ePtmux;\e\e[5 q\e\\"
let &t_EI = "\ePtmux;\e\e[2 q\e\\"

@ Turns out I don't really need any of this code. I'm only realising as I
document it that it doesn't work in the copy of Vim I'm writing this in (macOS
Terminal.app, connected a copy of Vim running in tmux on Linux).

TOP TIP for Vim beginners: The REASON I don't need it because I actually
always know what mode I'm in. This is not because I'm very clever at
remembering things, but because I'm ALWAYS IN NORMAL MODE. This is the correct
way to use Vim. You only enter insert mode when you're ready to enter text,
and you return to normal mode IMMEDIATELY as soon as you finish[1] typing.

[1] Or pause.
