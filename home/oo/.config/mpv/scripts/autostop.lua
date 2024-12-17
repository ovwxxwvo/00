-- MPV script, if current file is images, and playback has been pause.


function on_file_loaded()
  local file = mp.get_property("path")
  local ext = file:match("%.([^.]+)$")
  if ext == "jpg" or ext == "png" or ext == "gif" then
    mp.set_property("pause", "yes")
    mp.msg.warn('File is images, playback has been pause.')
    end
  end

mp.register_event("file-loaded", on_file_loaded)


