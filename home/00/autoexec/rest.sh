#!/usr/bin/env dash


wait_sec() {

while true; do
  time=$( date +%S )
  echo $time
  if [ "$time" = "00" ] ;then
    break
    fi
  sleep 1
done

}

wait_min() {

while true; do
  time=$( date +%M )
  echo $time
  if [ "$time" = "00" -o "$time" = "20" -o "$time" = "40" ] ;then
    swaylock &
    fi
  sleep 60
done

}

wait_sec
wait_min


