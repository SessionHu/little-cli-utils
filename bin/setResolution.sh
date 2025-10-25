#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <native | HxV>"
  exit
fi

if [ "$1" = "native" ]; then
  termux-x11-preference "displayResolutionMode:native"
else
  termux-x11-preference "displayResolutionCustom:$1"
  termux-x11-preference "displayResolutionMode:custom"
fi
