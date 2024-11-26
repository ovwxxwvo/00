-- NEOVIM config, a text editor based on vim.
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.15


-- vim.g.mapleader = '<SPACE>'
vim.g.mapleader = '\''
local basic =  require('keymap/basic')
  local opt = basic.opt
  local a = basic.a
  local b = basic.b
  local n = basic.n
  local i = basic.i
  local c = basic.c
  local v = basic.v
  local s = basic.s
  local o = basic.o

local t = {

  -- tab & win
  { a, '<C-SPACE>'  , '<ESC><C-w><C-w>'          , opt, },
  { a, '<C-q>'      , '<ESC><C-w><C-q>'          , opt, },
  { n, '<leader>m'  , '<ESC>:tabnew<CR>'         , opt, },
  { n, '<leader>['  , '<ESC>:split<CR>'          , opt, },
  { n, '<leader>]'  , '<ESC>:vsplit<CR>'         , opt, },

  -- tab focus
  { n, '<leader>,'  , '<ESC>:tabNext<CR>'        , opt, },
  { n, '<leader>.'  , '<ESC>:tabnext<CR>'        , opt, },
  -- win focus
  { n, '<leader>j'  , '<C-w>h'                   , opt, },
  { n, '<leader>k'  , '<C-w>j'                   , opt, },
  { n, '<leader>l'  , '<C-w>k'                   , opt, },
  { n, '<leader>;'  , '<C-w>l'                   , opt, },

  -- win move  in tab
  { a, '<C-S-UP>'   , '<ESC><C-w>K'              , opt, },
  { a, '<C-S-DOWN>' , '<ESC><C-w>J'              , opt, },
  { a, '<C-S-LEFT>' , '<ESC><C-w>H'              , opt, },
  { a, '<C-S-RIGHT>', '<ESC><C-w>L'              , opt, },

  -- win resize
  { a, '<C-UP>'     , '<ESC>:resize -2<CR>'      , opt, },
  { a, '<C-DOWN>'   , '<ESC>:resize +2<CR>'      , opt, },
  { a, '<C-LEFT>'   , '<ESC>:vertical res +2<CR>', opt, },
  { a, '<C-RIGHT>'  , '<ESC>:vertical res -2<CR>', opt, },

  }

for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


