-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.12.22


local keyext  = require("keyext")

local keymap = os.getenv("HOME").."/.config/nvim/keymap/"
local basic  = dofile(keymap.."basic.lua")
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

  { a, "<F5>",  keyext.runfile        , {}, },

  }

for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


