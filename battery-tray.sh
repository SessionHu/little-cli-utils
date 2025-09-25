#!/bin/sh
termux-api-start 1>&2
d=`termux-battery-status`
p=`echo "${d}" | jq .percentage`
if [ `echo "${d}" | jq .status` = '"CHARGING"' ]; then
  echo "${p}%[+]"
else
  echo "${p}%"
fi
