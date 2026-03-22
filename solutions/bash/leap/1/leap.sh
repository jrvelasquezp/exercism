#!/usr/bin/env bash

main () {
    year="${1-}"
    if [[ "$#" != 1 || "$year" =~ ^-?[0-9]+\.[0-9]+$ || "$year" =~ ^[a-zA-Z]+$ ]]; then
        echo "Usage: leap.sh <year>"
        exit 1
    fi
    leap=$(($year%4 == 0 && $((year%400==0 || year%100!=0))))
    if [ $leap -eq 1 ]; then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"