# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

reminders=(
  "${notification_defaults[@]}"
  icon=$ICON_TODO
  script="$PLUGIN_DIR/reminders.sh"
  click_script="open -a /System/Applications/Reminders.app"
  popup.align=right
)

sketchybar --add item reminders right \
  --set reminders "${reminders[@]}" \
  --subscribe reminders system_woke front_app_switched
