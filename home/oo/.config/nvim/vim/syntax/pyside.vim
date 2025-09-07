" NEOVIM config,
" Language:	Pyside
" Maintainer:	Jessee Chan
" Last Change:  2023.05.05


" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif


 " Read the syntax to start with
runtime! syntax/python.vim
unlet b:current_syntax


let b:current_syntax = "pyside"


" vim:set sw=2 sts=2 ts=8 noet:


