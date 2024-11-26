-- NEOVIM config, a text editor based on vim.
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.15


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

  { b, 'k',  'k',        opt, },  -- move Up
  { b, 'l',  'j',        opt, },  -- move Dn
  { b, 'j',  'h',        opt, },  -- move Lt
  { b, ';',  'l',        opt, },  -- move Rt

  { b, ',',  'b',        opt, },  -- move Lt Prev Word
  { b, '.',  'e',        opt, },  -- move Rt Next Word
  { b, 'm',  '^',        opt, },  -- move Lt Bgn of Line
  { b, '/',  '$',        opt, },  -- move Rt End of Line

  { b, 'i',  '{',        opt, },  -- move Up Bgn of Para
  { b, 'o',  '}',        opt, },  -- move Dn End of Para
  { n, 'I',  '<C-u>',    opt, },  -- move Up half page
  { n, 'O',  '<C-d>',    opt, },  -- move Dn half page

  { n, 'K',  '<C-o>',    opt, },  -- move backward
  { n, 'L',  '<C-i>',    opt, },  -- move forward

  { b, 'a',  'i',        opt, },  -- insert
  { b, 's',  'a',        opt, },  -- append
  { b, 'w',  'o',        opt, },  -- open

  { b, 'A',  'I',        opt, },  -- insert
  { b, 'S',  'A',        opt, },  -- append
  { b, 'W',  'O',        opt, },  -- open
  { b, 'H',  'K',        opt, },  -- help

  { b, '?',  '/',        opt, },  -- search
  { b, 'N',  ':nhl<CR>', opt, },  -- search undo
  { b, 'h',  'N',        opt, },  -- jump to Last search
  { b, 'n',  'n',        opt, },  -- jump to Next search
  -- { b, 'h',  '#',        opt, },  -- jump to Last search
  -- { b, 'n',  '*',        opt, },  -- jump to Next search

  { b, 'gt', 'gg',       opt, },  -- move to bof
  { b, 'gb', 'G',        opt, },  -- move to eof
  { b, 'gq', 'H',        opt, },  -- move to Top of Screen
  { b, 'ga', 'M',        opt, },  -- move to Mid of Screen
  { b, 'gz', 'L',        opt, },  -- move to Btm of Screen
  { b, 'gh', 'zz',       opt, },  -- Cursor Center
  { b, 'gm', '%',        opt, },  -- Match

  { b, 'e',  '~',        opt, },  -- swap Case
  { b, 'er', 'gU',       opt, },  -- make Uppercase
  { b, 'ef', 'gu',       opt, },  -- make LOWERcase

  { b, '<ENTER>', 'o<ESC>' , opt, },
  { b, '<SPACE>', 'i <ESC>', opt, },

  }

for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


