#!/bin/bash

#Syntax:
#https://github.com/vladimirgamalyan/fontbm

#Codetable:
#https://www.utf8-chartable.de/unicode-utf8-table.pl?utf8=dec

PWD="$(dirname $(realpath $0))"

font="$PWD/../Roboto/Roboto-Bold.ttf"
if [ "$1" = "s" ] || [ "$1" = "small" ]; then
    size=40
    output="$PWD/../../../SteffenWatch/resources-rectangle-240x240/fonts/Roboto_Date"
else
    size=56
    output="$PWD/../../../SteffenWatch/resources-rectangle-320x360/fonts/Roboto_Date"
fi

codepoints="45-57"

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

eval "~/MyStuff/Coding/Tools/FontBM/fontbm ${params[@]}"

optipng -o8 "${output}_0.png"
