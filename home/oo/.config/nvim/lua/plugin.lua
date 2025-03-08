-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.25


local module = 'lazy'
if not pcall(require, module) then return end

require(module).setup{
  defaults = { lazy  = false, },
  -- install = { colorscheme = { 'habamax' } },
  spec = {

{ 'asymotion/vim-easymotion',
  dependencies = {
  'scrooloose/nerdtree',
  'majutsushi/tagbar',
  'yggdroot/indentline',
  'tomtom/tcomment_vim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'godlygeek/tabular',
  }, },

{ 'williamboman/mason.nvim',
  dependencies = {
  'neovim/nvim-lspconfig',
  'williamboman/mason-lspconfig.nvim',
  }, },

{ 'hrsh7th/nvim-cmp',
  dependencies = {
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  --
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-path',
  --
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',
  -- 'hrsh7th/cmp-vsnip',
  -- 'hrsh7th/vim-vsnip',
  -- 'saadparwaiz1/cmp_luasnip',
  -- 'L3MON4D3/LuaSnip',
  --
  'windwp/nvim-autopairs',
  'andersevenrud/cmp-tmux',
  'mtoohey31/cmp-fish',
  'folke/lazydev.nvim',
  'zjp-CN/nvim-cmp-lsp-rs',
  --
  'f3fora/cmp-spell',
  'uga-rosa/cmp-dictionary',
  -- 'hrsh7th/cmp-copilot',
  }, },

{ 'nvim-telescope/telescope.nvim',
  dependencies = {
  'nvim-lua/plenary.nvim',
  'BurntSushi/ripgrep',
  'sharkdp/fd',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }, },

{ 'folke/noice.nvim',
  dependencies = {
  'MunifTanjim/nui.nvim',
  -- 'rcarriga/nvim-notify',
  }, },

{ 'nvim-lualine/lualine.nvim',
  dependencies = {
  'nvim-tree/nvim-web-devicons',
  }, },

{ 'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  dependencies = {
  'dhruvasagar/vim-table-mode',
  }, },

{ 'folke/which-key.nvim',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    end,
  },

} }

  -- { 'mikavilpas/yazi.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     open_for_directories = false,
  --     keymaps = {
  --       show_help = '<f1>',
  --       },
  --     },
  --   },


