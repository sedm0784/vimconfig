Disable Click-Through.

Prevent mouse clicks from affecting cursor positioning when Vim is not the
foreground app.

@ MacVim does not support "click-through": when it is not the foreground app
you can blindly click anywhere in the Vim window to activate it, without
having to worry about the text cursor being repositioned.[1]

The code in this section emulates this setting in ANY GUI Vim.

It works by using a |FocusLost| autocommand to disable mouse support when you
leave Vim, and a |FocusGained| autocommand to re-enable it -- after a short
delay -- when you return.

I've left it in my vimrc becase I feel like it's a neat solution, but it's
also a bit pointless: I never actually use the mouse in Vim, so a plain
|:set mouse=| would function just as well for me.

[1] While it's much less common these days, this was I believe how all
applications worked on classic Mac OS. The first text editor I ever really got
familiar with -- !Zap on RISC OS -- also had a setting to enable this
behaviour, and I've preferred it ever since.
=
augroup MouseHack
  autocmd!
  autocmd FocusLost * set mouse=
  autocmd FocusGained * call timer_start(200, '<SID>reenable_mouse')
augroup END

@ The function |s:reenable_mouse| just allows us to call the |:set mouse|
command from |timer_start|.
=
function! s:reenable_mouse(timer_id)
  set mouse=a
endfunction

@ In Vimscript, I think the explicit function name is a bit nicer than making
it into a one-liner with a lambda expression, but you can do this if you
prefer:

= (text as code)
autocmd FocusGained * call timer_start(200, {-> execute('set mouse=a', '')})
