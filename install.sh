#!/usr/bin/env bash

parse() {
  local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
  sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
      -e "s|^\($s\)\($w\)$s[:-]$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
  awk -F"$fs" '{
    if (length($3) > 0) {
      if ($2 == "cmd") {
        command=$3;
      } else {
        printf("%s %s;", command, $3)
      }
    }
  }'
}

exec() {
  echo -e "\033[1;32m$1\033[0;39m"
  eval $1
}

list=$(parse install.yml)

option=$1

IFS=";"

for cmd in $list;
do
  name=$(echo $cmd | cut -d' ' -f1)
  if [ "$option" = $name ]; then
    exec $cmd
  fi
  if [ "$option" = "" ]; then
    exec $cmd
  fi
done
