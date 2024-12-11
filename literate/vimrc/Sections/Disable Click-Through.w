Disable Click-Through.

@heading FIXME Original Unconverted.
=
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
