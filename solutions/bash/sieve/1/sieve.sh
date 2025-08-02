#!/usr/bin/env bash

if [ $1 -lt 2 ]; then
    echo
elif [ $1 -eq 2 ]; then
    echo $1
else
    numbers[0]=2
    sieve=()
    n_size=1

    #generate numbers
    for ((i=3;i<=$1;i++));do
        numbers[$n_size]=$i
        n_size=$((n_size+=1))
    done

    #generate sieve
    for((i=0;i<$n_size;i++));do
        sieve=()
        sieve_size=0
        denominator=${numbers[$i]}
        for((j=0;j<$n_size;j++)); do
            numerator=${numbers[$j]}
            if [[ $numerator -le $denominator ]]; then
                sieve[$sieve_size]=${numbers[$j]}
                sieve_size=$((sieve_size+=1))
            elif [[ $((numerator%denominator)) -ne 0 ]] && [ $numerator -gt $denominator ]; then
                sieve[$sieve_size]=${numbers[$j]}
                sieve_size=$((sieve_size+=1))
            fi
        done
        numbers=()
        numbers=("${sieve[@]}")
        n_size=$sieve_size
    done
    echo "${sieve[*]}"
fi
