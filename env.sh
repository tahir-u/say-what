#!/bin/bash

rm -rf ./env-config.json
touch ./env-config.json

lines=$(wc -l < ./.env)
current=0

echo "{" >> ./env-config.json

while read -r line || [[ -n "$line" ]];
do
    current=$(($current + 1))
    if printf '%s\n' "$line" | grep -q -e '='; then
        var_name=$(printf '%s\n' "$line" | sed -e 's/=.*//')
        var_value=$(printf '%s\n' "$line" | sed -e 's/^[^=]*=//')
    fi

    value=$(printf '%s\n' "${!var_name}")
    [[ -z $value ]] && value=${var_value}

    if [[ $current -ne $lines ]]; then
        echo "  \"$var_name\": \"$value\"," >> ./env-config.json
    else
        echo "  \"$var_name\": \"$value\"" >> ./env-config.json
    fi

done < .env

echo "}" >> ./env-config.json
