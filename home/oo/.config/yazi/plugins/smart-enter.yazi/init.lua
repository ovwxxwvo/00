-- YAZI lua,
-- Maintainer:  Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.10.30


local	function entry ()

local h = cx.active.current.hovered
ya.manager_emit(h and h.cha.is_dir and "enter" or "open", { hovered = true })

end


return { entry = entry }



