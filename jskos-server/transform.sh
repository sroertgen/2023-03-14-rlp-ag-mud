#! /bin/bash
ttl=$(find ../rlp-nw-kmk-mappings -type f -name '*.ttl')
echo $ttl
for c in $ttl ; do
  echo "Found file: $c"
  base=$(basename "$c")
  filename="${base%.*}"
  skos2jskos --name $filename -d data/imports $c
done
