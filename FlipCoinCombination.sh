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

declare -A trippletToss

for (( i=0; i<$T; i++ ))
do
  value1="$( fun $((RANDOM%2)) )"
  value2="$( fun $((RANDOM%2)) )"
  value3="$( fun $((RANDOM%2)) )"
  trippletToss[$value1$value2$value3]=$((${trippletToss[$value1$value2$value3]}+1))
done

echo Tripplet combination ${!trippletToss[@]}
echo Tripplet count ${trippletToss[@]}

for key in "${!trippletToss[@]}"
do
  prcntg=`expr "scale=2;${trippletToss[$key]}*100/$T" | bc`
  echo prcntg of $key $prcntg
done
