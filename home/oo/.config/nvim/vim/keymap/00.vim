" VIM script, keymap
" Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
" Last Change:	2022.10.20
  "
  " :h key
  " :h keymap
  " :h cursor-motions
  "
  " noremap
  " noremap!


" mapclear
  let g:mapleader = "'"

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

" key new, tab & win
" key focus tab
  noremap <leader>, <ESC>:tabNext<CR>
  noremap <leader>. <ESC>:tabnext<CR>
" key focus win
  noremap  <leader>k <C-w>j
  noremap  <leader>l <C-w>k
  noremap  <leader>j <C-w>h
  noremap  <leader>; <C-w>l
  noremap  <C-SPACE> <ESC><C-w><C-w>
  noremap! <C-SPACE> <ESC><C-w><C-w>
" key move  win out tab
" key move  win  in tab
  noremap     <C-S-UP> <ESC><C-w>K
  noremap   <C-S-DOWN> <ESC><C-w>J
  noremap   <C-S-LEFT> <ESC><C-w>H
  noremap  <C-S-RIGHT> <ESC><C-w>L
" key resize win
  noremap     <C-UP> <ESC>:resize -5<CR>
  noremap   <C-DOWN> <ESC>:resize +5<CR>
  noremap   <C-LEFT> <ESC>:vertical res +5<CR>
  noremap  <C-RIGHT> <ESC>:vertical res -5<CR>
" key toogle win
  noremap      <C-q> <ESC><C-w><C-q>
  noremap!     <C-q> <ESC><C-w><C-q>
  noremap  <leader>t <ESC>:tabe<CR>
  noremap  <leader>w <ESC>:vsplit<CR>

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

" Edit Insert
  "
  " open Line
  noremap w o
  noremap W O
  " Insert Forward
  noremap a i
  noremap A I
  " Append Bckward
  noremap s a
  noremap S A
" Edit Operate
  "
  " Yank
  " noremap t y
  " noremap T Y
  " Paste
  " noremap q p
  " noremap Q P
  "
  " Xdelete
  " Delete
  " Change
  " Replace
  " Substitute

" Visual
  "
  let g:ve=1
  " Virtual Edit
  noremap vv <ESC>:let g:ve=!g:ve<CR>:exec(g:ve)?(":set ve=all"):(":set ve=")<CR>:set ve?<CR>
  " Visual Normal
  noremap vt <ESC>:set ve=all<CR>v
  " Visual Line
  noremap vg <ESC>:set ve=all<CR>V
  " Visual Block
  noremap vb <ESC>:set ve=all<CR><C-v>
  " Visual All
  noremap va <ESC>:set ve=all<CR>0ggVG
  " Visual Parag
  noremap vx <ESC>:set ve=all<CR>{jV}k
  " Visual Line
  noremap vs <ESC>:set ve=all<CR>^<C-v>$
  " Visual Word
  noremap vw <ESC>:set ve=all<CR>b<C-v>e
  noremap ve <ESC>:set ve=all<CR>w<C-v>e
" Search
  "
  " Search by Identifier
  " noremap <C-/> *
  " Search by Text
  noremap ? /
  " jump to Last search
  noremap h Nzz
  " jump to Next search
  noremap n nzz
  "
  " Find
  " Till
" Normal
  "
  nnoremap <ENTER> o<ESC>
  nnoremap <SPACE> i <ESC>
  " Toogel Case
  noremap e ~
  " noremap <s-,> <c-x>
  " noremap <s-.> <c-a>
  " Repeat cmd
  noremap b .
  " Help
  noremap H K
  " Indent Unindent
  "

" Ctrl Do
  "
  " Undo
  noremap <C-u> u
  " Redo
  noremap <C-r> <C-r>
" Ctrl Fold
  let g:fl = 0
  noremap  <C-a> <ESC>:let g:fl=!g:fl<CR>:exec(g:fl)?(":set foldlevel=888"):(":set foldlevel=0")<CR>:set foldlevel?<CR>
  noremap  <C-z> <ESC>za
  noremap! <C-a> <ESC>:let g:fl=!g:fl<CR>:exec(g:fl)?(":set foldlevel=888"):(":set foldlevel=0")<CR>:set foldlevel?<CR>
  noremap! <C-z> <ESC>za
" Ctrl File
  "
  noremap  <C-\> <ESC>:w !sudo tee %<CR><CR>
  noremap  <C-s> <ESC>:w!<CR>
  noremap  <C-c> <ESC>yy
  noremap  <C-v> <ESC>p
  noremap! <C-\> <ESC>:w !sudo tee %<CR><CR>
  noremap! <C-s> <ESC>:w!<CR>
  noremap! <C-c> <ESC>yy
  noremap! <C-v> <ESC>p
" Ctrl Other
  "
  " Search by Identifier
  " noremap <C-/> *
  "
  " Go Bckward
  " noremap <C-o>
  " Go Forward
  " noremap <C-i>

" Key Fn
  "
  map   <F1> <ESC>:only<CR>:help<CR><C-w>H
  map   <F2> <ESC>:e.<CR>
  map!  <F1> <ESC>:only<CR>:help<CR><C-w>H
  map!  <F2> <ESC>:e.<CR>


