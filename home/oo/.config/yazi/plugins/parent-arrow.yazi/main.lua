--- @since 26.1.10
--- @sync entry


local function entry(_, job)
	local parent = cx.active.parent
	if not parent then return end

	local offset = tonumber(job.args[1])
	if not offset then
		return ya.err(job.args[1], "is not a number")
	end

	local idx = parent.cursor + 1 + offset
	local target = parent.files[idx]
	if target and target.cha.is_dir then
		ya.emit("cd", { target.url })
	end
end

return { entry = entry }


