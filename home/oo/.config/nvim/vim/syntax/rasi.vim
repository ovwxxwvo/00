" NEOVIM config,
" Language:	Rasi
" Maintainer:	Jessee Chan
" Last Change:  2023.06.15


" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif


 " Read the syntax to start with
runtime! syntax/c.vim
unlet b:current_syntax


let b:current_syntax = "rasi"


" vim: ts=16 fdm=marker


