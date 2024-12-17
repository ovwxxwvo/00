" NEOVIM config,
" Language:	dash
" Maintainer:	Jessee Chan
" Last Change:  2024.11.05


" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif


 " Read the syntax to start with
runtime! syntax/sh.vim
unlet b:current_syntax


let b:current_syntax = "dash"


" vim: ts=16 fdm=marker


