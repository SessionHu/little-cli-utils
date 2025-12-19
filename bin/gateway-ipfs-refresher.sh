#!/bin/bash
gateways=(
  'ipfs.io'
  #'dweb.link'
  'apac.orbitor.dev'
  #'eu.orbitor.dev'
  #'ipfs.orbitor.dev'
  #'latam.orbitor.dev'
  'dget.top'
  #'storry.tv'
  #'4everland.io'
  #'nftstorage.link'
  'ipfs.ecolatam.com'
  'w3s.link'
  'gateway.pinata.cloud'
  'trustless-gateway.link'
)
pids=()
for i in ${gateways[@]}; do
  wget "https://${i}/ipfs/${1}?format=car" \
    --timeout=120 --tries=1 \
    -O /dev/null \
    -U 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' &
  pids+=($!)
done
for i in ${pids[@]}; do
  printf "==> Waiting for: "
  ps --no-headers -p $i -o pid,cmd
  echo ''
  wait $i
done
