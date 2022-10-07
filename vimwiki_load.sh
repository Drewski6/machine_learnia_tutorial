#!/bin/sh
# This script uses another script that is located in /home/drew/.myscripts
# that takes the ipynb file and converts it to a md file.
# This script fills in the file name, destination path, and index file name automatically.
# Just pass a number to indicate the video number.

number=""

while getopts n: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
    esac
done

if [ "${number}" = "" ]
then
    echo "Incorrect usage: vimwiki_load.sh -n [video number]"
    exit 1
else
    add_to_vimwiki.sh -f ${number}_*.ipynb -d ~/Documents/vimwiki/Python3/machine_learnia_ml_tutorial -i "machine_learnia_ml_tutorial.md"
fi

