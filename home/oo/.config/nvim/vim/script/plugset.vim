" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


" NERDTree, a file system explorer for the Vim editor.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Indentline, displaying thin vertical lines at each indentation level for code indented with spaces.
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  let g:markdown_syntax_conceal=0


" MarkdownPreview, on your modern browser with synchronised scrolling and flexible configuration
  function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
    endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
  let g:mkdp_browser      = 'firefox'
  let g:mkdp_page_title   = '「${name}」'
  let g:mkdp_filetypes    = ['markdown']
  let g:mkdp_auto_start   = 0
  let g:mkdp_auto_close   = 1
  let g:mkdp_refresh_slow = 0


