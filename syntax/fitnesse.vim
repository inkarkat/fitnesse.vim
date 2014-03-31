" fitnesse.vim
" @author: Dan Woodward (dan DOT woodward AT gmail.com)

if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

syn sync minlines=200

syn include @xml syntax/xml.vim
syn region   fitnesseXmlRegion
\  start=+<\z([^ /!?<>"']\+\)+
\  skip=+<!--\_.\{-}-->+
\  end=+</\z1\_\s\{-}>+
\  matchgroup=xmlEndTag end=+/>+
\  fold
\  contains=xmlTag,xmlEndTag,xmlCdata,fitnesseXmlRegion,xmlComment,xmlEntity,xmlProcessing,@xmlRegionHook,@Spell,fitnesseExtractVariable
\  keepend
\  extend


syn region fitnesseCollapsibleSection matchgroup=fitnesseSectionMarker start=/!\*\+.*/ end=/\*\+!.*/ contains=TOP transparent fold
syn match fitnesseBang /!/ contains=fitnesseCollapsibleSection
syn match fitnesseLiteralText /!-.\{-}-!/
syn match fitnesseOpenCell /|[^|]\+\n/hs=s+1

syn region fitnesseCellContents start=+|+hs=s+1 end=+|+he=e-1 oneline contains=TOP
syn region fitnesseStyledText matchgroup=fitnesseBracesAndBrackets start=+\[+ end=+\]+ oneline contains=TOP
syn region fitnesseStyledText matchgroup=fitnesseBracesAndBrackets start=+{+ end=+}+ oneline contains=TOP
syn region fitnesseStyledText matchgroup=fitnesseBracesAndBrackets start=+(+ end=+)+ oneline contains=TOP
syn region fitnesseComment start=/\%(^\|\s\)#/ end=/\n/
syn match fitnesseString /"[^"]\+"/ contains=Identifier
syn match fitnesseString /'[^']\+'/ contains=Identifier
syn match fitnesseSymbol /$\w*/
syn match fitnesseExtractVariable /${[^}]*}/
syn match fitnesseBold /'''.*'''/
syn region fitnesseHeading start=/!\d/ end=/\n/
syn match fitnesseWidget /!\w\+[\[{(]/me=e-1,he=e-1
syn match fitnesseKeyword /!define /
syn match fitnesseKeyword /!include /
syn match fitnesseKeyword /![sS]ee /
syn keyword fitnesseKeyword  scenario script Query: start check reject show Comment comment null
syn match fitnesseScenarioVariable /@\w\+/
syn match fitnesseWikiWord /\<[A-Z][a-z]\+[A-Za-z]*[A-Z]\+[A-Za-z]*\>/

highlight def link fitnesseSectionMarker Delimiter
highlight def link fitnesseBracesAndBrackets Delimiter
highlight def link fitnesseCellContents Macro
highlight def link fitnesseBang Delimiter
highlight def link fitnesseComment Comment
highlight def link fitnesseString String
highlight def link fitnesseStyledText Type
highlight def link fitnesseLiteralText Special
highlight def link fitnesseSymbol Identifier
highlight def link fitnesseExtractVariable Identifier
highlight def link fitnesseBold Constant
highlight def link fitnesseHeading Title
highlight def link fitnesseScenarioVariable Identifier
highlight def link fitnesseWidget Statement
highlight def link fitnesseKeyword Keyword
highlight def link fitnesseWikiWord Underlined
highlight def link fitnesseOpenCell Error

let b:current_syntax = "fitnesse"
