#!/usr/bin/env bash

function parse() {
  s='[[:space:]]*'
  w='[a-zA-Z0-9_]*'
  fs="$(echo @|tr @ '\034')"
  sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
      -e "s|^\($s\)\($w\)$s[:-]$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
  awk -F"$fs" '{
    if (length($3) > 0) {
      if ($2 == "cmd") {
        command=$3;
      } else {
        printf("%s %s\n", command, $3)
      }
    }
  }'
}

list=$(parse install.yml)

IFS=""
for cmd in $list; do
  echo $cmd
  eval $cmd
done
