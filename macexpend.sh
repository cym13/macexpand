#!/bin/sh

if [ $# -ne 2 ] ; then
    echo "Usage: macexpend LINENUM FILE"
    exit 1
fi

linenum="$1"
file="$2"

cat "$file" | cpp - | grep -B1 -A1 -a "^# $linenum \"<stdin>\"" | grep -v "^#"
