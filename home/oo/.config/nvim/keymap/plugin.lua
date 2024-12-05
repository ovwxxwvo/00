-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.25


local module = "lazy"
if package.loaded[module] == nil then return end


local telescope = require('telescope.builtin')
local lspbuff   = require('vim.lsp.buf')

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

  { n, 'gh',    lspbuff.hover           , {}, },
  { n, 'gs',    lspbuff.signature_help  , {}, },
  { n, 'gd',    lspbuff.definition      , {}, },
  { n, 'gc',    lspbuff.declaration     , {}, },
  { n, 'ge',    lspbuff.type_definition , {}, },
  { n, 'gr',    lspbuff.references      , {}, },
  { n, 'gf',    lspbuff.implementation  , {}, },

  { n, 'ff',    telescope.find_files    , {}, },
  { n, 'fg',    telescope.live_grep     , {}, },
  { n, 'fb',    telescope.buffers       , {}, },
  { n, 'fh',    telescope.help_tags     , {}, },

  { a, '<C-n>', lspbuff.rename          , {}, },

  { a, '<C-t>', ':TagbarToggle<CR>'     , {}, },
  { a, '<C-g>', ':NERDTreeToggle<CR>'   , {}, },

  { n, 'z',     '<Plug>(easymotion-s2)' , {}, },

  }

for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


