"This is the regular expression used for highlighting broken comments:
"\(^\[.\{-}\]\*\|[^*]\[.\{-}\]\*\|\*\[.\{-}\]$\|\*\[.\{-}\][^*]\)
"
"It's an alternation built from the following four smaller regexps:
"
"Comments missing start asterisks:
"^\[.\{-}\]\*     - at start of line
"[^*]\[.\{-}\]\*  - mid line
"
"Comments missing end asterisks:
"\*\[.\{-}\]$     - at end of line
"\*\[.\{-}\][^*]  - mid line

"Highlight *[Tom's comments]* for liveblogs
syntax match TomComment /\*\[[^]*]\{-}\]\*/
"Highlight comments missing start or end asterisks
syntax match TomBrokenComment /\(^\[.\{-}\]\*\|[^*]\[.\{-}\]\*\|\*\[.\{-}\]$\|\*\[.\{-}\][^*]\)/

highlight TomComment guifg=#6c71c4 ctermfg=lightmagenta
highlight TomBrokenComment guifg=#dc322f ctermfg=red


