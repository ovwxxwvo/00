-- YAZY config,
-- Maintainer:  Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.10.30


local config = os.getenv("HOME").."/.config/yazi/config/"


require("autoshell")

require("session"  ):setup(dofile(config.."session.lua"))
require("uipatcher"):setup(dofile(config.."uipatcher.lua"))
require("git"      ):setup()


-- require("mpviewer" )
-- require("folder-rules"):setup()


