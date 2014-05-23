hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "hack"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine  	ctermbg=233 cterm=none
  hi CursorLineNr 	ctermfg=220 ctermbg=235
  hi CursorColumn 	ctermbg=235
  hi MatchParen 	ctermfg=157 ctermbg=237 cterm=none
  hi Pmenu 			ctermfg=255 ctermbg=237
  hi PmenuSel 		ctermfg=0 ctermbg=148
endif

" General colors
hi Cursor 			ctermbg=241
hi Normal 			ctermfg=248 ctermbg=232
hi NonText 			ctermfg=244 ctermbg=232
hi LineNr 			ctermfg=244 ctermbg=232
hi StatusLine 		ctermfg=253 ctermbg=235 cterm=none
hi StatusLineNC 	ctermfg=253 ctermbg=233 cterm=none
hi VertSplit 		ctermfg=238 ctermbg=237 cterm=none
hi Folded 			ctermbg=4 ctermfg=248
hi Title			ctermfg=254 cterm=none
hi Visual			ctermfg=254 ctermbg=4
hi SpecialKey		ctermfg=244 ctermbg=235

" Syntax highlighting
hi Comment 			ctermfg=244
hi Todo 			ctermfg=244
hi Boolean      	ctermfg=202
hi String 			ctermfg=112
hi Identifier 		ctermfg=214
hi Function 		ctermfg=255
hi Type 			ctermfg=25
hi Statement 		ctermfg=97
hi Keyword			ctermfg=9
hi htmlTag			ctermfg=248
hi htmlTagName		ctermfg=25
hi htmlArg			ctermfg=255
hi htmlEndTag		ctermfg=248

hi Constant 		ctermfg=9
hi Number			ctermfg=9
hi Special			ctermfg=9
hi PreProc 			ctermfg=202 
