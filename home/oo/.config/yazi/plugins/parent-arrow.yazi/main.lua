--- @sync entry


local function entry(self, job)
  local unit = job.args[1]

	local parent = cx.active.parent
	if not parent then return end

	local target = parent.files[parent.cursor + 1 + unit]
	if target and target.cha.is_dir then
		ya.manager_emit("cd", { target.url })
	  end

  end


return { entry = entry }


