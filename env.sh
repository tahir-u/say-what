#!/bin/bash

rm -rf ./env-config.js
touch ./env-config.js

echo "window._env_ = {" >> ./env-config.js

while read -r line || [[ -n "$line" ]];
do
    if printf '%s\n' "$line" | grep -q -e '='; then
        var_name=$(printf '%s\n' "$line" | sed -e 's/=.*//')
        var_value=$(printf '%s\n' "$line" | sed -e 's/^[^=]*=//')
    fi

    value=$(printf '%s\n' "${!var_name}")
    [[ -z $value ]] && value=${var_value}

    echo "  \"$var_name\": \"$value\"," >> ./env-config.js
done < .env

echo "};" >> ./env-config.js
