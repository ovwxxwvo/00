-- YAZI lua config,


-- os.execute("echo config yatline")
return {

  -- ¦
	-- section_separator = { open = "", close = "" },
	-- part_separator    = { open = "", close = "" },
	-- inverse_separator = { open = "", close = "" },
	section_separator = { open = "", close = "" },
	part_separator    = { open = "" , close = "" },
	inverse_separator = { open = "", close = "" },

	style_a = {
		fg = "#101010",
		bg_mode = {
			normal = "#a0d0ff",
			select = "#ffd0a0",
			un_set = "#d0ffa0",
		  }
	  },
	style_b = { fg = "#a0d0ff", bg = "#303030" },
	style_c = { fg = "reset",     bg = "reset" },

	permissions_s_fg = "#b0b0b0",
	permissions_t_fg = "#a0d0ff",
	permissions_r_fg = "#5080b0",
	permissions_w_fg = "#5080b0",
	permissions_x_fg = "#5080b0",

	tab_width       = 2,
	tab_use_inverse = false,

	selected  = { icon = "󰻭", fg = "#b08050" },
	copied    = { icon = "", fg = "#8050b0" },
	cut       = { icon = "", fg = "#b05080" },

	total     = { icon = "󰮍", fg = "#5050b0" },
	succ      = { icon = "", fg = "#50b050" },
	fail      = { icon = "", fg = "#b05050" },
	found     = { icon = "󰮕", fg = "#b0b050" },
	processed = { icon = "󰐍", fg = "#b08050" },

	show_background     = true,
	display_header_line = true,
	display_status_line = true,

	header_line = {
		left  = {
			section_a = {
			  },
			section_b = {
			  },
			section_c = {
        {type = "string",   custom = false, name = "hovered_path", params = {"left"}},
			  },
		  },
		right = {
			section_a = {
			  },
			section_b = {
			  },
			section_c = {
        {type = "coloreds", custom = true,  name = {{" 󰇥 ", "#ffd0a0"}}},
       	{type = "coloreds", custom = false, name = "count"},
        {type = "coloreds", custom = true,  name = {{"¦ ", "#a0d0ff"}}},
       	{type = "line",     custom = false, name = "tabs", params = {"right"} },
			  },
		  }
	  },

	status_line = {
		left = {
			section_a = {
       	{type = "string", custom = false, name = "tab_mode"},
			  },
			section_b = {
       	{type = "string", custom = false, name = "hovered_size"},
			  },
			section_c = {
       	{type = "string", custom = false, name = "hovered_name"},
			  }
		  },
		right = {
			section_a = {
       	{type = "string", custom = false, name = "cursor_position"},
			  },
			section_b = {
       	{type = "string", custom = false, name = "cursor_percentage"},
			  },
			section_c = {
       	{type = "coloreds", custom = false, name = "permissions"},
       	{type = "coloreds", custom = false, name = "task_states"},
			  }
		  },
	  },

}


