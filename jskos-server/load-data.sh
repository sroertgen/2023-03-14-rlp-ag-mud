#! /bin/bash
concepts=($(find ./data/imports -type f -name '*.ndjson'))
schemes=($(find ./data/imports -type f -name '*.json'))

for c in "${schemes[@]}" 
do
  echo "Found scheme: ${c:1}"
  docker compose exec jskos-server /usr/src/app/bin/import.js -- schemes ${c:1}
done

for c in "${concepts[@]}"
do
  echo "Found concept $c"
  docker compose exec jskos-server /usr/src/app/bin/import.js -- concepts ${c:1}
done

docker compose exec jskos-server /usr/src/app/bin/import.js --indexes

