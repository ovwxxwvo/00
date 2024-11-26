" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


" Vim-airline, statusline is the colored line at the bottom, which contains the sections.
  " let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep        = ''
  let g:airline_right_sep       = ''
  let g:airline_symbols         = {}
  let g:airline_symbols.linenr  = ' L:'
  let g:airline_symbols.colnr   = ' C:'
  let g:airline_symbols.whitespace = '-'
  let g:airline_symbols.maxlinenr  = ''


" NERDTree, a file system explorer for the Vim editor.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Indentline, displaying thin vertical lines at each indentation level for code indented with spaces.
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  let g:markdown_syntax_conceal=0


