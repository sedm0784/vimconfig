Basic options.

Set various options.

@heading Basic options. The simplest way you can configure Vim is by setting
some of its various global options. These are mostly pretty straightforward so
I won't go into too much detail about all of them. As always in Vim,
everything is well documented, so if any of the below is unclear, |:help
'option-name'| is your friend.

@heading Vi-compatibility. One of the things I've always liked about Vim is
the almost LIMITLESS dedication Bram had to backwards compatibility[1]. And
one of the ways this dedication displayed itself was in Vim's Vi-compatibilty
mode. Even though Bram named his program Vi improved, he still realised that
some of his users may want Vim to work more like Vim, and allowed for this
with the |'compatible'| option. When this is on, Vim works more like Vi,
instead of in "a more useful way."

As such, lots of introductory Vim configuration tutorials will tell you that
the first thing you should add to your vimrc is |set nocompatible|. This
is almost entirely cargo culting! If Vim finds a vimrc when it is starting
up it will ALREADY set |'nocompatible'|.

And in rare circumstances it could even be actively harmful to set
|'nocompatible'| in your vimrc. Because when |'compatible'| is unset, many
other options are changed, so if you were to |:source| your vimrc to pick up
some changes you have made to it, there could be unwanted sideeffects.

[1] Unlike many Vim users, I really like Apple products. But Apple have a VERY
different approach to backwards compatibility than Bram did. I... uh... do not
so much appreciate this particular aspect of Apple.

@ There is, however, one time when you might want |set nocompatible| in your
vimrc.

If you load the vimrc by specifying its location with a |-u| flag when
invoking Vim, then the option's default value is |'compatible'|.

I have literally never loaded my main vimrc in this way, and if I did, I would
also use the |-N| flag that sets |'nocompatible'|, but since I'm publishing my
vimrc, maybe one someone else will download it and load it in this way.[1]

So for this reason, at the very start of my vimrc, I check if |'compatible'|
is set, and unset it if it is.

[1] Okay, this is sounding pretty contrived now I'm writing it. You probably
don't need these lines in your vimrc.

= (early code)
if &compatible
  set nocompatible
endif

@heading Unicode, yo. FIXME

= (early code)
set encoding=utf-8
scriptencoding utf-8

@heading Manually specify a shell. I'm reasonably partial to the |fish| shell.
But allowing Vim to use this for `:!` commands caused me problems.[1] Setting
|'shell'| tells Vim to use the specified shell in place of the user shell.

[1] I can't remember what, exactly.
=
if has("unix")
  set shell=/bin/sh
endif

@heading Enable filetypes fully. The Vim runtime includes a BUNCH of helpful
handlers for different file types. I want all of this good stuff. In the
|filetype| command, |plugin| refers to filetype plugins (including useful file
type dependent behaviours), |indent| refers to indent files (autoindenting
file types appropriately), and |on| enables both, also switching on automatic
filetype detection (generally based on file names, but also occasionally on
file contents.
=
filetype plugin indent on

@heading Enable syntax highlighting. Ken Thompson doesn't like it, but I do.
=
syntax on
