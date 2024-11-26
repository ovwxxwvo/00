-- YAZI lua,
-- Maintainer:  Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.14


local function entry()

local file  = ' ~/.config/yazi/plugins/mpserver.yazi/mpserver.sh '
local cmd   = file

local state = io.popen(cmd):read("*a")

ya.notify {
  title   = "mpserver",
  content = state,
  timeout = 2.0,
  }

end


return { entry = entry }


