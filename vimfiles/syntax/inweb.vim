" First we set up the paragraph item. It allows nested paragraphs because s
let regexEmbed = '([^)]\+)'

" Paragraphs comments start with an ampersand at the start of a line, and they
" end at an equals sign, which can optionally have stuff before or after it:
"
"   @<blah blah@> =
"   = (blah blah)
"
" I have already forgotten why I implemented it this way, but paragraphs can
" contain other paragraphs. (Something to do with some paragraphs having no
" code.)
exe 'syn region inwebCommentary start=''^@'' end=''^\(@.*\)\?=\( '..regexEmbed..'\)\?$'' keepend contains=inwebCommentary'
" We also need to match paragraphs that don't contain any commentary:
"
"   @ =
"   @<blah blah@> =
"   @ = (blah blah)
exe 'syn match inwebCommentary ''^@\(<.\{-}@>\)\? =\( '..regexEmbed..'\)\?$'''
" inwebCommentary takes precedence I think because the ^ comes before the @
syn match inwebNamedParagraph '@<.\{-}@>' containedin=ALL
syn match inwebReference '//.*//' contained containedin=inwebCommentary
syn match inwebCode '|[^|]\+|' contained containedin=inwebCommentary
syn match inwebReferenceArrow '->' contained containedin=inwebReference
syn match inwebHeading 'heading[^.]\+.' contained containedin=inwebCommentary
syn match inwebCommentaryMarker '^@' contained containedin=inwebCommentary
syn match inwebCommentaryMarker '^=' contained containedin=inwebCommentary
syn match inwebCommentaryMarker '=$' contained containedin=inwebCommentary
exe 'syn match inwebCommentaryMarker ''= '..regexEmbed..'$'' contained containedin=inwebCommentary'
execute 'syn match inwebEmbed '''..regexEmbed..''' contained containedin=inwebCommentaryMarker'
syn match inwebSectionTitle '\%^.*'
syn match inwebSectionDescription '\n\_.\{-}\(^@\)\@=' containedin=inwebSectionTitle
syn match inwebFootnote '\[\d\+]' contained containedin=inwebCommentary
syn match inwebListItem '^([^) ]*)' contained containedin=inwebCommentary
"syn match inwebPreamble '\%^\_.\{-}\(^@\)\@='

"syn match inwebCommentaryDelimiter '[@=]' contained containedin=inwebCommentary

hi link inwebNamedParagraph Changed
hi link inwebReference Changed
hi link inwebReferenceArrow Delimiter
hi link inwebCode Added
hi link inwebCommentary Question
hi link inwebHeading Removed
hi link inwebSectionTitle Removed
hi link inwebCommentaryMarker Removed
hi link inwebEmbed Normal
hi link inwebFootnote PreProc
hi link inwebListItem PreProc
"hi link inwebCommentaryDelimiter Error
