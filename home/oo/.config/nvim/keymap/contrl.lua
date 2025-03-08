-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.15


local keymap = os.getenv("HOME").."/.config/nvim/keymap/"
local basic = dofile(keymap.."basic.lua")
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
  { a, '<F1>',   '<ESC>:only<CR>:split<CR>:e.<CR><C-w>H', opt, },

  --
  { a, 'Ü',       '<ESC>jA', opt, },

  -- page
  -- { a, '<C-k>',  '<C-u>'       , opt, },
  -- { a, '<C-l>',  '<C-d>'       , opt, },

  -- do
  { a, '<C-u>',  'u'           , opt, },

  -- save
  { a, '<C-\\>', '<ESC>:w !sudo tee %<CR><CR>', opt, },
  { a, '<C-s>',  '<ESC>:w!<CR>', opt, },

  -- paste
  { i, '<C-v>',  '<ESC>pa'     , opt, },

  -- fold
  { a, '<C-a>', '<ESC><cmd>lua if vim.o.foldlevel==0 then vim.o.foldlevel=888 else vim.o.foldlevel=0 end<CR>', opt, },
  { a, '<C-z>', '<ESC>za'      , opt, },

  -- snippits
  { n, '<C-x>', 'a<Space><++><Space><Esc>bhh', opt, },
  { i, '<C-x>', '<Space><++><Space><Esc>bhh' , opt, },
  { n, '<C-c>', '/<++><CR>c4l'               , opt, },
  { i, '<C-c>', '<Esc>/<++><CR>c4l'          , opt, },

  }

for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


