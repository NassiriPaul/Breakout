#!/bin/bash

get_key() {
    read -rsn1 key
    if [[ $key == $'\x1b' ]]; then
        read -rsn2 key
        case "$key" in
            "[A") echo "up";;
            "[B") echo "down";;
            "[D") echo "left";;
            "[C") echo "right";;
        esac
    fi
}

draw_menu() {
    clear
    case $current_selection in
        0)
            echo -e "\e[31mJouer\e[0m"
            echo "Instructions"
            echo "Crédits"
            echo "Quitter"
            ;;
        1)
            echo "Jouer"
            echo -e "\e[31mInstructions\e[0m"
            echo "Crédits"
            echo "Quitter"
            ;;
        2)
            echo "Jouer"
            echo "Instructions"
            echo -e "\e[31mCrédits\e[0m"
            echo "Quitter"
            ;;
        3)
            echo "Jouer"
            echo "Instructions"
            echo "Crédits"
            echo -e "\e[31mQuitter\e[0m"
            ;;
    esac
}

menu() {
    current_selection=0
    draw_menu

    while true; do
        key=$(get_key)

        case $key in
            up)
                ((current_selection--))
                if ((current_selection < 0)); then
                    current_selection=3
                fi
                ;;
            down)
                ((current_selection++))
                if ((current_selection > 3)); then
                    current_selection=0
                fi
                ;;
        esac

        draw_menu

        if [[ $key == "" ]]; then
            choix_menu=$((current_selection + 1))
            return $choix_menu
        fi
    done
}
