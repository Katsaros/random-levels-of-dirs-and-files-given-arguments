#!/bin/bash

#$1=dir_name $2=num_of_files $3=num_of_dirs $4=levels
re='^[0-9]+$'
flag=0;

#tsekarw an do8ikan swsta ta inputs
if [[ $# > 4 ]] ; then
	flag=2;
	echo "[ERROR] [You gave more than 4 parameters]";
	echo "[USAGE] [dir_name num_of_files num_of_dirs levels]";
fi

if [[ $# < 4 ]] ; then
	flag=2;
	echo "[ERROR] [You gave less than 4 parameters]";
	echo "[USAGE] [dir_name num_of_files num_of_dirs levels]";
fi

if [[ $flag = 2 ]] ; then
	echo "[Program exit]"
	exit 2
fi

if [[ $1 =~ $re ]] ; then
	flag=1;
	echo "[ERROR] [$1 is not a string]";
fi

if ! [[ $2 =~ $re ]] ; then
	flag=1;
	echo "[ERROR] [$2 is not a number]";
fi

if ! [[ $3 =~ $re ]] ; then
	flag=1;	
	echo "[ERROR] [$3 is not a number]";
fi

if ! [[ $4 =~ $re ]] ; then
	flag=1;	
	echo "[ERROR] [$4 is not a number]";
fi

if [[ $flag = 1 ]] ; then
	echo "[Program exit]"
	exit 1
fi

if [[ $flag = 0 ]] ; then
	echo "[SUCCESS][Program Started]"
	echo "[NOTE] [Inputs: $1 | $2 | $3 | $4]"
	echo " "
fi

#tsekarw an iparxei directory
if [[ ! -e $1 ]]; then
    mkdir $1
	echo "[SUCCESS][Directory $1 created]";
elif [[ -e $1 ]]; then
	echo "[NOTE] [$1 already exists]";
fi

echo " "

#mpainoume ston dir_name fakelo
cd $1

#ftiaxnoyume ola ta directories
n=1;
dircounter=0;
maxdirectories=$3;
maxlevels=$4;
random_directory_name=$1;
while [ "$n" -le "$maxdirectories" ]; do
	random_length=$((1 + RANDOM % 8))
	#echo "[NOTE] [Inside: $random_directory_name/]"
	random_directory_name=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w $random_length | head -n 1)
	mkdir "$random_directory_name"
 	echo "[SUCCESS] [Directory $random_directory_name created]";
 	cd $random_directory_name
	dircounter=$((dircounter + 1))
	n=`expr "$n" + 1`;
	#molis ftasoume sto max level tote pame pros ta pisw
	if [[ $dircounter = $maxlevels ]] ; then
		dircounter=0;
		for (( i = 0; i < maxlevels; i++ ));
	    #for getout in `seq 1 $maxlevels`;
	    do
			cd ..
		done
	fi
done

#vgainw oso exei meinei 
for (( i = 0; i <= dircounter; i++ ));
do
	cd ..
done

echo " "
#va8os tou start directory
va8osbegin=$(pwd | awk -F"/" '{print NF-1}')

#mpainoume ston dir_name fakelo
loop=0;
maxfiles=$2;
random_directory_name=$1;
while [ "$loop" -le "$maxfiles" ]; 
do
	for d in $(find $1 -maxdepth $maxlevels -type d)
	do
		if [[ $loop -eq $maxfiles ]]; then
			break;
		fi
	  	cd $d
		va8os=$(pwd | awk -F"/" '{print NF-1}')
		va8os=$((va8os - va8osbegin))
		##### gemisma me random arxeia xekinaei ####
		random_length_file_name=$((1 + RANDOM % 8))
		random_file_name=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w $random_length_file_name | head -n 1)
		random_size_file=$((1 + RANDOM % 128))
		head /dev/urandom | tr -dc A-Za-z0-9 | head -c 5K | cat > temp_urandom_file
		#edw mesw tou of ftiaxnoume to arxeio 
		dd if=temp_urandom_file of=$random_file_name bs=$random_size_file count=1 status=none #den emfanizw ta records in kai out
 		
 		echo "[SUCCESS] [File $random_file_name created in $d]";

		rm temp_urandom_file
		##### gemisma me random arxeia teleiwnei ####
		loop=$((loop + 1))
        if [ $va8os -gt 1 ]; then
        	for (( i = 0; i < va8os; i++ ));
		    do
				cd ..
			done
        elif [ $va8os -eq 1 ]; then
        	for (( i = 0; i < va8os; i++ ));
		    do
				cd ..
			done
        elif [ $va8os -lt 1 ]; then
				cd ..
        fi
	done
	if [[ $loop -eq $maxfiles ]]; then
		break;
	fi	
done
