#!/bin/bash

screen_width=$(xdotool getdisplaygeometry | awk '{print $1}')
screen_height=$(xdotool getdisplaygeometry | awk '{print $2}')

last_time=0

while true; do
    
    eval "$(xdotool getmouselocation --shell)"
    
    current_time=$(date +%s)

    # Yukarı kenar veya aşağı kenar kontrolü
    if [[ "$Y" -ge "$((screen_height - 1))" || "$Y" -le 0 ]]; then
        if [[ "$last_time" -eq 0 ]]; then
            last_time=$current_time
        elif [[ "$((current_time - last_time))" -ge 2 ]]; then
            if [[ "$Y" -ge "$((screen_height - 1))" ]]; then
                xdotool mousemove "$X" 0
            elif [[ "$Y" -le 0 ]]; then
                xdotool mousemove "$X" $((screen_height - 1))
            fi
            last_time=0
        fi
    elif [[ "$X" -le 0 ]]; then
        xdotool mousemove $((screen_width - 1)) "$Y"
    elif [[ "$X" -ge "$((screen_width - 1))" ]]; then
        xdotool mousemove 0 "$Y"
    else
        last_time=0
    fi

    
    sleep 0.1
done

