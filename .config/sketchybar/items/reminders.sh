# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

reminders=(
  "${notification_defaults[@]}"
  icon=$ICON_TODO
  update_freq=60
  script="$PLUGIN_DIR/reminders.sh"
  click_script="open -a /System/Applications/Reminders.app"
  popup.align=right
)

reminders_popup=(
  icon.drawing=off
  label.padding_left=0
  label.scroll_duration=100
)

sketchybar --add item reminders right \
  --set reminders "${reminders[@]}" \
  --subscribe reminders system_woke \
  mouse.entered \
  mouse.exited \
  mouse.exited.global \
  --add item reminders.details popup.reminders \
  --set reminders.details "${menu_defaults[@]}" "${reminders_popup[@]}"
