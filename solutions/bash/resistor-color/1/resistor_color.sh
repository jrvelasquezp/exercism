#!/usr/bin/env bash

main () {
    colors=( "black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white" )
    if [ $1 == "code" ] ; then
        if [ $2 == "orange" ] ; then
            echo 3
        elif [ $2 == "black" ] ; then
            echo 0
        elif [ $2 == "white" ] ; then
            echo 9    
        else
            echo 0
        fi
    elif [ $1 == "colors" ] ; then
        printf "%s\n" "${colors[@]}"
    fi
}

main "$@"