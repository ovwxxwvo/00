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
THEME.status.user_fg     = "#50b0b0"
THEME.status.group_fg    = "#50b0b0"

THEME.git.modified_fg    = "#b08050"
THEME.git.added_fg       = "#8050b0"
THEME.git.deleted_fg     = "#b05080"
THEME.git.updated_fg     = "#50b0b0"
THEME.git.ignored_fg     = "#80b050"
THEME.git.untracked_fg   = "#808080"


return {}


