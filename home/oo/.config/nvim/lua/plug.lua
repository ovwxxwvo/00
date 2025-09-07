-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.25


-- Boot lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.opt.rtp:prepend(lazypath)
end
  -- local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  -- local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- if vim.v.shell_error ~= 0 then
  --   vim.api.nvim_echo({
  --     { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
  --     { out, "WarningMsg" },
  --     { "\nPress any key to exit..." },
  --   }, true, {})
  --   vim.fn.getchar()
  --   os.exit(1)
  -- end


-- Set  lazy.nvim
require("lazy")


