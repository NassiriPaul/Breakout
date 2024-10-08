#!/bin/bash

deplacer_raquette() {
    effacer_raquette
    afficher_raquette
}

effacer_raquette() {
    ecrire $raquette_position_y $raquette_position_x "    "
}

afficher_raquette() {
    local raquette=""
    for ((i=0; i<raquette_longeur; i++)); do
        raquette="${raquette}${symbole_raquette}"
    done
    ecrire $raquette_position_y $raquette_position_x "$raquette"
}
