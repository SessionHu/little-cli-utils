#!/bin/sh

echo 'Getting location...'
loc=`termux-location`
lat=`echo $loc | jq .latitude`
lng=`echo $loc | jq .longitude`

echo 'Getting geographic data...'
curl 'https://app.bilibili.com/x/bplus/geo' \
  --url-query "lat=$lat" \
  --url-query "lng=$lng" \
  -s | jq .

