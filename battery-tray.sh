#!/bin/sh
termux-api-start 1>&2
d=`timeout 5s termux-battery-status`
[ -z "${d}" ] && exec echo '-%'
p=`echo "${d}" | jq .percentage`
if [ `echo "${d}" | jq .status` = '"CHARGING"' ]; then
  echo "${p}%[+]"
else
  echo "${p}%"
fi
