hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "hack_light"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine  	ctermbg=253 cterm=none
  hi CursorLineNr 	ctermfg=208 ctermbg=255
  hi CursorColumn 	ctermbg=236
  hi MatchParen 	ctermfg=226 ctermbg=236 cterm=none
  hi Pmenu 			ctermfg=255 ctermbg=236
  hi PmenuSel 		ctermfg=0 ctermbg=34
endif

" General colors
hi Cursor 			ctermbg=241
hi Normal 			ctermfg=236 ctermbg=255
hi NonText 			ctermfg=244 ctermbg=255
hi LineNr 			ctermfg=236 ctermbg=252
hi StatusLine 		ctermfg=255 ctermbg=236 cterm=none
hi StatusLineNC 	ctermfg=255 ctermbg=246 cterm=none
hi VertSplit 		ctermfg=236 ctermbg=236 cterm=none
hi Folded 			ctermbg=4 ctermfg=236
hi Title			ctermfg=236 cterm=none
hi Visual			ctermfg=236 ctermbg=4
hi SpecialKey		ctermfg=236 ctermbg=252

" Syntax highlighting
hi Comment 			ctermfg=254 ctermbg=244
hi Todo 			ctermfg=245
hi Boolean      	ctermfg=208
hi String 			ctermfg=34 ctermbg=none
hi Identifier 		ctermfg=34
hi Function 		ctermfg=236
hi Type 			ctermfg=26 
hi Statement 		ctermfg=93 
hi Keyword			ctermfg=196
hi Constant 		ctermfg=196
hi Number			ctermfg=196
hi Special			ctermfg=196
hi PreProc 			ctermfg=208 
