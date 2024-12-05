-- YAZI lua config,


THEME.header = THEME.header or {}
THEME.status = THEME.status or {}
THEME.git    = THEME.git or {}


THEME.header.logo_char   = " 󰇥 "
THEME.status.mode_len    = 6

THEME.git.modified_sign  = "*"
THEME.git.added_sign     = "+"
THEME.git.deleted_sign   = "-"
THEME.git.updated_sign   = "^"
THEME.git.ignored_sign   = "~"
THEME.git.untracked_sign = "?"

THEME.header.logo_fg     = "#ffd0a0"
THEME.header.host_fg     = "#a0d0ff"
THEME.status.user_fg     = ""
THEME.status.group_fg    = ""

THEME.git.modified_fg    = ""
THEME.git.added_fg       = ""
THEME.git.deleted_fg     = ""
THEME.git.updated_fg     = ""
THEME.git.ignored_fg     = ""
THEME.git.untracked_fg   = ""


return {}


