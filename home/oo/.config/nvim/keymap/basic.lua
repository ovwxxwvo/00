-- NEOVIM config, a text editor based on vim.
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.28


local basic = {}

basic.opt = { noremap = true }

basic.a = { 'n', 'i', 'v', 's', 'o', }  -- without, Comd
basic.b = { 'n', 'v', 's', 'o', }       -- without, Comd & Inst

basic.n = 'n'  -- Norm
basic.i = 'i'  -- Inst
basic.c = 'c'  -- Comd
basic.v = 'x'  -- Visl
basic.s = 's'  -- Selt
basic.o = 'o'  -- Oprt

return basic


