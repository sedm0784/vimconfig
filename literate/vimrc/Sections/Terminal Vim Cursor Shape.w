Terminal Vim Cursor Shape.

@heading FIXME Original Unconverted.
=
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
