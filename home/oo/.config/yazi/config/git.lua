-- YAZI lua config,


THEME.git = THEME.git or {}
  -- print(Style)
  -- THEME.git.modified       = ui.Style():fg("#b08050")
  -- THEME.git.added          = ui.Style():fg("#8050b0")
  -- THEME.git.deleted        = ui.Style():fg("#b05080")
  -- THEME.git.untracked      = ui.Style():fg("#808080")
  -- THEME.git.updated        = ui.Style():fg("#50b0b0")
  -- THEME.git.ignored        = ui.Style():fg("#80b050")

THEME.git.modified_fg    = "#b08050"
THEME.git.added_fg       = "#8050b0"
THEME.git.deleted_fg     = "#b05080"
THEME.git.updated_fg     = "#50b0b0"
THEME.git.ignored_fg     = "#80b050"
THEME.git.untracked_fg   = "#808080"

THEME.git.modified_sign  = "*"
THEME.git.added_sign     = "+"
THEME.git.deleted_sign   = "-"
THEME.git.updated_sign   = "^"
THEME.git.ignored_sign   = "~"
THEME.git.untracked_sign = "?"

return {}


