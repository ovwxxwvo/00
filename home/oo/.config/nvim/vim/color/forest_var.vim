" NEOVIM config,
" Maintainer:  Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.01


" :so $VIMRUNTIME/syntax/hitest.vim
let g:colors_name = 'forest'


let s:settings = [
  \
  \ ' CocMenuSel       none bold      whte lldk ' ,
  \
  \ ' Normal           none none      gglt xxxx ' ,
  \ ' NormalNC         none none      grlt grdk ' ,
  \ ' MsgArea          none none      gglt xxxx ' ,
  \ ' Title            none bold      yyyy none ' ,
  \ ' TabLine          none italic    ggdk blck ' ,
  \ ' TabLineSel       none bold      ggdk whte ' ,
  \ ' TabLineFill      none none      ggdk blck ' ,
  \ ' WinSeparator     none strikethrough yyyy grey ' ,
  \ ' VertSplit        none strikethrough llll grey ' ,
  \ ' StatusLine       none none      ggdk whte ' ,
  \ ' StatusLineNC     none italic    ggdk blck ' ,
  \ ' StatusLineTerm   none none      ggdk whte ' ,
  \ ' StatusLineTermNC none italic    ggdk blck ' ,
  \ ' Pmenu            none none      ggdk whte ' ,
  \ ' PmenuSel         none bold      whte ggdk ' ,
  \ ' WildMenu         none bold      whte ggdk ' ,
  \ ' QuickFixline     none bold      blck yydk ' ,
  \
  \ ' Folded           none none      ssdk none ' ,
  \ ' FoldColumn       none none      none none ' ,
  \ ' DiffAdd          none none      yyyy rrrr ' ,
  \ ' DiffChange       none none      yyyy rrrr ' ,
  \ ' DiffDelete       none none      yyyy rrrr ' ,
  \ ' DiffText         none none      yyyy rrrr ' ,
  \
  \ ' Cursor           none none      blck yyyy ' ,
  \ ' lCursor          none reverse   none none ' ,
  \ ' CursorLine       none bold      none grdk ' ,
  \ ' CursorColumn     none none      none grdk ' ,
  \ ' CursorLineNr     none bold      yyyy none ' ,
  \ ' LineNr           none none      lldk none ' ,
  \ ' Visual           none none      whte ggdk ' ,
  \ ' Search           none reverse   none none ' ,
  \ ' IncSearch        none reverse   none none ' ,
  \ ' MatchParen       none bold,underdouble none none ' ,
  \
  \ ' Directory        none bold      aalt none ' ,
  \ ' SpecialKey       none bold      yyyy none ' ,
  \ ' NonText          none bold      gggg none ' ,
  \ ' ModeMsg          none bold      yyyy none ' ,
  \ ' MoreMsg          none bold      yyyy none ' ,
  \ ' Question         none bold      llll none ' ,
  \ ' WarningMsg       none bold      mmmm none ' ,
  \ ' ErrorMsg         none bold      rrrr none ' ,
  \
  \ ' Comment          none italic    oooo none ' ,
  \ ' Constant         none none      ccgy none ' ,
  \ ' Identifier       none none      yyyy none ' ,
  \ ' Preproc          none none      yylt none ' ,
  \ ' Statement        none bold      oolt none ' ,
  \ ' Type             none none      aalt none ' ,
  \ ' Special          none none      vvlt none ' ,
  \ ' Ignore           none none      blck grey ' ,
  \ ' Error            none none      whte rrdk ' ,
  \ ' Todo             none none      blck yyyy ' ,
  \
  \ ' Number           none none      cccc none ' ,
  \ ' Float            none none      cccc none ' ,
  \ ' Boolean          none none      cccc none ' ,
  \
  \ ]
  " \ ' xxxx #0d1a0d 013 026 013  - theme  ' ,

let s:colors = [
  \
  \ ' xxxx #0d1a0d 013 026 013  - theme  ' ,
  \
  \ ' blck #000000 000 000 000 黑 black  ' ,
  \ ' grdk #202020 064 064 064  - -      ' ,
  \ ' grey #808080 128 128 128 灰 grey   ' ,
  \ ' grlt #c0c0c0 192 192 192  - -      ' ,
  \ ' whte #ffffff 255 255 255 白 white  ' ,
  \
  \ ' rrrr #ff0000 255 000 000 红 red    ' ,
  \ ' oooo #ff8000 255 128 000 橙 orange ' ,
  \ ' yyyy #ffff00 255 255 000 黄 yellow ' ,
  \ ' llll #80ff00 128 255 000 柠 lime   ' ,
  \ ' gggg #00ff00 000 255 000 绿 green  ' ,
  \ ' ssss #00ff80 000 255 128 春 spring ' ,
  \ ' cccc #00ffff 000 255 255 青 cyan   ' ,
  \ ' aaaa #0080ff 000 128 255 蔚 azure  ' ,
  \ ' bbbb #0000ff 000 000 255 蓝 blue   ' ,
  \ ' vvvv #8000ff 128 000 255 紫 violet ' ,
  \ ' mmmm #ff00ff 255 000 255 洋 magenta' ,
  \ ' pppp #ff0080 255 000 128 粉 pink   ' ,
  \
  \ ' rrgy #c06060 192 096 096  - -      ' ,
  \ ' oogy #c09060 192 144 096  - -      ' ,
  \ ' yygy #c0c060 192 192 096  - -      ' ,
  \ ' llgy #90c060 144 192 096  - -      ' ,
  \ ' gggy #60c060 096 192 096  - -      ' ,
  \ ' ssgy #60c090 096 192 144  - -      ' ,
  \ ' ccgy #60c0c0 096 192 192  - -      ' ,
  \ ' aagy #6090c0 096 144 192  - -      ' ,
  \ ' bbgy #6060c0 096 096 192  - -      ' ,
  \ ' vvgy #9060c0 144 096 192  - -      ' ,
  \ ' mmgy #c060c0 192 096 192  - -      ' ,
  \ ' ppgy #c06090 192 096 144  - -      ' ,
  \
  \ ' rrlt #ff8080 255 128 128  - -      ' ,
  \ ' oolt #ffc080 255 192 128  - -      ' ,
  \ ' yylt #ffff80 255 255 128  - -      ' ,
  \ ' lllt #c0ff80 192 255 128  - -      ' ,
  \ ' gglt #80ff80 128 255 128  - -      ' ,
  \ ' sslt #80ffc0 128 255 192  - -      ' ,
  \ ' cclt #80ffff 128 255 255  - -      ' ,
  \ ' aalt #80c0ff 128 192 255  - -      ' ,
  \ ' bblt #8080ff 128 128 255  - -      ' ,
  \ ' vvlt #c080ff 192 128 255  - -      ' ,
  \ ' mmlt #ff80ff 255 128 255  - -      ' ,
  \ ' pplt #ff80c0 255 128 192  - -      ' ,
  \
  \ ' rrdk #800000 128 000 000  - -      ' ,
  \ ' oodk #804000 128 064 000  - -      ' ,
  \ ' yydk #808000 128 128 000  - -      ' ,
  \ ' lldk #408000 064 128 000  - -      ' ,
  \ ' ggdk #008000 000 128 000  - -      ' ,
  \ ' ssdk #008040 000 128 064  - -      ' ,
  \ ' ccdk #008080 000 128 128  - -      ' ,
  \ ' aadk #004080 000 064 128  - -      ' ,
  \ ' bbdk #000080 000 000 128  - -      ' ,
  \ ' vvdk #400080 064 000 128  - -      ' ,
  \ ' mmdk #800080 128 000 128  - -      ' ,
  \ ' ppdk #800040 128 000 064  - -      ' ,
  \ ]


func! s:init_setting()
  "
  hi clear
	if exists("syntax_on")
	  syntax reset
  else
    syntax on
	endif
  "
  if has("termguicolors")
      set termguicolors
  endif
  "
  if &term =~# '256'
  	let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  	let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  endif
  "
endfunc
func! s:do_setting()
  let colors = s:colors
  for each in colors
    let c = split(each, '\s\+')
    let cmd = 'let ' .c[0]. ' = "' .c[1]. '"'
    exec cmd
    " echo cmd
  endfor
  let none = 'NONE'
  let settings = s:settings
  for each in settings
    let s = split(each, '\s\+')
		" amazing 2 let
    exec join(['let cf = '] + [s[3]], '')
    exec join(['let cb = '] + [s[4]], '')
    let lCmd = ['hi '] + [s[0]] +
          \ [' cterm='] + [s[1]] + [' cterm='] + [s[2]] +
          \   [' gui='] + [s[1]] +   [' gui='] + [s[2]] +
          \ [' guifg='] + [cf]   + [' guibg='] + [cb] "+
          " \ [' cterm=NONE'] + [' cterm='] + [s[1]] +
          " \ [' gui=NONE'] + [' gui=']+[s[1]]+
    let sCmd = join(lCmd, "")
    exec sCmd
    " echo s
    " echo lCmd
    " echo sCmd
  endfor
endfunc


call s:init_setting()
call s:do_setting()


