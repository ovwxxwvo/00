-- NEOVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.09.10


local t = {
-- { property,            fg,       bg,              rvrs,  bold, italic, uline, ucurl, udouble, },

  { "normal",             "NONE",      "NONE",      false, false, false, false, false, false, },
  { "StatusLine",         "NONE",      "NONE",      false, false, false, false, false, false, },
  { "MsgArea",            "NONE",      "NONE",      false, false, false, false, false, false, },
  { "WinSeparator",       "#ffffe0", "#101010", false, false, false, false, false, true,  },
  { "VertSplit",          "#f0ffe0", "#101010", false, false, false, false, false, false, },
  { "QuickFixline",       "#ffffa0", "#101010", false, false, false, false, false, false, },
  { "NormalNC",           "NONE",      "#303030", false, false, false, false, false, false, },
  { "StatusLineNC",       "NONE",      "#303030", false, false, false, false, false, false, },

  { "TabLine",            "NONE",      "NONE",      false, false, false, false, false, false, },
  { "Pmenu",              "NONE",      "NONE",      false, false, false, false, false, false, },
  { "TabLineFill",        "NONE",      "NONE",      false, false, false, false, false, false, },
  { "WildMenu",           "NONE",      "NONE",      false, false, false, false, false, false, },
  { "TabLineSel",         "NONE",      "#f0f0f0", false, true,  false, false, false, false, },
  { "PmenuSel",           "NONE",      "#f0f0f0", false, true,  false, false, false, false, },

  { "CmpItemAbbrDefault", "NONE",      "NONE",      false, false, false, false, false, false, },
  { "CmpItemKindDefault", "#b0b0b0", "NONE",      false, false, false, false, false, false, },

  { "Cursor",             "#101010", "#f0f0f0", false, false, false, false, false, false, },
  { "CursorLine",         "NONE",      "#303030", false, true,  false, false, false, false, },
  { "CursorColumn",       "NONE",      "#002010", false, true,  false, false, false, false, },
  { "CursorLineNr",       "#ffff60", "NONE",      false, false, false, false, false, false, },
  { "LineNr",             "#50a000", "NONE",      false, false, false, false, false, false, },

  { "Visual",             "NONE",      "#006030", false, false, false, false, false, false, },
  { "Search",             "NONE",      "#003060", false, false, false, false, false, false, },
  { "CurSearch",          "#101010", "#ffffa0", false, true,  false, false, false, false, },
  { "MatchParen",         "#f0f0f0", "#8030d0", false, true,  false, false, true,  true,  },

  { "Question",           "#ffb060", "NONE",      false, false, false, false, false, false, },
  { "SpecialKey",         "#ffff60", "NONE",      false, false, false, false, false, false, },
  { "Directory",          "#b0ff60", "NONE",      false, false, false, false, false, false, },
  { "Title",              "#60ffff", "NONE",      false, false, false, false, false, false, },

  { "MoreMsg",            "#ffff60", "NONE",      false, false, false, false, false, false, },
  { "ModeMsg",            "#ffb060", "NONE",      false, false, false, false, false, false, },
  { "WarningMsg",         "#ff60ff", "NONE",      false, false, false, false, false, false, },
  { "ErrorMsg",           "#ff6060", "NONE",      false, false, false, false, false, false, },

  { "Ignore",             "#a0ffd0", "#505050", false, false, false, false, false, false, },
  { "Todo",               "#002010", "#ffffa0", false, false, false, false, false, false, },
  { "Error",              "#e0fff0", "#600000", false, false, false, false, false, false, },

  { "Comment",            "#b0b0b0", "NONE",      false, false, true,  false, false, false, },
  { "Folded",             "#505050", "NONE",      false, false, true,  false, false, false, },

  { "Special",            "#ffb060", "NONE",      false, false, false, false, false, false, },
  { "Type",               "#ffffa0", "NONE",      false, false, false, false, false, false, },
  { "Statement",          "#ffff60", "NONE",      false, false, false, false, false, false, },
  { "Function",           "#60ffb0", "NONE",      false, false, false, false, false, false, },
  { "Method",             "#a0ffd0", "NONE",      false, false, false, false, false, false, },
  { "Identifier",         "#60b0ff", "NONE",      false, false, false, false, false, false, },
  { "Preproc",            "#a0d0ff", "NONE",      false, false, false, false, false, false, },

  { "String",             "#80b050", "NONE",      false, false, false, false, false, false, },
  { "Number",             "#d0ffa0", "NONE",      false, false, false, false, false, false, },
  { "Float",              "#d0ffa0", "NONE",      false, false, false, false, false, false, },
  { "Boolean",            "#d0ffa0", "NONE",      false, false, false, false, false, false, },
  { "Underlined",         "#b0ff60", "NONE",      false, false, false, false, false, false, },
  { "Operator",           "#d0a0ff", "NONE",      false, false, false, false, false, false, },

  -- { "Constant",           "#e02020", "NONE",      false, false, false, false, false, false, },
  -- { "Struct",             "#ff60b0", "NONE",      false, false, false, false, false, false, },

  -- { "lualine_a_normal"  , "#101010", "#a0ffff", false, false, false, false, false, false, },
  -- { "lualine_b_normal"  , "#101010", "#a0ffff", false, false, false, false, false, false, },
  -- { "lualine_c_normal"  , "#101010", "#a0ffff", false, false, false, false, false, false, },
  -- { "lualine_a_visual"  , "#101010", "#ffd0a0", false, false, false, false, false, false, },
  -- { "lualine_b_visual"  , "#101010", "#ffd0a0", false, false, false, false, false, false, },
  -- { "lualine_c_visual"  , "#101010", "#ffd0a0", false, false, false, false, false, false, },
  -- { "lualine_a_insert"  , "#101010", "#d0ffa0", false, false, false, false, false, false, },
  -- { "lualine_b_insert"  , "#101010", "#d0ffa0", false, false, false, false, false, false, },
  -- { "lualine_c_insert"  , "#101010", "#d0ffa0", false, false, false, false, false, false, },
  -- { "lualine_a_replace" , "#101010", "#ffa0d0", false, false, false, false, false, false, },
  -- { "lualine_b_replace" , "#101010", "#ffa0d0", false, false, false, false, false, false, },
  -- { "lualine_c_replace" , "#101010", "#ffa0d0", false, false, false, false, false, false, },
  -- { "lualine_a_command" , "#101010", "#d0a0ff", false, false, false, false, false, false, },
  -- { "lualine_b_command" , "#101010", "#d0a0ff", false, false, false, false, false, false, },
  -- { "lualine_c_command" , "#101010", "#d0a0ff", false, false, false, false, false, false, },
  -- { "lualine_a_inactive", "#101010", "#d0d0d0", false, false, false, false, false, false, },
  -- { "lualine_b_inactive", "#101010", "#d0d0d0", false, false, false, false, false, false, },
  -- { "lualine_c_inactive", "#101010", "#a0ffd0", false, false, false, false, false, false, },
  -- { "lualine_a_terminal", "#101010", "#ffffa0", false, false, false, false, false, false, },
  -- { "lualine_b_terminal", "#101010", "#ffffa0", false, false, false, false, false, false, },
  -- { "lualine_c_terminal", "#101010", "#ffffa0", false, false, false, false, false, false, },

  }

-- NoiceCmdline 	MsgArea 	Normal for the classic cmdline area at the bottom"
-- NoiceCmdlineIcon 	DiagnosticSignInfo 	Cmdline icon
-- NoiceCmdlineIconCalculator 	NoiceCmdlineIcon
-- NoiceCmdlineIconCmdline 	NoiceCmdlineIcon
-- NoiceCmdlineIconFilter 	NoiceCmdlineIcon
-- NoiceCmdlineIconHelp 	NoiceCmdlineIcon
-- NoiceCmdlineIconIncRename 	NoiceCmdlineIcon
-- NoiceCmdlineIconInput 	NoiceCmdlineIcon
-- NoiceCmdlineIconLua 	NoiceCmdlineIcon
-- NoiceCmdlineIconSearch 	DiagnosticSignWarn 	Cmdline search icon (/ and ?)
-- NoiceCmdlinePopup 	Normal 	Normal for the cmdline popup
-- NoiceCmdlinePopupBorder 	DiagnosticSignInfo 	Cmdline popup border
-- NoiceCmdlinePopupBorderCalculator 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderCmdline 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderFilter 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderHelp 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderIncRename 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderInput 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderLua 	NoiceCmdlinePopupBorder
-- NoiceCmdlinePopupBorderSearch 	DiagnosticSignWarn 	Cmdline popup border for search
-- NoiceCmdlinePopupTitle 	DiagnosticSignInfo 	Cmdline popup border
-- NoiceCmdlinePrompt 	Title 	prompt for input()
-- NoiceCompletionItemKindClass 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindColor 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindConstant 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindConstructor 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindDefault 	Special
-- NoiceCompletionItemKindEnum 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindEnumMember 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindField 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindFile 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindFolder 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindFunction 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindInterface 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindKeyword 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindMethod 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindModule 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindProperty 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindSnippet 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindStruct 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindText 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindUnit 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindValue 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemKindVariable 	NoiceCompletionItemKindDefault
-- NoiceCompletionItemMenu 	none 	Normal for the popupmenu
-- NoiceCompletionItemWord 	none 	Normal for the popupmenu
-- NoiceConfirm 	Normal 	Normal for the confirm view
-- NoiceConfirmBorder 	DiagnosticSignInfo 	Border for the confirm view
-- NoiceCursor 	Cursor 	Fake Cursor
-- NoiceFormatConfirm 	CursorLine
-- NoiceFormatConfirmDefault 	Visual
-- NoiceFormatDate 	Special
-- NoiceFormatEvent 	NonText
-- NoiceFormatKind 	NonText
-- NoiceFormatLevelDebug 	NonText
-- NoiceFormatLevelError 	DiagnosticVirtualTextError
-- NoiceFormatLevelInfo 	DiagnosticVirtualTextInfo
-- NoiceFormatLevelOff 	NonText
-- NoiceFormatLevelTrace 	NonText
-- NoiceFormatLevelWarn 	DiagnosticVirtualTextWarn
-- NoiceFormatProgressDone 	Search 	Progress bar done
-- NoiceFormatProgressTodo 	CursorLine 	progress bar todo
-- NoiceFormatTitle 	Title
-- NoiceLspProgressClient 	Title 	Lsp progress client name
-- NoiceLspProgressSpinner 	Constant 	Lsp progress spinner
-- NoiceLspProgressTitle 	NonText 	Lsp progress title
-- NoiceMini 	MsgArea 	Normal for mini view
-- NoicePopup 	NormalFloat 	Normal for popup views
-- NoicePopupBorder 	FloatBorder 	Border for popup views
-- NoicePopupmenu 	Pmenu 	Normal for the popupmenu
-- NoicePopupmenuBorder 	FloatBorder 	Popupmenu border
-- NoicePopupmenuMatch 	Special 	Part of the item that matches the input
-- NoicePopupmenuSelected 	PmenuSel 	Selected item in the popupmenu
-- NoiceScrollbar 	PmenuSbar 	Normal for scrollbar
-- NoiceScrollbarThumb 	PmenuThumb 	Scrollbar thumb
-- NoiceSplit 	NormalFloat 	Normal for split views
-- NoiceSplitBorder 	FloatBorder 	Border for split views
-- NoiceVirtualText 	DiagnosticVirtualTextInfo 	Default hl group for virtualtext views

for i,v in ipairs(t) do
  vim.api.nvim_set_hl(0, v[1], {
  fg          = v[2] ,
  bg          = v[3] ,
  reverse     = v[4] ,
  bold        = v[5] ,
  italic      = v[6] ,
  underline   = v[7] ,
  undercurl   = v[8] ,
  underdouble = v[9] ,
  -- link= SomeOtherHighlight,
  -- ctermfg= ,
  -- ctermbg= ,
  })
  end


