# FISH config, the friendly interactive shell.


 yank
CTRL - y
yank-pop
ALT - y
forward-char
Right Arrow
CTRL - f
backward-char
Left Arrow
CTRL - b
forward-word
CTRL - Right Arrow
ALT - f
CTRL - d
backward-word
CTRL - Left Arrow
ALT - b
CTRL - s
beginning-of-history
Page Down
end-of-history
Page Up
fish_clipboard_copy
CTRL - x
fish_clipboard_paste
CTRL - v
cancel
ESC
complete
Tab
pager-toggle-search
CTRL - s
complete-and-search
Shift Tab
commandline\ -f\ expand-abbr\;\ commandline\ -i\ \\n
ALT - Enter
ALT - \r
down-or-search
Down Arrow
CTRL - n
up-or-search
Up Arrow
CTRL - p
forward-bigword
Shift Right
backward-bigword
Shift Left
nextd-or-forward-word
ALT - Right Arrow
prevd-or-backward-word
ALT - Left Arrow
history-token-search-backward
ALT - Up Arrow
ALT - .
history-token-search-forward
ALT - Down Arrow
__fish_list_current_token
ALT - l
__fish_preview_current_file
ALT - o
__fish_whatis_current_token
ALT - w
echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint
CTRL - l
cancel-commandline
CTRL - c
backward-kill-line
CTRL - u
backward-kill-path-component
CTRL - w
end-of-line
End
CTRL - e
CTRL - f
beginning-of-line
Home
CTRL - a
kill-word
ALT - d
delete-or-exit
CTRL - d
'if command -q sudo; fish_commandline_prepend sudo; else if command -q doas; fish_commandline_prepend doas; end'
ALT - s
__fish_man_page
F1
ALT - h
__fish_paginate
ALT - p
__fish_toggle_comment_commandline
ALT - #
edit_command_buffer
ALT - e
ALT - v
'emit fish_focus_in'
unknown-control-sequence
false
unknown-control-sequence
?1004h
paste \e\[200\~ __fish_start_bracketed_paste
-m
paste \e\[201\~ __fish_stop_bracketed_paste
-M
paste '' self-insert
-M
paste \r commandline\ -i\ \\n
-M
paste \' __fish_commandline_insert_escaped\ \\\'\ \$__fish_paste_quoted
-M
paste \\ __fish_commandline_insert_escaped\ \\\\\ \$__fish_paste_quoted
-M
paste ' ' self-insert-notfirst
-M
' self-insert expand-abbr
'
self-insert expand-abbr
';'
'|'
'&'
'>'
'<'
')'
'test -n "$(commandline)" && commandline -i " "'
Nul
'commandline -i " "; commandline -f expand-abbr'
ALT - ;2u
execute
Enter
\r
7;5;13~
;5u
7;2;13~
;2u
kill-line
CTRL - k
delete-char
Delete
backward-delete-char
Backspace
Shift Delete
transpose-chars
CTRL - t
undo
\x1f
CTRL - z
redo
ALT - /
transpose-words
ALT - t
upcase-word
ALT - u
capitalize-word
ALT - c
backward-kill-word
ALT - \x7f
ALT - Backspace
beginning-of-buffer
ALT - <
end-of-buffer
ALT - >
history-pager
CTRL - r

