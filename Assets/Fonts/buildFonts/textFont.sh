#!/bin/bash

#Syntax:
#https://github.com/vladimirgamalyan/fontbm

#Codetable:
#https://www.utf8-chartable.de/unicode-utf8-table.pl?utf8=dec

PWD="$(dirname $(realpath $0))"
font="$PWD/../Roboto/Roboto-Medium.ttf"

if [ "$1" = "s" ] || [ "$1" = "small" ]; then
    size=30
    output="$PWD/../../../BlindDateWatch/resources-rectangle-240x240/fonts/Roboto_Text"
    codepoints="32,37,45-46,48-57,75"
else
    size=46
    output="$PWD/../../../BlindDateWatch/resources-rectangle-320x360/fonts/Roboto_Text"
    codepoints="32,37,45-46,48-57,75,84,100"
fi

echo "Ermittle passende Größe..."
read width height <<<"$(python3 $PWD/checkSize.py \"$font\" $size 250 \"$codepoints\")"
params=("--font-file=\"$font\""
    "--output=\"$output\""
    "--font-size=$size"
    "--chars=\"$codepoints\""
    "--texture-size=${width}x${height}"
    "--texture-crop-width"
    "--texture-crop-height"
    "--color=255,255,255"
    "--background-color=0,0,0"
    "--data-format=txt"
    "--kerning-pairs=regular"
    "--padding-up=0"
    "--padding-right=0"
    "--padding-down=0"
    "--padding-left=0"
    "--extra-info"
    "--texture-name-suffix=index"
    "--max-texture-count 1"
)

eval "/mnt/zusatz/Coding/Tools/FontBM/fontbm ${params[@]}"

optipng -o10 "${output}_0.png"
