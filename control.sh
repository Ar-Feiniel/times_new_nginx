#!/bin/bash

#exec 0<data
#exec 1>out.log
#exec 2>logs/error.log

compose_file="docker-compose.yaml"
merge_file="docker-compose.limits.yaml"

root_folder=`pwd`

menu="
[1] up dev reverse 
[2] restart dev reverse
[3] down dev reverse
[4] ps dev reverse
"
input=""
while true
do
    echo "$menu"
    echo -n "Select function № on enter q to exit:\n"
    read input

    if [ $input = "q" ]
    then
        break;
    fi

    case "$input" in
    1) docker compose -f $compose_file -f $merge_file up -d;break ;;
    2) docker compose -f $compose_file -f $merge_file down && \
        docker compose -f $compose_file -f $merge_file up -d;break ;;
    3) docker compose -f $compose_file -f $merge_file down;break ;;
    4) docker compose -f $compose_file -f $merge_file ps;break ;;
    *) echo "key not found"
    esac
done

echo "end of the script"
