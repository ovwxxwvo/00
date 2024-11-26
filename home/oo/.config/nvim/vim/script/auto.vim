" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2021.04.08


autocmd BufWritePre *    :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s*$/  /g
autocmd BufWritePre *.md :%s/^\s\+$//g


autocmd BufNewFile,BufRead *.ash  set filetype=bash
autocmd BufNewFile,BufRead *.bsh  set filetype=bash
autocmd BufNewFile,BufRead *.dsh  set filetype=bash

autocmd BufNewFile,BufRead *.pyw  set filetype=pyside

autocmd BufNewFile,BufRead *.tmx  set filetype=tmux
autocmd BufNewFile,BufRead *.fsh  set filetype=fish

autocmd BufNewFile,BufRead *.rc   set filetype=bash
autocmd BufNewFile,BufRead *.tmux set filetype=tmux

autocmd BufNewFile,BufRead *.rasi set filetype=cpp
autocmd BufNewFile,BufRead *.esp  set filetype=cpp


"autocmd WinLeave * :w


