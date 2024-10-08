#!/bin/bash

. ./variables.sh
. ./raquette.sh
. ./utils.sh

raquette_position_x=5
raquette_position_y=9
raquette_longeur=4

#juste pour test déplacement raquette (temporaire)
clear
echo "##############"
for i in {1..10}; do
  echo "#            #"
done
echo "##############"

afficher_raquette

while true; do
    key=$(get_key)

    case $key in
        left)
            if [ $raquette_position_x -gt 1 ]; then
                raquette_position_x=$((raquette_position_x - 1))
            fi
            ;;
        right)
            if [ $((raquette_position_x + raquette_longeur)) -lt 12 ]; then
                raquette_position_x=$((raquette_position_x + 1))
            fi
            ;;
    esac

    clear
    echo "##############"
    for i in {1..10}; do
      echo "#            #"
    done
    echo "##############"
    
    afficher_raquette

    sleep 0.1
done
