#!/bin/bash

PLAYER="$(echo "$INFO" | jq -r '.app')"
PLAYERSTATE="$(echo "$INFO" | jq -r '.state')"
CURRENTARTIST="$(echo "$INFO" | jq -r '.artist')"
CURRENTSONG="$(echo "$INFO" | jq -r '.title')"

if [[ "$PLAYER" = "Music" || "$PLAYER" = "Spotify" ]]; then
  ARGS=(drawing=on label.drawing=on icon.padding_right=20 icon="" background.drawing=on)
  if [[ "$PLAYERSTATE" = "playing" ]]; then
    ARGS+=(label="$CURRENTARTIST :- $CURRENTSONG" background.image=media.artwork)
  fi
else
  ARGS=(icon="" label.drawing=off icon.padding_right=3 background.drawing=off)
fi

sketchybar --set $NAME "${ARGS[@]}"

if [[ $SENDER == "mouse.clicked" ]]; then
  if [[ "$MODIFIER" == "cmd" ]]; then
    ACTION="activate"
  elif [[ "$MODIFIER" == "shift" ]]; then
    ACTION="next track"
  elif [[ "$MODIFIER" == "none" ]]; then
    ACTION="playpause"
  fi
  osascript -e "tell application \"Spotify\" to $ACTION"
fi
