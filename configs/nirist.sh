#!/bin/bash

while true; do
  # CPU & RAM
  cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%0.0f", usage}')
  ram=$(free -k | awk '/^Mem:/ {printf "%.1f/%.1f GB", $3/1024/1024, $2/1024/1024}')
  
  # 1. Always get the current time
  clock_str=$(date "+ %H:%M")
  
  # 2. Get current day/month for the logic
  current_day=$(date "+%d.%m.")
  
  # 3. Determine what to show for the Date/Event section
  if [ "$current_day" == "29.01." ]; then
      date_str=" Happy Birthday!"
  elif [ "$current_day" == "04.05." ]; then
      date_str="󰓎 May the Fourth be with you!"
  elif [ "$current_day" == "17.12." ]; then
      date_str="Wish Mom a birthday!"
  elif [ "$current_day" == "28.06." ]; then
      date_str="Wish Dad a birthday!"
  elif [ "$current_day" == "30.05." ]; then
      date_str="Živjela zemljo naša!"
  elif [ "$current_day" == "14.03." ]; then
      date_str="π day!"
  elif [ "$current_day" == "01.01." ]; then
      date_str="Happy New Year!"
  elif [ "$current_day" == "18.11." ]; then
      date_str="Dan sjećanja | Minecraft day"
  else
      # Default: Just the standard date
      date_str=$(date "+ %d.%m.%Y.")
  fi

  vol=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2 * 100 "%"}')

  # 4. Print the line with both Clock and Date/Event separated by a pipe
  echo " 󰍛 $cpu% |   $ram | $date_str | $clock_str |   $vol "

  sleep 1
done

