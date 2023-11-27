#!/bin/bash


#Using katana to crawl and extract only the js files.
#Using the gau and extracting the js files using grep

function extractJs {
    cat $1 | katana -js-crawl -rl 150 | grep ".js" > "$(pwd)/$1jsfiles"

    for line in $(cat "$1"); do
        echo "$line" | gau | grep ".js" >> "$(pwd)/$1jsfiles"
    done < "$1"

    sort "$(pwd)/$1jsfiles" > "$(pwd)/$1jsfilestemp"
    mv "$(pwd)/$1jsfilestemp" "$(pwd)/$1jsfiles"
}


if [ -e "$1" ]; then
    extractJs "$1"
else
    echo "Usage: $0 <subdomains txt file>"
fi
