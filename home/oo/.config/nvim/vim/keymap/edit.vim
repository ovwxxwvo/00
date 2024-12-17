" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


" Edit
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



