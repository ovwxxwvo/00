# FISH config,


# key
  bind --user  \t   complete
  bind --user  \cq  exit
  bind --user  \cz  undo
  bind --user  \cr  echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint

# key move
  bind --user  \ca  beginning-of-line
  bind --user  \cf        end-of-line
  bind --user  \cs      backward-word
  bind --user  \cd       forward-word

# key delete
  bind --user  \cw  backward-kill-word
  bind --user  \ce           kill-word
  bind --user  \cx  backward-kill-line
  bind --user  \cc           kill-line

# key history
  bind --user  \ct    up-or-search
  bind --user  \cg  down-or-search


