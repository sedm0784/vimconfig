Die Blinkenmatchen.

Find your cursor.

@ This is a fairly heavily modified version of Damian Conway's Die
Blinkënmatchen--code that causes the matched text to blink when jumping between
search results with the |n| and |N| motions, making it easier to see which
result you've just jumped to. Conway discusses his solution in his excellent
and inspiring More Instantly Better Vim talk (starting at the 4m59s mark):

= (embedded YouTube video aHm36-na4-4)

@ The changes I made are to use Vim's |+timers| feature to make the blinking
asynchronous, which allows you to continue interacting with Vim while the
blinking is in progress.

@ First, we set some constants to indicate how long we want the blinking to go
on for and how fast we want it to be.

@ How long to blink, in milliseconds. If you're using an earlier Vim without the `+timers`
feature, you need a much shorter blink time because Vim blocks while it
waits for the blink to complete.
=
let s:blink_length = has("timers") ? 500 : 100

@ The length of each blink in milliseconds.
=
let s:blink_freq = 50

@ If you just want an interruptible non-blinking highlight, set this to match
|s:blink_length| instead:
= (text as code)
let s:blink_freq = s:blink_length

@heading Mappings.
Next, we map |n| and |N| to call a new script-local //s:highlight_next// function.
=
execute printf("nnoremap <silent> n n:call s:highlight_next(%d, %d)<cr>", s:blink_length, s:blink_freq)
execute printf("nnoremap <silent> N N:call s:highlight_next(%d, %d)<cr>", s:blink_length, s:blink_freq)

@heading s:highlight_next().
I suppose we better implement the |s:highlight_next| function too!
=
function! s:highlight_next(blink_length, blink_freq) abort
  @<Create regular expression to match search matches@>
  if has("timers")
    @<Blink using timers@>
  else
    @<Blink without timers@>
  endif
endfunction

@ The regular expression we use is fairly simple:

(*) |\c| makes the pattern case insensitive,
(*) |\%#| matches the position of the cursor,
(*) we then concatenate this with the contents of the search register |@/|,
i.e. what we searched for.

@<Create regular expression to match search matches@> =
  let target_pat = '\c\%#'.@/

@ When using timers, we do three things:
(1) First we stop any existing blinking by calling //BlinkStop//,
(2) Then we set the initial blink highlight by calling //BlinkToggle//. We need
to do this before starting the timers so the match is highlighted initially (in
case of large values of
|a:blink_freq|.
(3) Then we set up two timers. The first will call //BlinkToggle// repeatedly
to create the blinking. The second will call //BlinkStop// to stop the
blinking.

@<Blink using timers@> =
  call BlinkStop(0)
  call BlinkToggle(target_pat, 0)
  let s:blink_timer_id = timer_start(a:blink_freq, function('BlinkToggle', [target_pat]), {'repeat': -1})
  let s:blink_stop_id = timer_start(a:blink_length, 'BlinkStop')

@ =
if has("timers")
  @<Define BlinkToggle@>
  @<Define BlinkStop@>
  @<Define BlinkClear@>
  @<Stop blinking if we move the cursor or enter insert mode@>
endif
  
@heading Blink functions.

@ The |BlinkToggle| function just turns the blink highlighting on or off using
the |target_pat| regular expression we set up above.

@<Define BlinkToggle@> =
  function! BlinkToggle(target_pat, timer_id)
    if exists('s:blink_match_id')
      " Clear highlight
      call BlinkClear()
    else
      " Set highlight
      let s:blink_match_id = matchadd('ErrorMsg', a:target_pat, 101)
      redraw
    endif
  endfunction

@ The |BlinkStop| function cancels all the timers and removes the highlight if
necessary.

@<Define BlinkStop@> =
  function! BlinkStop(timer_id)
    " Cancel timers
    if exists('s:blink_timer_id')
      call timer_stop(s:blink_timer_id)
      unlet s:blink_timer_id
    endif
    if exists('s:blink_stop_id')
      call timer_stop(s:blink_stop_id)
      unlet s:blink_stop_id
    endif
    " And clear blink highlight
    if exists('s:blink_match_id')
      call BlinkClear()
    endif
  endfunction

@<Define BlinkClear@> =
  " Remove the blink highlight
  function! BlinkClear()
    call matchdelete(s:blink_match_id)
    unlet s:blink_match_id
    redraw
  endfunction

@ Finally, we setup autocommands to cancel blinking early if interrupted by the
user.

@<Stop blinking if we move the cursor or enter insert mode@> =
  augroup die_blinkmatchen
    autocmd!
    autocmd CursorMoved * call BlinkStop(0)
    autocmd InsertEnter * call BlinkStop(0)
  augroup END

@heading Damian Conway's Version.

@ If this instance of Vim doesn't have the |+timers| feature, then we just use
Conway's original code.

@<Blink without timers@> =
  " Highlight the match
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  " Wait
  exec 'sleep ' . a:blink_length . 'm'
  " Remove the highlight
  call matchdelete(ring)
  redraw

@ N.B. This code doesn't actually blink! Conway demonstrated a bunch of
versions in his presentation, and //the one he uses now -> https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/hlnext.vim//
is different again from any of these. I'm not sure how I ended up with the
non-blinking version in my "no timers" branch, but it's been a while since I've
run a version of Vim that predates timers.
