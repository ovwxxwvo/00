-- NEOVIM config, a text editor based on vim.
-- Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.15


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup(plugins, opts)


