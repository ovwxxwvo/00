-- NEOVIM config, a text editor based on vim.
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2023.07.15


local basic =  require('keymap/basic')
  local opt = basic.opt
  local a = basic.a

local function mapfn()
  local ext = vim.fs.basename(
    vim.api.nvim_buf_get_name(0)
    ):match(".+%.(%w+)$")
  if     ext == 'sh'   then
    -- vim.o.filetype = 'sh'
    vim.cmd[[ silent ! ~/.config/nvim/exe/bsh.sh % & ]]
  elseif ext == 'bsh'  then
    vim.cmd[[ silent ! ~/.config/nvim/exe/bsh.sh % & ]]
  elseif ext == 'dsh'  then
    vim.cmd[[ silent ! ~/.config/nvim/exe/dsh.sh % & ]]
  elseif ext == 'py'   then
    vim.cmd[[ silent ! ~/.config/nvim/exe/pyt.sh % & ]]
  elseif ext == 'pyw'  then
    vim.cmd[[ silent ! ~/.config/nvim/exe/pyw.sh % & ]]
  elseif ext == 'lua'  then
    vim.cmd[[ silent ! ~/.config/nvim/exe/lua.sh % & ]]
  elseif ext == 'tmx'  then
    vim.cmd[[ ! tmux source % ]]
  elseif ext == 'vim'  then
    vim.cmd[[ source % ]]
  elseif ext == 'rc'   then
    vim.cmd[[ silent ! ~/.config/nvim/exe/bsh.sh % & ]]
  elseif ext == 'tmux'  then
    vim.cmd[[ ! tmux source % ]]
  elseif ext == 'md'   then
    vim.cmd[[ MarkdownPreviewToggle ]]
  elseif ext == 'esp' then
    vim.cmd[[ silent ! ~/.config/nvim/exe/esp.sh % & ]]
  else
    print('UNDEFINE FILE TYPE, CAN NOT RUN THIS FILE.')
  end
  end

local t = {
  { a, '<F5>', mapfn, opt, },
  }
for i,v in ipairs(t) do
  vim.keymap.set(v[1],v[2],v[3],v[4])
  end


