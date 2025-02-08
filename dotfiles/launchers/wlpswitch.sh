#!/bin/sh

###############################
#All wallpapers
###############################

folder="$HOME/wallpapers"
file_count=$(ls -1 "$folder" | wc -l)

##########################################
#Config property(current wallpaper)
##########################################

CURRENT_WALL=$(hyprctl hyprpaper listloaded)
current_number=$(echo "$CURRENT_WALL" | grep -oP '(?<=/)[0-9]+(?=\.jpg)' )
new_number=$((current_number + 1))

#########################################
#Changing current wallpaper
#########################################

if [ "$new_number" -gt "$file_count" ]; then
  WALLPAPER=$(echo "$CURRENT_WALL" | sed "s|$current_number\.jpg|1.jpg|")
else
  WALLPAPER=$(echo "$CURRENT_WALL" | sed "s|$current_number\.jpg|$new_number.jpg|")
fi

#####################################
#Change wallpaper
#####################################
hyprctl hyprpaper reload ,"$WALLPAPER"


