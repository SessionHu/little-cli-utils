#!/bin/sh
f=`mktemp --suffix=.png`
grim $f
$(command -v gwenview ||command -v eom) $f
rm $f
