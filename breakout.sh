#!/bin/bash

. ./menu.sh

while :
do
    menu
    
    if [ "$choix_menu" == 1 ]; then
        . ./jouer.sh
    elif [ "$choix_menu" == 2 ]; then
        echo "Affichage des instructions..."
    elif [ "$choix_menu" == 3 ]; then
        echo "Affichage des crédits..."
    elif [ "$choix_menu" == 4 ]; then
        echo "Quitter le jeu..."
        exit 0
    fi
done
