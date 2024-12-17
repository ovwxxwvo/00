-- NEOVIM config, a text editor based on vim.
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

  { n, 'vv', ':set ve=all<CR>'       , opt, },  -- Virtual Edit
  { n, 'vt', ':set ve=all<CR>v'      , opt, },  -- Visual Normal
  { n, 'vg', ':set ve=all<CR>V'      , opt, },  -- Visual Line
  { n, 'vb', ':set ve=all<CR><C-v>'  , opt, },  -- Visual Block
  { n, 'va', ':set ve=all<CR>0ggVG'  , opt, },  -- Visual All
  { n, 'vx', ':set ve=all<CR>{jV}k'  , opt, },  -- Visual Parag
  { n, 'vs', ':set ve=all<CR>^<C-v>$', opt, },  -- Visual Line
  { n, 'vw', ':set ve=all<CR>b<C-v>e', opt, },  -- Visual Word
  { n, 've', ':set ve=all<CR>w<C-v>e', opt, },  -- Visual Word

  -- { v, 'i',  '{',  opt, },  -- move Up Bgn of Para
  -- { v, 'o',  '}',  opt, },  -- move Dn End of Para

  -- { o, 'ow',  'aw',  opt, },  -- word
  -- { o, 'ox',  'aW',  opt, },  -- bigword
  -- { o, 'os',  'as',  opt, },  -- sentence
  -- { o, 'op',  'ap',  opt, },  -- paragraph
  -- { o, 'ob',  'ab',  opt, },  -- ()
  -- { o, 'og',  'aB',  opt, },  -- {}
  -- { o, 'ot',  'at',  opt, },  -- <>
  -- { o, 'o)',  'a)',  opt, },  --
  -- { o, 'o(',  'a(',  opt, },  --
  -- { o, 'o}',  'a}',  opt, },  --
  -- { o, 'o{',  'a{',  opt, },  --
  -- { o, 'o>',  'a>',  opt, },  --
  -- { o, 'o<',  'a<',  opt, },  --
  -- { o, 'o]',  'a]',  opt, },  --
  -- { o, 'o[',  'a[',  opt, },  --
  -- { o, 'o\'', 'a\'', opt, },  --
  -- { o, 'o\"', 'a\"', opt, },  --
  -- { o, 'o`',  'a`',  opt, },  --
  --
  -- { o, 'iw',  'iw',  opt, },  -- word
  -- { o, 'ix',  'iW',  opt, },  -- bigword
  -- { o, 'is',  'is',  opt, },  -- sentence
  -- { o, 'ip',  'ip',  opt, },  -- paragraph
  -- { o, 'ib',  'ib',  opt, },  -- ()
  -- { o, 'ig',  'iB',  opt, },  -- {}
  -- { o, 'it',  'it',  opt, },  -- <>
  -- { o, 'i)',  'i)',  opt, },  --
  -- { o, 'i(',  'i(',  opt, },  --
  -- { o, 'i}',  'i}',  opt, },  --
  -- { o, 'i{',  'i{',  opt, },  --
  -- { o, 'i>',  'i>',  opt, },  --
  -- { o, 'i<',  'i<',  opt, },  --
  -- { o, 'i]',  'i]',  opt, },  --
  -- { o, 'i[',  'i[',  opt, },  --
  -- { o, 'i\'', 'i\'', opt, },  --
  -- { o, 'i\"', 'i\"', opt, },  --
  -- { o, 'i`',  'i`',  opt, },  --

  }

for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


