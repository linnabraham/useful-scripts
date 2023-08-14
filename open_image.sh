#!/bin/sh

if [ $# -ne 1 -o ! -f "$1" ]; then
    echo "usage: ${0##*/} FILE" >&2
    exit 1
fi

file -i "$(dirname "$1")"/* \
    | awk -F ': *' -v f="$1" '
        $2 ~ "^image" {
            files[cnt++] = $1;
            if ($1 == f)
                org_pos = cnt;
        }
        END {
                n = cnt - org_pos + 1; 
            for (i = cnt - 1 ; i >= 0; i--)
                print files[i] | "sxiv -i -n " n;
        }'
