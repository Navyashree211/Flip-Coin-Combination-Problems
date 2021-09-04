#!/bin/bash -x

coinflip=$((RANDOM%2))
IS_HEAD=1
if [ $coinflip -eq 1 ]
then
   echo HEAD
else
   echo TAIL
fi
