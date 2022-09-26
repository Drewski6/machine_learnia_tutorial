#!/bin/sh

dest_path=".";

while getopts d:f: flag
do
    case "${flag}" in
        f) filename=${OPTARG};;
        d) dest_path=${OPTARG};;
    esac
done

echo "Filename: $filename";
# jupyter nbconvert --to markdown $filename;
filename="${filename%.*}"
echo "Filename: $filename";
mv ${filename}.md dest_path;