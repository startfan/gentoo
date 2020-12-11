" Vim syntax file
" Language:	GNU Assembler
" Maintainer:	Erik Wognsen <erik.wognsen@gmail.com>
"		Previous maintainer:
"		Kevin Dahlhausen <kdahlhaus@yahoo.com>
" Last Change:	2014 Feb 04

" Thanks to Ori Avtalion for feedback on the comment markers!

" quit when a syntax file was already loaded
if exists("b:current_syntax")
 finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore
setlocal iskeyword+=

" Assembler directives start with a '.' and may contain upper case (e.g.,
" .ABORT), numbers (e.g., .p2align), dash (e.g., .app-file) and underscore in
" CFI directives (e.g., .cfi_startproc). This will also match labels starting
" with '.', including the GCC auto-generated '.L' labels.
syn match asmDirective		"\.[A-Za-z][0-9A-Za-z-_]*"


syn case match

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

" The default methods for highlighting.  Can be overridden later
hi def link asmSection	Special
hi def link asmDirective	Statement



highlight purple ctermfg=13 
highlight green ctermfg=Green 
highlight white  ctermfg=White 
highlight blue ctermfg=Blue 
highlight red ctermfg=Red 
highlight yellow ctermfg=Yellow
syn match asmIdentifier		"[a-zA-Z_0-9]*"
syn region asmComment		start="/\*" end="\*/" 
syn region asmComment		start="//" end="$" 
syn match asmLabel		"[a-zA-Z_0-9][a-zA-Z0-9_]*:"
syn match asmInclude		"^#include"
syn match asmCond		"^#if"
syn match asmCond		"^#else"
syn match asmCond		"^#endif"
syn match asmCond		"^#elif"
syn match asmCond		"^#ifdef"
syn match asmType "\.long"
syn match asmType "\.ascii"
syn match asmType "\.asciz"
syn match asmType "\.byte"
syn match asmType "\.double"
syn match asmType "\.float"
syn match asmType "\.hword"
syn match asmType "\.int"
syn match asmType "\.octa"
syn match asmType "\.quad"
syn match asmType "\.short"
syn match asmType "\.single"
syn match asmType "\.space"
syn match asmType "\.string"
syn match asmType "\.word"
syn match asmType "\.align"
syn match asmType "\.globl"
syn keyword asmjump b  bne beq bl cbz cbnz br ret

hi def link asmIdentifier	green
hi def link asmComment	white
hi def link asmLabel	purple
hi def link asmInclude	blue
hi def link asmCond	blue
hi def link asmjump red
hi def link asmType	yellow
let b:current_syntax = "asm"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
