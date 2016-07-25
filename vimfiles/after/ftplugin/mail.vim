setlocal textwidth=72
setlocal formatoptions=tcrqwanj

" Tweaked version of
" http://www.mdlerch.com/emailing-mutt-and-vim-advanced-config.html
function s:IsReply()
    " FIXME: Instead of doing this, check for sig line first real content, or, 
    " possibly better, if content matches sig

    " New emails start with a blank line. Replies start with a header
    if len(getline(1)) > 0
        return 1
    else
        return 0
    endif
endfunction

function FormatReply()
    if (s:IsReply())
        " Format everything except the sig
        :silent 1,$-3!par w72q
        " Add space to end of lines in paragraphs
        :silent 1,$-3s/^.\+\ze\n\(>*$\)\@!/\0 /e
        " Remove spaces from blank lines
        :silent 1,$-3s/^>*\zs\s\+$//e
        " Space-stuff lines within quotes
        :silent 1,$-3s/\v^(\>+)([^ >])/\1 \2/e
        :1
        :put! =\"\n\n\"
        :1
    endif
endfunction
