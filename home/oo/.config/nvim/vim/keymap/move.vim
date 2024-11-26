" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05
  "
  " :h key
  " :h keymap
  " :h cursor-motions
  "
  " noremap
  " noremap!


" Move on Basic
  "
  " move Up
  noremap  k k
  " move Dn
  noremap  l j
  " move Lt
  noremap  j h
  " move Rt
  noremap  ; l

" Move in Line
  "
  " move L Prev Word
  noremap  , b
  " move R Next Word
  noremap  . e
  " move L Bgn of Line
  noremap  m ^
  " move R End of Line
  noremap  / $

" Move in Page
  "
  " move U Bgn of Parag
  noremap  i {
  " move D End of Parag
  noremap  o }
  " move U Up Page
  noremap  <C-k> <C-u>
  " move D Dn Page
  noremap  <C-l> <C-d>

" Move, in & out
  "
  " Search by Identifier
  " noremap <C-/> *
  "
  " Go Bckward
  " noremap <C-o>
  " Go Forward
  " noremap <C-i>

" Move by g
  "
  " move to bof
  noremap gt gg
  " move to eof
  noremap gb G
  "
  " move to Top of Screen
  noremap gr H
  " move to Mid of Screen
  noremap gf M
  " move to Btm of Screen
  noremap gv L
  "
  " Cursor Center
  noremap ga zz
  "
  " Match
  noremap gh %



