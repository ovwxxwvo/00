# FISH config, the friendly interactive shell.
  # bind [(-M | --mode) MODE] [(-m | --sets-mode) NEW_MODE] [--preset | --user] [-s | --silent] [-k | --key] SEQUENCE COMMAND ...
  # bind [(-M | --mode) MODE] [-k | --key] [--preset] [--user] SEQUENCE
  # bind (-K | --key-names) [-a | --all] [--preset] [--user]
  # bind (-f | --function-names)
  # bind (-L | --list-modes)
  # bind (-e | --erase) [(-M | --mode) MODE] [--preset] [--user] [-a | --all] | [-k | --key] SEQUENCE ...


# key move
  bind --user  \ca  beginning-of-line
  bind --user  \cf        end-of-line
  bind --user  \cs      backward-word
  bind --user  \cd       forward-word
  bind --user  \cz       forward-char

# key delete
  bind --user  \cw  backward-kill-word
  bind --user  \ce           kill-word
  bind --user  \cx  backward-kill-line
  bind --user  \cc           kill-line

# key history
  bind --user  \ct    up-or-search
  bind --user  \cg  down-or-search

# key do
  bind --user  \cu  undo
  bind --user  \cr  echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint

# key
  bind --user  \t   complete
  bind --user  \cq  delete-or-exit


