# FISH config,
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.08.18


function fish_prompt --description "Informative prompt"
  # #>❯
    # Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    # Export for __fish_print_pipestatus
    set -lx __fish_last_status $status

  if functions -q fish_is_root_user; and fish_is_root_user
    printf "%s%s%s %s%s%s# " $USER \
    (prompt_hostname) (set -q fish_color_cwd_root \
      and set_color $fish_color_cwd_root \
      or set_color  $fish_color_cwd \
      ) \
    (prompt_pwd)      (set_color normal)

  else
    set -l status_color      (set_color        $fish_color_status)
    set -l statusb_color     (set_color --bold $fish_color_status)
    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    printf "%s %s%s%s %s %s %s%s%s %s \n" \
      (set_color b0b0b0)"["(date "+%H:%M:%S")"]" \
      (set_color 5080b0)$USER\
      (set_color b0b0b0)"@"\
      (set_color 50b080)(prompt_hostname)\
      (set_color b0b050)$PWD $pipestatus_string\
      (set_color normal)
    if fish_is_root_user ; echo -n (set_color d03030)"# " ; end
    echo -n \
      (set_color ffa0ff)">"(set_color a0ffff)">"(set_color ffffa0)">"\
      (set_color a0a0ff)">"(set_color a0ffa0)">"(set_color ffa0a0)">"\
      " "
    set_color normal

  end
end


