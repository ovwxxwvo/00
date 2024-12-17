-- NVIM config, a text editor based on vim.
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.30


vim.cmd[[source ~/.config/nvim/deft.vim]]

require("plug")
require("plugin")

local autocmd = os.getenv("HOME").."/.config/nvim/autocmd/"
dofile(autocmd.."filetype.lua"     )

local keymap = os.getenv("HOME").."/.config/nvim/keymap/"
dofile(keymap.."normal.lua")
dofile(keymap.."visual.lua")
dofile(keymap.."contrl.lua")
dofile(keymap.."functn.lua")
dofile(keymap.."window.lua")

local config = os.getenv("HOME").."/.config/nvim/config/"
dofile(config.."mason.luc"     )
dofile(config.."cmp.luc"       )
dofile(config.."telescope.luc" )
dofile(config.."noice.luc"     )
dofile(config.."lualine.luc"   )

dofile(keymap.."plugin.lua")

require("misty")
-- local color = os.getenv("HOME").."/.config/nvim/colors/"
-- dofile(color.."misty.nvim/lua/misty/init.lua")


