#!/bin/bash

# Checking to verify user has submitted an argument, if now we output an example of proper use.
if [ "$1" == "" ]
then
echo "You forgot an IP address!"
echo "Syntax: ./ipsweep.sh 192.168.1.0/24"
exit
fi

#I am saving values of octets 1-3, to rebuild once we've determined ip subnet class.
ip=$1
oct1=$(echo $ip | cut -d . -f 1)
oct2=$(echo $ip | cut -d . -f 2)
oct3=$(echo $ip | cut -d . -f 3)

#Get class value
class=$(echo $1"/" | cut -d / -f 2)


if [ $class == 24 ]; then
echo "Class C Calculations"
for ip4 in `seq 1 254`; do
ping -c 1 $oct1.$oct2.$oct3.$ip4 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
exit
fi
elif [ $class == 16 ]; then
echo "Class B Calculations"
elif [ $class == 8 ]; then
echo "Class A Calculations"
else
echo "Please use classfull subnets only"
fi

# for ip in `seq 1 254`; do
#ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
#done
#fi