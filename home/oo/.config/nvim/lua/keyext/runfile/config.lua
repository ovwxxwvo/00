-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.12.02


local t = {
  { "%.sh"  , " silent ! ~/.config/nvim/lua/keyext/runfile/bsh.sh % & " , },
  { "%.bsh" , " silent ! ~/.config/nvim/lua/keyext/runfile/bsh.sh % & " , },
  { "%.dsh" , " silent ! ~/.config/nvim/lua/keyext/runfile/dsh.sh % & " , },
  { "%.py"  , " silent ! ~/.config/nvim/lua/keyext/runfile/pyt.sh % & " , },
  { "%.pyw" , " silent ! ~/.config/nvim/lua/keyext/runfile/pyw.sh % & " , },

  { "main.c", " silent ! ~/.config/nvim/lua/keyext/runfile/cpp.sh % & " , },
  { "%.rs"  , " silent ! ~/.config/nvim/lua/keyext/runfile/rst.sh % & " , },

  { "%.tmux", " silent ! tmux source % " , },
  { "%.tmx" , " silent ! tmux source % " , },
  { "%.vim" , " source % "               , },

  { "%.md"  , " source ~/.config/nvim/lua/keyext/runfile/md.vim " , },

  }

return t


