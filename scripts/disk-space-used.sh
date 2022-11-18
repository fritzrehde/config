#!/bin/sh

printf "%.f" "$(df | grep "/home" | awk '{ print $3/1000000 }')"
