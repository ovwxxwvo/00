-- NEOVIM config, a text editor based on vim.
-- Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.15


require("lazy").setup({

{ 'williamboman/mason.nvim',
  lazy  = false,
  build = ':MasonUpdate',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    },
  },

{ 'hrsh7th/nvim-cmp',
  lazy  = false,
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'andersevenrud/cmp-tmux',
    'folke/neodev.nvim',
    },
  },

{ 'nvim-telescope/telescope.nvim',
  lazy  = false,
  tag   = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'scrooloose/nerdtree',
    'majutsushi/tagbar',
    },
  },

{ "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
      },
    },
  },

{ 'easymotion/vim-easymotion',
  lazy  = false,
  dependencies = {
    'tpope/vim-surround',
    'tomtom/tcomment_vim',
    'godlygeek/tabular',
    'windwp/nvim-autopairs',
    },
  },

{ "folke/noice.nvim",
  event = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
    }
  },

{ 'nvim-lualine/lualine.nvim',
  lazy  = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'monkoose/matchparen.nvim',
    'yggdroot/indentline',
    }
  },

{ "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    end,
  },

{ 'iamcco/markdown-preview.nvim',
  lazy  = false,
  build = "cd app && yarn install",
  dependencies = { 'dhruvasagar/vim-table-mode' },
  },

})


