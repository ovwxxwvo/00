" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


" set
	au BufRead,BufNewFile,WinEnter,TabEnter *.*
        \ map  <F5> : echo 'UNDEFINE FILE TYPE, CAN NOT RUN THIS FILE.'<CR>
	au BufRead,BufNewFile,WinEnter,TabEnter *.tmx  call MapTmx()
	au BufRead,BufNewFile,WinEnter,TabEnter *.vim  call MapVim()
	au BufRead,BufNewFile,WinEnter,TabEnter *.lua  call MapLua()
	au BufRead,BufNewFile,WinEnter,TabEnter *.sh   call MapSh()
	au BufRead,BufNewFile,WinEnter,TabEnter *.rc   call MapSh()
	au BufRead,BufNewFile,WinEnter,TabEnter *.py   call MapPy()
	au BufRead,BufNewFile,WinEnter,TabEnter *.pyw  call MapPyw()
	au BufRead,BufNewFile,WinEnter,TabEnter *.md   call MapMd()
	au BufRead,BufNewFile,WinEnter,TabEnter *.rasi call MapRasi()

" fun
  function MapTmx()
    set  filetype=tmux
    map  <F5> <C-s>:! tmux source %<CR>
    map! <F5> <C-s>:! tmux source %<CR>
  endfunc
  function MapVim()
    set  filetype=vim
    map  <F5> <C-s>:source %<CR>
    map! <F5> <C-s>:source %<CR>
  endfunc
  function MapLua()
    set  filetype=lua
    map  <F5> <C-s>:! tmux splitw -h tmux -c "lua % ; read"<CR>
    map! <F5> <C-s>:! tmux splitw -h tmux -c "lua % ; read"<CR>
  endfunc
  function MapSh()
    set  filetype=sh
    map  <F5> <C-s>:! tmux splitw -h tmux -c "bash % ; read"<CR>
    map! <F5> <C-s>:! tmux splitw -h tmux -c "bash % ; read"<CR>
  endfunc
  function MapPy()
    " set  filetype=python
    map  <F5> <C-s>:! tmux splitw -h tmux -c "python % ; read"<CR>
    map! <F5> <C-s>:! tmux splitw -h tmux -c "python % ; read"<CR>
  endfunc
  function MapPyw()
    " set  filetype=pyside
    map  <F5> <C-s>:! python % &<CR>
    map! <F5> <C-s>:! python % &<CR>
  endfunc
  function MapMd()
    map  <F5> <C-s>:MarkdownPreview<CR>
    map! <F5> <C-s>:MarkdownPreview<CR>
  endfunc
  function MapRasi()
    set  filetype=cpp
  endfunc


