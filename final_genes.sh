#!/bin/bash

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --grp-dir) grp_dir="$2"; shift ;;
        --output) output_file="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Check if the grp directory and output file are provided
if [[ -z "$grp_dir" || -z "$output_file" ]]; then
    echo "Usage: sh script.sh --grp-dir [directory storing GRP files] --output [path to output file]"
    exit 1
fi

# Create the output file if it doesn't exist, or clear it if it does
> "$output_file"

# Iterate over each .grp file in the directory
for file in "$grp_dir"/*.grp; do
    # Check if the file exists
    if [[ -f "$file" ]]; then
        # Extract the gene symbols, skipping the first two lines
        tail -n +3 "$file" >> "$output_file"
    fi
done

echo "All gene symbols have been appended to $output_file"
