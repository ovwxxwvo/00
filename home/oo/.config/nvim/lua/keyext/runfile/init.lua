-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.12.22


local t = require("keyext/runfile/config")

function runfile()
  -- local ext_file = vim.fs.basename(vim.api.nvim_buf_get_name(0)):match(".+%.(%w+)$")
  local name = vim.fs.basename(vim.api.nvim_buf_get_name(0))
  -- print(name)

  for i,v in ipairs(t) do
    local ext = v[1]
    local cmd = v[2]

    if string.match(name, ext) then
      -- print("字符串 '".. name.. "' 包含 '".. ext.. "'")
      print( name..' '.. ext..' '..cmd)
      vim.cmd(cmd)
      return
      end
      end

  print('UNDEFINE FILE, CAN NOT RUN THIS FILE.')
  end


return runfile


