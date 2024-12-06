" First we set up the paragraph item. It allows nested paragraphs because s
let regexEmbed = '([^)]\+)'

" And now the :syntax items

"
" Header
"

syn match inwebAllInOneMetaData '\%^\_.\{-}\ze\n@'
syn match inwebSectionTitle '\%^.*\.'
" Includes the dot, otherwise it somehow loses in priority against vimUsrCmd
syn match inwebSectionDescription '\.\n\_.\{-}\(^@\)\@=' contained containedin=inwebSectionTitle

"
" Paragraphing, etc
"

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
exe 'syn match inwebCommentaryMarker ''= '..regexEmbed..'$'' contained containedin=inwebCommentary'
syn match inwebCommentaryMarker '^@' contained containedin=inwebCommentary
syn match inwebCommentaryMarker '^=' contained containedin=inwebCommentary
syn match inwebCommentaryMarker '=$' contained containedin=inwebCommentary
syn match inwebDefine '\(^@\)\@<=d\(efine\)\? .*' contained containedin=inwebCommentary
syn match inwebDefine '\(^@\)\@<=default .*' contained containedin=inwebCommentary
syn match inwebEnum '\(^@\)\@<=enum .*' contained containedin=inwebCommentary
syn match inwebHeading '\(^@\)\@<=h\(eading\)\? [^.]\+\.' contained containedin=inwebCommentary
" inwebCommentary takes precedence over inwebNamedParagraph I think because
" the ^ comes before the @
syn match inwebNamedParagraph '@<.\{-}@>' containedin=ALL
execute 'syn match inwebEmbed ''\(= \)\@<='..regexEmbed..''' contained containedin=inwebCommentaryMarker'

"
" Commentary Special Notation
"

syn match inwebReference '//.*//' contained containedin=inwebCommentary
syn match inwebReferenceArrow '->' contained containedin=inwebReference
syn match inwebCode '|[^|]\+|' contained containedin=inwebCommentary
syn match inwebFootnote '\[\d\+]' contained containedin=inwebCommentary
syn match inwebListItem '^([^) ]*)' contained containedin=inwebCommentary

"
" Highlighting
"
" FIXME: Should this be in here?
"

hi link inwebSectionTitle Removed

hi link inwebCommentary Question
hi link inwebCommentaryMarker Removed
hi link inwebDefine Macro
hi link inwebEnum Structure
hi link inwebHeading Removed
hi link inwebNamedParagraph Changed
hi link inwebEmbed Normal

hi link inwebReference Changed
hi link inwebReferenceArrow Delimiter
hi link inwebCode Added
hi link inwebFootnote PreProc
hi link inwebListItem PreProc
