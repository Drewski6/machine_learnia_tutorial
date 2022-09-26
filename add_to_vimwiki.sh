#!/bin/sh
# ./add_to_vimwiki.sh -f [.ipynb file] -d [destination folder] -i [name of index.md]
# This script will take a .ipynb file and convert it to markdown. Then move it into
# the folder you specify.
# Destination folder is optional. Default is current working directory.
# Name of index is the name of the .md file that acts as the index for the folder.

dest_path=".";
index="";

while getopts d:f:i: flag
do
    case "${flag}" in
        f) filename=${OPTARG};;
        d) dest_path=${OPTARG};;
        i) index=${OPTARG};;
    esac
done

echo "Filename: $filename";
jupyter nbconvert --to markdown $filename;
filename="${filename%.*}"
echo "Filename: $filename";
mv ${filename}.md $dest_path;
echo "[${filename}](${filename})" >> $dest_path/$index