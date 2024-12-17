" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


" basic
  " mapclear
  let g:mapleader = "'"

" tab & win
  noremap   <C-SPACE>   <ESC><C-w><C-w>
  noremap!  <C-SPACE>   <ESC><C-w><C-w>
  noremap   <C-q>       <ESC><C-w><C-q>
  noremap!  <C-q>       <ESC><C-w><C-q>
  noremap   <leader>m   <ESC>:tabe<CR>
  noremap   <leader>[   <ESC>:split<CR>
  noremap   <leader>]   <ESC>:vsplit<CR>

" tab focus
  noremap   <leader>,   <ESC>:tabNext<CR>
  noremap   <leader>.   <ESC>:tabnext<CR>
" win focus
  noremap   <leader>j   <C-w>h
  noremap   <leader>k   <C-w>j
  noremap   <leader>l   <C-w>k
  noremap   <leader>;   <C-w>l

" win move out tab
  "
  "
" win move  in tab
  noremap  <C-S-UP>     <ESC><C-w>K
  noremap  <C-S-DOWN>   <ESC><C-w>J
  noremap  <C-S-LEFT>   <ESC><C-w>H
  noremap  <C-S-RIGHT>  <ESC><C-w>L
" win resize
  noremap  <C-UP>       <ESC>:resize -5<CR>
  noremap  <C-DOWN>     <ESC>:resize +5<CR>
  noremap  <C-LEFT>     <ESC>:vertical res +5<CR>
  noremap  <C-RIGHT>    <ESC>:vertical res -5<CR>



