#!/usr/bin/env bash


# bluetooth
  IFS=$'\n'
  BT_LIST=(
    '\n # 60:F4:3A:A6:B3:45 # EDIFIER Lolli Pods Plus '
    )
    # '\n # 88:2D:53:20:4A:02 # xiaodu-A3-6081          '
    # '\n # 99:E6:44:5B:A6:0F # Bluetooth Amp           '
  # echo -e ${#BT_LIST[@]} ${BT_LIST[@]}

# bluetooth
  BT_MACS=(` echo -e ${BT_LIST[@]} | grep '#' \
    | awk -F" # " '{print $2}' \
    `)
  BT_MAC=${BT_MACS[0]}
  # echo ${#BT_MACS[@]} ${BT_MACS[@]}
  # echo ${#BT_DEVS[@]} ${BT_DEVS[@]}

# bluetooth
  BT_ENABLE=$( rfkill | grep 'bluetooth' \
    | grep -Eo 'unblocked$' \
    | grep -c 'unblocked' \
    )
  BT_POWER=$( bluetoothctl show \
    | grep 'Powered:' \
    | grep -Eo '\w+$' \
    | grep -c 'yes' \
    )
  BT_PAIR=$( bluetoothctl info $BT_MAC \
    | grep 'Paired:' \
    | grep -Eo '\w+$' \
    | grep -c 'yes' \
    )
  BT_CONN=$( bluetoothctl info \
    | grep 'Connected:' \
    | grep -Eo '\w+$' \
    | grep -c 'yes' \
    )
  # echo BT $BT_ENABLE $BT_POWER $BT_PAIR $BT_CONN $BT_ID $BT_MAC $BT_DEV

echo -e \
  "\n BT_ENABLE=$BT_ENABLE " \
  "\n BT_POWER=$BT_POWER "   \
  "\n BT_PAIR=$BT_PAIR "     \
  "\n BT_CONN=$BT_CONN "     \
  ""


