#!/usr/bin/env zsh

update_space() {
    # SPACE_ID_1=$(yabai -m query --spaces | jq ".[] | select(.\"is-visible\"==true) | select(.display==1) | .index")
    # SPACE_ID_2=$(yabai -m query --spaces | jq ".[] | select(.\"is-visible\"==true) | select(.display==2) | .index")
    SPACE_ID_1=$(yabai -m query --spaces | jq ".[] | select(.\"has-focus\"==true) | .index")
    MAX_ID=$(yabai -m query --spaces | jq "max_by(.index) | .index")
    ICON_1=$SPACE_ID_1
    ICON_PADDING_LEFT=9
    ICON_PADDING_RIGHT=10
    sketchybar --set $NAME \
      icon=$ICON_1:$MAX_ID \
      icon.padding_left=$ICON_PADDING_LEFT \
      icon.padding_right=$ICON_PADDING_RIGHT 

    # if [[ $SPACE_ID_2 ]]; then
    #     ICON_2=$SPACE_ID_2
    #     ICON_PADDING_LEFT=9
    #     ICON_PADDING_RIGHT=10
    #     sketchybar --set $NAME \
    #       icon=$ICON_2:$MAX_ID \
    #       icon.padding_left=$ICON_PADDING_LEFT \
    #       icon.padding_right=$ICON_PADDING_RIGHT \
    #       display=2
    # fi
}

case "$SENDER" in
"mouse.clicked")
    bc=$(echo $INFO | jq ".button_code")
    if [[ $bc -eq 0 ]]; then
        sketchybar --remove '/.*/'
        source $HOME/.config/sketchybar/sketchybarrc
    elif [[ $bc -eq 1 ]]; then
        yabai -m space --create
    elif [[ $bc -eq 2 ]]; then
        yabai -m space --destroy
    fi
    ;;
*)
    update_space
    ;;
esac
