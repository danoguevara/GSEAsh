#!/bin/bash

# File paths to the two txt files
file1="path_to_file_1"
file2="path_to_file_2"

# Read the first file into an associative array
declare -A md5sums1
while read -r md5sum filename; do
  md5sums1["$filename"]="$md5sum"
done < "$file1"

# Read the second file and compare the md5sums
while read -r md5sum filename; do
  if [[ ${md5sums1["$filename"]} ]]; then
    if [[ ${md5sums1["$filename"]} == "$md5sum" ]]; then
      echo "MATCH: $filename"
    else
      echo "MISMATCH: $filename"
    fi
  else
    echo "NOT FOUND IN FILE 1: $filename"
  fi
done < "$file2"
