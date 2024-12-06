"
" Regular Expressions
"
"

" Snippets we will use in multiple places.
"
" FIXME: The code that handle embeds is broken: they are not always followed
"        by a new paragraph, so the can occur within the commentary without
"        being followed by code.
" FIXME: Handle extracts of code properly (separate from embeds?) and allow
"        them to end mid-paragraph by adding a new `=`
" FIXME: Require embeds to start with known keywords, carousel, figure, etc.
let reEmbedBrackets = '([^)]\+)'
let reParaStart = '\(^@\)'
let reParaStartLookBehind = reParaStart..'\@<='

" All the more complicated regexes for the syntax items
"
let reSectionDescription = '/\.\n\_.\{-}'..reParaStart..'\@=/'
let reCommentaryEnd = '/^\(@.*\)\?=\( '..reEmbedBrackets..'\)\?$/'
let reCommentaryEmpty = '/^@\(<.\{-}@>\)\? =\( '..reEmbedBrackets..'\)\?$/'
let reCommentaryMarkerWithEmbed = '/= '..reEmbedBrackets..'$/'
let reDefine = '/'..reParaStartLookBehind..'d\(efine\)\? .*/'
let reDefault = '/'..reParaStartLookBehind..'default .*/'
let reEnum = '/'..reParaStartLookBehind..'enum .*/'
let reHeading = '/'..reParaStartLookBehind..'h\(eading\)\? [^.]\+\./'
let reNamedPara = '/@<.\{-}@>/'
let reEmbed = '/\(= \)\@<='..reEmbedBrackets..'/'

"
" And now the :syntax items
"

"
" Header
"

syn match inwebAllInOneMetaData /\%^\_.\{-}\ze\n@/
syn match inwebSectionTitle /\%^.*\./
" Includes the dot, otherwise it somehow loses in priority against vimUsrCmd
exe 'syn match inwebSectionDescription '..reSectionDescription..' contained containedin=inwebSectionTitle'

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
exe 'syn region inwebCommentary start=/^@/ end='..reCommentaryEnd..' keepend contains=inwebCommentary'
" We also need to match paragraphs that don't contain any commentary:
"
"   @ =
"   @<blah blah@> =
"   @ = (blah blah)
exe 'syn match inwebCommentary '..reCommentaryEmpty
exe 'syn match inwebCommentaryMarker '..reCommentaryMarkerWithEmbed..' contained containedin=inwebCommentary'
syn match inwebCommentaryMarker /^@/ contained containedin=inwebCommentary
syn match inwebCommentaryMarker /^=/ contained containedin=inwebCommentary
syn match inwebCommentaryMarker /=$/ contained containedin=inwebCommentary
exe 'syn match inwebDefine '..reDefine..' contained containedin=inwebCommentary'
exe 'syn match inwebDefault '..reDefault..' contained containedin=inwebCommentary'
exe 'syn match inwebEnum '..reEnum..' contained containedin=inwebCommentary'
exe 'syn match inwebHeading '..reHeading..' contained containedin=inwebCommentary'
" inwebCommentary takes precedence over inwebNamedParagraph I think because
" the ^ comes before the @
syn match inwebNamedParagraph '..reNamedPara..' containedin=ALL
execute 'syn match inwebEmbed '..reEmbed..' contained containedin=inwebCommentaryMarker,inwebCommentary'

"
" Commentary Special Notation
"

syn match inwebReference "//.*//" contained containedin=inwebCommentary
syn match inwebReferenceArrow /->/ contained containedin=inwebReference
syn match inwebCode /|[^|]\+|/ contained containedin=inwebCommentary
syn match inwebFootnote /\[\d\+]/ contained containedin=inwebCommentary
syn match inwebListItem /^([^) ]*)/ contained containedin=inwebCommentary

"
" Highlighting
"

hi default link inwebSectionTitle Removed

hi default link inwebCommentary Question
hi default link inwebCommentaryMarker Removed
hi default link inwebDefine Macro
hi default link inwebDefine inwebDefault
hi default link inwebEnum Structure
hi default link inwebHeading Removed
hi default link inwebNamedParagraph Changed
hi default link inwebEmbed Normal

hi default link inwebReference Changed
hi default link inwebReferenceArrow Delimiter
hi default link inwebCode Added
hi default link inwebFootnote PreProc
hi default link inwebListItem PreProc
