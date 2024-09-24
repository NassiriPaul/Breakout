#!/bin/bash

. ./utils.sh

lire_niveau () {
    nbr_walls=0
    while IFS= read -r line; do
        if [ "${line:0:1}" = 'w' ];
        then
            init_wall $line
        elif [ "${line:0:1}" = 'p' ];
        then
            init_player $line
        elif [ "${line:0:1}" = 'b' ];
        then
            init_bot $line
        fi
    done < $1;
}

init_wall () {
    nbr_walls=$((nbr_walls+1))

    readarray -d "," -t values <<< "$1"

    let "wall_${nbr_walls}_x=${values[1]}"
    let "wall_${nbr_walls}_y=${values[2]}"
    let "wall_${nbr_walls}_l=${values[3]}"
    let "wall_${nbr_walls}_L=${values[4]}"
}

init_player () {
    readarray -d "," -t values <<< "$1"
    let "raquette_position_x=${values[1]}"
    let "raquette_position_x_p=${values[1]}"
    let "raquette_position_y=${values[2]}"
    let "raquette_position_y_p=${values[2]}"
    let "raquette_longeur=${values[3]}"
}

init_bot () {
    readarray -d "," -t values <<< "$1"
    let "bot_position_x=${values[1]}"
    let "bot_position_x_p=${values[1]}"
    let "bot_position_y=${values[2]}"
    let "bot_position_y_p=${values[2]}"
    let "bot_longeur=${values[3]}"
}


afficher_niveau () {
    for ((idx_wall=1;idx_wall<$nbr_walls;idx_wall++)); do
        for ((line=wall_${idx_wall}_x ; line<wall_${idx_wall}_x+wall_${idx_wall}_l ; line++)); do
            for ((column=wall_${idx_wall}_y;column<wall_${idx_wall}_y+wall_${idx_wall}_L;column++)); do
                ecrire $column $line '#'
            done 
        done 
    done
}

lire_niveau "map.txt"
afficher_niveau