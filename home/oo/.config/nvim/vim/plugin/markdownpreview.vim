" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


let g:mkdp_browser           = 'firefox'
let g:mkdp_page_title        = '「${name}」'
let g:mkdp_filetypes         = ['markdown']
let g:mkdp_refresh_slow      = 0
let g:mkdp_combine_preview   = 0
let g:mkdp_auto_start        = 0
let g:mkdp_auto_close        = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_echo_preview_url  = 1

" function OpenMarkdownPreview (url)
"   execute "silent ! firefox --new-window " . a:url
"   execute "silent ! firefox & sleep 1 "
"   execute "silent ! firefox --new-tab " . a:url
"   endfunction
" let g:mkdp_browserfunc = 'OpenMarkdownPreview'


