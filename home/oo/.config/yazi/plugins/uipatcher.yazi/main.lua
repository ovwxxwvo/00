-- YAZI lua,
-- Maintainer:  Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.10.30


function Status:mode()
	local mode = tostring(self._tab.mode):sub(1, THEME.status.mode_len):upper()

	local style = self:style()
	return ui.Line {
		-- ui.Span(THEME.status.separator_open):fg(style.main.bg),
		ui.Span(""):fg(style.main.bg),
		ui.Span(" " .. mode .. " "):style(style.main),
		ui.Span(THEME.status.separator_close):fg(style.main.bg):bg(style.alt.bg),
	  }

  end

function Status:name()
	local h = self._tab.current.hovered
	if not h then return ui.Line {} end

 	local linked = h.link_to
 	if linked ~= nil then
 		linked = " -> " .. tostring(linked)
 	  return ui.Line(" " .. h.name .. linked)
 	  end

  -- local mounted = io.popen("findmnt -n --output SOURCE,FSTYPE ".."'"..tostring(h.url).."'"):read("*a")
 	-- if mounted ~= "" then
 	-- 	mounted = " <- " .. mounted
 	--   return ui.Line(" " .. h.name .. mounted)
  --   end

  end

function Header:logo()
  Header:children_add(function()
    -- return ui.Line {}
  	return ui.Span("  " .. THEME.header.logo_char .. " "):fg(THEME.header.logo_fg)
  end, 500, Header.RIGHT)
  end

function Header:host()
  Header:children_add(function()
  	if ya.target_family() ~= "unix" then
  		return ui.Line {}
  	end
  	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. " "):fg(THEME.header.host_fg)
  end, 500, Header.LEFT)
  end

function Status:owner()
  Status:children_add(function()
  	local h = cx.active.current.hovered
  	if h == nil or ya.target_family() ~= "unix" then
  		return ui.Line {}
  	end
  	return ui.Line {
  		ui.Span(" "),
  		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg(THEME.status.user_fg),
  		ui.Span(":"),
  		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg(THEME.status.group_fg),
  		ui.Span(" "),
  	}
  end, 500, Status.RIGHT)
  end

return {
setup = function(_, config)

  -- THEME.header.logo_fg   = ""
  -- THEME.header.host_fg   = ""
  -- THEME.status.user_fg   = ""
  -- THEME.status.group_fg  = ""
  -- THEME.header.logo_char = "󰇥"
  -- THEME.status.mode_len  = 2

	config = config or {}

  Header:logo()
  Header:host()
  Status:owner()

  end
  }


