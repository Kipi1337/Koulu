#!/bin/bash

arg1=$1
arg2=$2

S=$(( $arg1 + $arg2 ))
echo "$arg1 + $arg2 = $S"

M=$(( $arg1 - $arg2 ))
echo "$arg1 - $arg2 = $M"

K=$(( $arg1 * $arg2 ))
echo "$arg1 * $arg2 = $K"