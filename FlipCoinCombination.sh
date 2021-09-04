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

declare -A singletToss

for (( i=0; i<$T; i++ ))
do
  value="$( fun $((RANDOM%2)) )"
  singletToss[$value]=$((${singletToss[$value]}+1))
done
echo Singlet combination ${!singletToss[@]}
echo Singlet count ${singletToss[@]}
for key in "${!singletToss[@]}";
do
  prcntg=`expr "scale=2;${singletToss[$key]}*100/$T" | bc`
  echo prcntg of $key $prcntg

done
