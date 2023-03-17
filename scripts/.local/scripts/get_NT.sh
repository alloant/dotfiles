#!/bin/bash

folder="$HOME/Documents/Projects/Doing/ToAdoc/NT"

get_title () {
    line=$(sed -n "/\^$2\^/{x;p;d}; x" $1)
    if [[ $line == .* ]]; then echo $line; fi
}

get_one_line() {
    n=$2
    ((n++))
    sed -n "/\^$2\^/, /\^$n\^/{ /\^$n\^/!p}" $1
}

get_lines() {
    sed -n "/\^$2\^/, /\^$3\^/p" $1
}

IFS='.'
read -ra narg <<< "$2"

ch=0

for inter in "${narg[@]}";
do
    IFS='-'
    read -ra ninter <<< "$inter"
    
    IFS=':'
    read -ra fch <<< "${ninter[0]}"

    if [[ "${#fch[@]}" == 2 ]]
    then 
        ch="${fch[0]}"
        fint="${fch[1]}"
    else
        fint=${fch[0]}
    fi

    get_title "$folder/Mt/0$ch.adoc" "$fint"
    
    read -ra sch <<< "${ninter[1]}"
    
    if [[ "${#sch[@]}" == 2 ]]
    then 
        if [[ $ch -le 10 ]]; then chfile="$folder/$1/0$ch.adoc"; else chfile="$folder/$1/$ch.adoc"; fi
        get_lines "$chfile" "$fint" "f"
        fint=1
        ch=${sch[0]}
        sint=${sch[1]}
    else
        sint=${sch[0]}
    fi
    
    echo "[quote,$1 $2]"
    echo "--"

    if [[ $ch -le 10 ]]; then chfile="$folder/$1/0$ch.adoc"; else chfile="$folder/$1/$ch.adoc"; fi
    
    if [[ "${#ninter[@]}" == 2 ]]; then get_lines "$chfile" "$fint" "$sint"; else get_one_line "$chfile" $fint; fi

    echo "--"
done
