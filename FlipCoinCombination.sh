#!/bin/bash -x

read -p "Enter the number of Trials : " T

fun(){
   number=$1
   if (( $number == 0 ))
   then
       value=H
   else
       value=T
   fi
   echo $value
}
value="$( fun $((RANDOM%2)) )"
echo Output of singleToss time flip one coin $value

declare -A doubletToss

for (( i=0; i<$T; i++ ))
do
  value1="$( fun $((RANDOM%2)) )"
  value2="$( fun $((RANDOM%2)) )"
  doubletToss[$value1$value2]=$((${doubletToss[$value1$value2]}+1))
done
echo Doublet combination ${!doubletToss[@]}
echo Doublet count ${doubletToss[@]}
for key in "${!doubletToss[@]}";
do
  prcntg=`expr "scale=2;${doubletToss[$key]}*100/$T" | bc`
  echo prcntg of $key $prcntg
done
