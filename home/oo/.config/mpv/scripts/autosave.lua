-- autosave.lua
  --
  -- Periodically saves "watch later" data during playback, rather than only saving on quit.
  -- This lets you easily recover your position in the case of an ungraceful shutdown of mpv (crash, power failure, etc.).
  --
  -- You can configure the save period by creating a "lua-settings" directory inside your mpv configuration directory.
  -- Inside the "lua-settings" directory, create a file named "autosave.conf".
  -- The save period can be set like so:
  --
  -- save_period=60
  --
  -- This will set the save period to once every 60 seconds of playback, time while paused is not counted towards the save period timer.
  -- The default save period is 30 seconds.


local o = {
	save_period = 1
}

local mp = require 'mp'
local options = require 'mp.options'
options.read_options(o)

local function save_state()
  --print("===========================================")
  local time_remain = tonumber(mp.get_property("time-remaining"))
  if time_remain > 10 then
	  mp.command("write-watch-later-config")
  else
    mp.command("delete-watch-later-config")
  end
end
local timer_save = mp.add_periodic_timer(o.save_period, save_state)

local function timer_onpause(pause, bool)
	if bool then
		timer_save:stop()
	else
		timer_save:resume()
	end
end

local function check_type()
  --print(mp.get_property("file-format"))
  if mp.get_property("file-format") == "mp3" then
		timer_save:kill()
    mp.command("delete-watch-later-config")
  else
    mp.observe_property("pause", "bool", timer_onpause)
  end
end

mp.register_event("file-loaded", check_type)
--mp.register_event("start-file", check_type)
--mp.register_event("end-file", check_type)


