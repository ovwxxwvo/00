" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2021.04.08


autocmd BufWritePre *    :%s/\s\+$//e
autocmd BufWritePre *.md :%s/$/  /e
autocmd BufWritePre *.md :%s/^\s\+$//e


