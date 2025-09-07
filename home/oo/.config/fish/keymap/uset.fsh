# FISH config,
  # bind [(-M | --mode) MODE] [(-m | --sets-mode) NEW_MODE] [--preset | --user] [-s | --silent] [-k | --key] SEQUENCE COMMAND ...
  # bind [(-M | --mode) MODE] [-k | --key] [--preset] [--user] SEQUENCE
  # bind (-K | --key-names) [-a | --all] [--preset] [--user]
  # bind (-f | --function-names)
  # bind (-L | --list-modes)
  # bind (-e | --erase) [(-M | --mode) MODE] [--preset] [--user] [-a | --all] | [-k | --key] SEQUENCE ...


for c in a b c d e f g h i j k l m n o p q r s t u v w x y z
  # echo "^$c"
  bind  --erase --all  "\e$c"
  bind  --erase --all  "\c$c"
  end


