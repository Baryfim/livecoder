#!/bin/bash

file=$1
delay=$2

if [ ! -f "$file" ]; then
    echo "File '$file' not found!"
    exit 1
fi

if [ -z "$delay" ]; then
    echo "No delay is indicated!"
    exit 1
fi

while IFS= read -r line; do
    for (( i=0; i<${#line}; i++ )); do
        echo -n "${line:$i:1}"
        sleep "$delay"
    done
    echo ""
done < "$file"
