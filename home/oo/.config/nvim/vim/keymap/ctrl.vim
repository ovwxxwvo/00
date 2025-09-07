" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


" Key Fn
  map   <F1> <ESC>:only<CR>:split<CR>:e.<CR><C-w>H
  map!  <F1> <ESC>:only<CR>:split<CR>:e.<CR><C-w>H
  " map   <F1> <ESC>:only<CR>:help<CR><C-w>H
  " map!  <F1> <ESC>:only<CR>:help<CR><C-w>H

" Fold
  let g:fl = 0
  noremap  <C-a> <ESC>:let g:fl=!g:fl<CR>:exec(g:fl)?(":set foldlevel=888"):(":set foldlevel=0")<CR>:set foldlevel?<CR>
  noremap  <C-z> <ESC>za
  noremap! <C-a> <ESC>:let g:fl=!g:fl<CR>:exec(g:fl)?(":set foldlevel=888"):(":set foldlevel=0")<CR>:set foldlevel?<CR>
  noremap! <C-z> <ESC>za

" Copy & Paste
  noremap  <C-\> <ESC>:w !sudo tee %<CR><CR>
  noremap  <C-s> <ESC>:w!<CR>
  noremap! <C-\> <ESC>:w !sudo tee %<CR><CR>
  noremap! <C-s> <ESC>:w!<CR>
  " unmap    <C-v>
  " unmap    <C-c>
  noremap! <C-v> <ESC>pa

" Undo & Redo
  "
  " Undo
  noremap <C-u> u
  " Redo
  " noremap <C-r> <C-r>

" snippits
  noremap  <C-x> a<Space><++><Space><Esc>bhh
  noremap! <C-x>  <Space><++><Space><Esc>bhh
  noremap  <C-c>      /<++><CR>c4l
  noremap! <C-c> <Esc>/<++><CR>c4l


