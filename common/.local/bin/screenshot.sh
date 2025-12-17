#!/bin/sh
f=`mktemp --suffix=.png`
grim $f
eom $f
rm $f
