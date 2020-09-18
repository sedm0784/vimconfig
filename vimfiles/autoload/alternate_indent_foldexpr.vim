" An alternative foldexpr for indent-folding.
"
" Vim's 'foldmethod' setting, "indent", folds multiple lines of indent into a
" single line.

" This 'foldexpr' instead folds any number of lines of indent (including one)
" into the preceding line with a lower indent-level.
"
" My first attempt at this style of folding is on the Vim Stack Exchange:
"
"    https://vi.stackexchange.com/a/2161/343

" FIXME: support 'foldnestmax'
"
" Regular expression for a "blank" line
let s:regexp_blank = "^\s*$"

function! s:non_blank(line_number, direction) abort
    let non_blank_line = a:line_number
    while non_blank_line > 0 && non_blank_line <= line('$') + 1 && getline(non_blank_line) =~ s:regexp_blank
        let non_blank_line += a:direction
    endwhile
    return non_blank_line
endfunction

" Finds the indent of a line. The indent of a blank line is the indent of the
" first non-blank line above it.
function! s:find_indent(line_number, indent_width, direction = -1) abort
    let old_non_blank_line = a:line_number
    while old_non_blank_line > 0 && getline(old_non_blank_line) =~ s:regexp_blank
        let old_non_blank_line = old_non_blank_line - 1
    endwhile
    let non_blank_line = s:non_blank(a:line_number, a:direction)
    if non_blank_line != old_non_blank_line && a:direction == -1
        echom "NONBLANK MISMATCH " .. a:line_number .. " " .. a:indent_width .. " " .. non_blank_line .. " " .. old_non_blank_line
    endif
    return indent(non_blank_line) / a:indent_width
endfunction

function! s:get_concrete_level(current_fold, line_number) abort
    let current_fold = a:current_fold
    if current_fold == "="
        let line_adjust = 1
        while current_fold is "="
            " FIXME: We pass true for `recursing`, because otherwise if
            "        we hit a blank line we'll then call
            "        alternate_indent_foldexpr#foldlevel again for both above
            "        and below, which will result in an infinite recursion
            "        because it cancels out the `line_adjust` and ends up
            "        calling alternate_indent_foldexpr#foldlevel again with
            "        the same line number. Leaving as a FIXME because I'm not
            "        sure if this fix is *correct*. It just stops the infinite
            "        recursion.
            let current_fold = alternate_indent_foldexpr#foldlevel(a:line_number - line_adjust, 1)
            let line_adjust += 1
        endwhile
    endif
    if current_fold[0] == ">"
        let current_fold = str2nr(current_fold[1:-1])
    endif
    return current_fold
endfunction

function! alternate_indent_foldexpr#foldlevel(line_number, recursing = 0) abort
    if !a:recursing && getline(a:line_number) =~ s:regexp_blank
        " What we *really* would like is for blank lines to be visible when
        " either the fold above them OR the fold below them is open.
        " Unfortunately, this isn't possible (without writing hacky code to
        " continually re-calculate a foldlevel which is based on the current
        " fold status of nearby lines) so instead we have two configurable
        " behaviours. With g:include_blanks_in_fold_above unset (the default)
        " the blank lines are not included in the fold above (which is
        " implemented by setting the fold level to the lowest of the foldlevel
        " above and below) and with it set, they *are* included (implemented
        " by just returning `=`).
        "
        " See the FIXME immediately below and the subsequent one for possible
        " future refinements.
        "
        " FIXME: Possible nice feature for PEP 8 code: Include the *first*
        "        blank line in the fold above, but not subsequent lines. This
        "        would mean that, when folded, classes and top-level functions
        "        would be separated by a single blank line, but class methods
        "        would not.
        if get(g:, 'include_blanks_in_fold_above', 0)
            return "="
        endif
        let non_blank_above = s:non_blank(a:line_number, -1)
        let non_blank_below = s:non_blank(a:line_number, 1)
        if non_blank_above > 0
            let above = alternate_indent_foldexpr#foldlevel(non_blank_above)
        endif
        if non_blank_below <= line('$')
            let below = alternate_indent_foldexpr#foldlevel(non_blank_below)
        endif
        if !exists('above') && !exists('below')
            return 0
        elseif exists('above') && exists('below')
            let above_concrete = s:get_concrete_level(above, non_blank_above)
            let below_concrete = s:get_concrete_level(below, non_blank_below)

            if above_concrete < below_concrete
                return "="
            else
                return below
                " FIXME: With the commented out code, blank lines before the
                "        starts of the top two levels of folds will be outside
                "        the fold above i.e. will appear as blank lines when
                "        the enclosing fold is open. Blank lines at deeper
                "        fold levels will still be included in the fold above.
                "        So top-level classes and their methods will be
                "        separated by blank lines, but lower level folds will
                "        have the blank lines folded in when they are closed.
                "        If we just check for '>1', then this will only be
                "        true for top-level folds.
                " if below == ">1" || below == ">2"
                "     return below
                " else
                "     return "="
                " endif
            endif
        elseif exists('above')
            return "="
        else
            return below
        endif
    endif

    let indent_width = &shiftwidth

    " Find current indent
    let indent = s:find_indent(a:line_number, indent_width)

    " Now find the indent of the next line
    let indent_below = s:find_indent(a:line_number + 1, indent_width, 1)

    " N.B. This returns 0 if there's no line above
    let indent_above = s:find_indent(a:line_number - 1, indent_width)

    if indent == 0 && indent_below == 0
        return 0
    endif

    " Check level of indent compared to previous line. If it's less, set the
    " current fold level to current indent.
    if indent < indent_above || a:line_number == 1
        let current_fold = indent
    else
        let current_fold = "="
    endif

    " Check level of indent compared to next line. If next line is more
    " indented, start an indent one level higher than current level.
    if indent < indent_below
        let current_fold = s:get_concrete_level(current_fold, a:line_number)
        return ">" .. (current_fold + 1)
    else
        return current_fold
    endif

endfunction

"set foldexpr=alternate_indent_foldexpr#foldlevel(v:lnum)
"set foldmethod=expr

function TestFoldlevels(start, end)
    for i in range(a:start, a:end)
        echom i .. ' -> ' .. alternate_indent_foldexpr#foldlevel(i)
    endfor
endfunction
