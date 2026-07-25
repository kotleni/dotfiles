#!/usr/bin/env bash

uptime_info=$(uptime -p | sed -e 's/up //g')
host=$(hostnamectl hostname)

options=("Lock" "Suspend" "Logout" "Reboot" "Shutdown" "Hibernate")
icons=("" "" "󰿅" "󱄌" "" "󰒲")

rofi_cmd() {
    options_with_icons=()
    for ((i = 0; i < ${#options[@]}; i++)); do
        options_with_icons+=("${icons[$i]} ${options[$i]}")
    done

    printf "%s\n" "${options_with_icons[@]}" | \
        rofi -dmenu -i -p " $USER@$host" -mesg " Uptime: $uptime_info" \
        -kb-select-1 "l" \
        -kb-select-2 "u" \
        -kb-select-3 "e" \
        -kb-select-4 "r" \
        -kb-select-5 "s" \
        -kb-select-6 "h" | awk '{print $1}'
}

run_cmd() {
    case $1 in
        "")
            swaylock
            ;;
        "")
            systemctl suspend
            ;;
        "󰿅")
            swaymsg exit
            ;;
        "󱄌")
            systemctl reboot
            ;;
        "")
            systemctl poweroff
            ;;
        "󰒲")
            systemctl hibernate
            ;;
        *)
            echo "choose: $1"
            ;;
    esac
}

chosen_option=$(rofi_cmd)
run_cmd "$chosen_option"
