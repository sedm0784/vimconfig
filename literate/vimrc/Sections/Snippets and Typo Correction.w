Snippets and Typo Correction.

Actually, just typo correction.

@ This file contains various abbreviations and user-defined commands that I
use to automatically correct typos as I type.
@heading Holding down Shift too long.
For some reason, with a small subset of the commands I use, I frequently don't
relese the shift key fast enough after typing the colon and the first
character of the command-line command I'm typing ends up incorrectly
capitalized. I work around this PEBKAC with a selection of user-defined
commands and mappings.

@ First, there are a few very simple command substitutions.
=
command! -bang Cn cn<bang>
command! -bang Q q<bang>
command! -bang Qal qall<bang>
command! -bang Qall qall<bang>
command! -bang Wqall wqall<bang>

@ The |:set| command is slightly more complicated, because it requires
completion to work and arguments to be passed along.
=
command! -complete=option -nargs=* Set set <args>
command! -complete=option -nargs=* Setl setl <args>

@ Finally, I have a couple that IIRC, can't so easily be implemented as
commands.[1][2] I use abbreviations for these.

When using an abbreviation in the command line, it's important to make sure
it doesn't fire when you don't want it to.[3] I use |getcmdtype()| and
|getcmdpos()| here to ensure the abbreviation only kicks in at appropriate
times.

[1] It's possible these could be handled similar to |:set|, and the only
reason that they're not is that these abbreviations predate my learning that
you could use user-defined commands to correct typos in this way!
[2] |:wq| can take an |++opt| and an argument. I actually never use this
feature, but ¯\_(ツ)_/¯.
[3] Especially ones that have such a short |{lhs}|!
=
cabbrev <expr> W (getcmdtype() == ':' && getcmdpos() == 2) ? 'w' : 'W'
cabbrev <expr> Wq (getcmdtype() == ':' && getcmdpos() == 3) ? 'wq' : 'Wq'

@heading Insert mode typos.
I don't know why, but I just can't stop my fingers typing these in this way.
=
iabbrev unsinged unsigned
iabbrev Pythong Python

@heading Snippets.
At some point in the near future, I'm going to add some (very basic) snippet
expansions here. I should probably have left out this paragraph, but I've
already named this section "Snippets and Typo Correction". FACEPALM
