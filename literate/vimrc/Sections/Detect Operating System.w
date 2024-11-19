Detect Operating System.

Figure out what computer we're running on.

@heading Detect operating system. In various places in my config I need things
to be configured slightly differently depending what operating system Vim is
running in.

I use this little |OperatingSystem()| function to check for specific OSes:
=
function! OperatingSystem(os) abort
  if !exists('s:operating_system')
    @<Detect the operating system@>
  endif
  return a:os == s:operating_system
endfunction

@ Vim includes a number of feature flags that get us most of the way to
determining the OS, but for the last mile we resort to calling |uname| via
|system()|.

In particular, on the versions of Vim included in earlier versions of macOS,
both |has('mac')| and |has('macunix')| return false.

@<Detect the operating system@> =
  let s:operating_system = "unknown"
  if has("win32")
    let s:operating_system = "windows"
  elseif has("ios")
    let s:operating_system = "ios"
  elseif has("unix")
    let uname = system("uname")
    if uname == "Darwin\n"
      let s:operating_system = "mac"
    elseif uname == "Linux\n"
      let s:operating_system = "linux"
    elseif uname =~ "MINGW64"
      let s:operating_system = "windows"
    endif
  endif

@ I never actually access the |s:operating_system| variable
directly--Vimscript doesn't include a |switch| statement, so calling
|OperatingSystem()| repeatedly in an |if-else| chain suffices.
