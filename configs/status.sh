# 1. Get current day/month for the logic
current_day=$(date "+%d.%m.")

  # 2. Determine what to show for the Date/Event section
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

# 3. Print ONLY the date string
  echo "$date_str"
