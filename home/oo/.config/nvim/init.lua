-- NEOVIM config, a text editor based on vim.
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.11.30


vim.cmd[[source ~/.config/nvim/deft.vim]]

require('lazy-nvim')

require('script.plugdown')

require('plugin.noice')
require('plugin.lualine')
require('plugin.matchparen')
require('plugin.mason')
require('plugin.cmp')
require('plugin.telescope')

require('keymap.normal')
require('keymap.visual')
require('keymap.contrl')
require('keymap.functn')
require('keymap.window')
require('keymap.plugin')

require('color.defaut')


