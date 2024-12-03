Basic options.

Set various options.

@heading Basic options.
The simplest way you can configure Vim is by setting some of its various global
options. These are mostly pretty straightforward and mostly aren't much FUN so
I won't go into too much detail about all of them. As always in Vim, everything
is well documented, so if any of the below is unclear, |:help 'option-name'| is
your friend.

@heading Vi-compatibility.
One of the things I've always liked about Vim is the almost LIMITLESS
dedication Bram had to backwards compatibility[1]. And one of the ways this
dedication displayed itself was in Vim's Vi-compatibilty mode. Even though Bram
named his program Vi improved, he still realised that some of his users may
want Vim to work more like Vim, and allowed for this with the |'compatible'|
option. When this is on, Vim works more like Vi, instead of in "a more useful
way."

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

@heading Unicode, yo.
FIXME

= (early code)
set encoding=utf-8
scriptencoding utf-8

@heading Manually specify a shell.
I'm quite partial to the |fish| shell. But when this is set as my user shell,
Vim will attempt to use it for for |:!| commands which caused me problems.[1]
Setting |'shell'| tells Vim to use the specified shell instead.

[1] I'm afraid I can't remember what, exactly.
=
if has('unix')
  set shell=/bin/sh
endif

@heading Enable filetypes fully.
The Vim runtime includes a BUNCH of helpful handlers for different file types.
I want all of this good stuff. In the |filetype| command, |plugin| refers to
filetype plugins (including useful file type dependent behaviours), |indent|
refers to indent files (autoindenting file types appropriately), and |on|
enables both, also switching on automatic filetype detection (generally based
on file names, but also occasionally on file contents.
=
filetype plugin indent on

@heading Enable syntax highlighting.
Ken Thompson doesn't like it, but I do.[1]

[1] I actually can't remember which Unix luminary it is that I'm referring to
here. I just remember they said that the way most people use syntax
highlighting is STUPID and DUMB and that they had an idea for
some different form of highlighting that MIGHT be useful when programming but
that they couldn't be bothered to implement it and that this idea did indeed
sound pretty intriguing.

Annoyingly, I can't remember what the idea WAS, and have never been able to
find the interview since.
=
syntax on

@ Yes, both |filetype| and |syntax| are technically commands[1]. But they FEEL
like options, so I'm including them in this section. I'm a loose cannon!

[1] See also |colorscheme|.

@heading Leader.
I use some of my |<leader>| mappings very frequently, so I want something
easier to type than the default backslash.

Someone (I think Romain Lafourcade?) has a fairly persuasive argument that the
leader feature is pointless, and that there's no benefit to it over just
prefixing your mappings with the actual character. I think they're probably
right, but nonetheless: I am not changing my config.
=
let mapleader = ","

@ For a long time, I had LocalLeader set to backslash and did an
opposite-direction |f| repeat by pressing comma and waiting for |'timeout'|.
This is, let's say, SUBOPTIMAL, so now I'm mapping backslash to comma.

This means I need a new value for my LocalLeader, so I'm using the value
suggested by |:help maplocalleader| viz. underscore. But it's kind of academic:
I don't think I've EVER used an underscore motion OR a LocalLeader mapping.
=
nnoremap \ ,
let maplocalleader = "_"

@heading Tabs.
Most of the time these will be set by Astronomer; these are just my defaults
(for e.g. new files).
=
set tabstop=2
set shiftwidth=2
set expandtab

@ FIXME Insert rant about the online discourse about tabs vs. spaces here.

@heading Indenting.
Generally, I want dumb indenting on. I only want smarter indenting if I'm
actually coding, which will be handled by plugins/filetype indenting.
=
set autoindent
set nocindent
set nosmartindent

@heading Line endings.
Try all file formats. I've only encounted a mac-formatted file once in my
entire life, but also I don't think there's any harm in trying the |mac|
fileformat if it's not either of the other ones.
=
if OperatingSystem('windows')
  set fileformats=dos,unix,mac
else
  set fileformats=unix,dos,mac
endif

@ N.B. |has('win32')| would work just as well here, but I use my custom
//OperatingSystem// function for consistency.[1]

[1] And, because, you know, I spent all that time writing it...

@ Do NOT "fix" last line by adding an <EOL> if one not present. If I want to
add the <EOL> I can do so by either setting |'endofline'| or |'fixeol'| before
writing.
=
if exists('+fixeol')
  set nofixeol
endif

@heading Wrapping, autoformatting.
...and other options relating to the handling of lines.

@ When soft-wrapping, only split the line at word boundaries.
=
set linebreak

@ Indent all parts of wrapped lines equally. Not sure if I actually like this.
It LOOKS neater, but sometimes I find it hard to detect the wrapped lines when
I need to. Unlike many of the options in my vimrc, this is one I find myself
fiddling with on a case-by-case basis (but not so frequently that I've set up a
toggle for it).
=
if exists('+breakindent')
  set breakindent
endif

@ Configure Vim's auto-formatting. See
|:help fo-table|[1] for a description of the flags. The default value is |tcq|
so I'm adding |r| and |j|, to improve how Vim handles comments, and |n|, to
allow the recognition of numbered lists.

[1] https://vimhelp.org/change.txt.html#fo-table
=
set formatoptions=tcqrjn

@ Don't double space sentences when doing |J|, |gq|.
=
set nojoinspaces

@ Configure which sideways motions can move the cursor to the next line.
Backspace |b| and space |s| are included by default. I add the normal mode left
|h| and right |l| motions too.
=
set whichwrap=b,s,h,l

@ Backspace can backspace over anything. This is another one I think I might
revisit someday.
=
set backspace=indent,eol,start

@heading Automatic backups.
When Vim writes a file it makes a backup of the original and (by default)
deletes this again when the write is completed. Store these backups in one
place.[1]

[1] I'm not sure if this is really necessary, given that the files are so
ephemeral. My reasons for adding this are lost in the *mists of time*.
=
set backupdir=$HOME/.vim/backups

@ While a file is open, Vim keeps a duplicate of it called a "swap file", which
can be used to recover the unsaved contents of the file in case of e.g. a power
cut. These are stored alongside the original file, but when the buffer has
never been written, no original exists. By default, Vim would attempt to store
swap files for new files in |c:\Windows\System32|, but UAC will not allow this
on Windows 7. Instead, use the temp directory for these.
=
if OperatingSystem('windows')
  set directory=.,$TEMP
endif

@heading Searching.
Use incremental searching, and highlight search matches.
=
set incsearch
set hlsearch

@ I have two further things elsewhere in my config to improve search
functionality. //Die Blinkenmatchen//, and FIXME //A mapping to clear search
highlights//.

@heading No brainer quality-of-life options.
I can't imagine anyone not wanting these options.

@ Display as much as possible of long lines at the bottom of the window.
Without this, Vim replaces their content with |@| characters.[1]

[1] By default. The character is configurable with the 'fillchars' option.
=
set display+=lastline

@ Automatically read changed files if they're unchanged in vim.
=
set autoread

@heading Miscellanous.
All the options I'm not sure how to categorise. Many of these just make Vim
behave more "normally", but don't quite make it into the "no brainer" category
above.

@ Keep this many lines above and below cursor at the edges of the window.
=
set scrolloff=3

@ Ditto for horizontal scrolling.
=
set sidescrolloff=10

@ Allow hidden buffers. Without this, unsaved buffers must always[1] remain
onscreen, which I found very restrictive when I started using Vim and didn't
know about the exceptions. (I have this vague idea I might revisit this
option one day.)

[1] //Almost -> http://vimhelp.org/options.txt.html#%27hidden%27// always.
=
set hidden

@ Turn on line numbers. Lots of Vim users like the |'relativenumber'| option. I
hate it!
=
set number

@ Ignore case, if lowercase. |'smartcase'| is a WONDERFUL feature, and I miss it
every time I use another editor.
=
set ignorecase
set smartcase

@ Turn off noisybeeps.
=
set visualbell

@ Put new splits below and to the right of current windows.
=
set splitbelow
set splitright

@ Visually indicate matching brackets as they are entered.
=
set showmatch
set matchtime=5

@ Show incomplete commands in last line of screen. e.g. if you're halfway
through typing the command to delete five words, this might display |d5|.

=
set showcmd
