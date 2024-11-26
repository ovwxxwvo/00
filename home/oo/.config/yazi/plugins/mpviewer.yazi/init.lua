-- YAZI lua, let yazi auto exec shell script.
-- Maintainer:  Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.14


local M = {}

function M:peek()

	local start, url = os.clock(), ya.file_cache(self)
	-- if not url or not fs.cha(url) then url = self.file.url end
	ya.sleep(math.max(0, PREVIEW.image_delay / 1000 + start - os.clock()))

  u = self.file.url
    x = self.area.x
    y = self.area.y
    w = self.area.w
    h = self.area.h

  file  = ' ~/.config/yazi/plugins/mpviewer.yazi/mpv_play.sh '
  para  = "'"..u.."'"..' '..x..' '..y..' '..w..' '..h..' '
  cmd = file..para

  os.execute(cmd)
  -- os.execute("echo 'hello'")

  end

function M:seek() end


return M


