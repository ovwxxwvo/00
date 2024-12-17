" NEOVIM config, a text editor based on vim.
" Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
" Last Change: 2023.05.05


call plug#begin('~/.config/nvim/plugged')
  " The default plugin directory will be as follows:
  "   - Vim (Linux/macOS): '~/.vim/plugged'
  "   - Vim (Windows): '~/vimfiles/plugged'
  "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
  " You can specify a custom plugin directory by passing it as the argument
  "   - e.g. `call plug#begin('~/.vim/plugged')`
  "   - Avoid using standard Vim directory names like 'plugin'
  "
  " Make sure you use single quotes


call plug#end()
  " Initialize plugin system
  " - Automatically executes `filetype plugin indent on` and `syntax enable`.
  "
  " You can revert the settings after the call like so:
  "   filetype indent off   " Disable file-type-specific indentation
  "   syntax off            " Disable syntax highlighting


