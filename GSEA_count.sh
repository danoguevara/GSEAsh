#!/bin/bash

# Author: Daniel Guevara
# dgdiaz011202@gmail.com
# June 23rd, 2024

# Use this script to check that all the comparisons included the same amount of gene sets.

# ------------- #
# Define routes #
# ------------- #

working_dir=/path_to_working_directory
collections=('C1' 'C2' 'C3' 'C4' 'H')

echo "--------------------------------------------------------"
printf "%-15s %-20s %s\n" "Collection" "Comparison" "Number of Gene Sets"
echo "--------------------------------------------------------"

# Iterate over each subdirectory in the main directory
for dir in "${collections[@]}"; do
        for subdir in "$working_dir/$dir"/*/; do
                # Count the number of matching files
                num_files=$(find "$subdir" -name 'gsea_report_for*.tsv' | wc -l)

                # Count the total number of lines in all matching files within the subdirectory
                count=$(find "$subdir" -name 'gsea_report_for*.tsv' -exec cat {} + | wc -l)

                # Subtract the number of header lines (one per file)
                final_count=$((count - num_files))

                # Comparison name
                comp_name=$(basename "$subdir")
                comp_name=${comp_name#*"$dir"_}
                comp_name=${comp_name%.Gsea*}

                # Print the directory, comparison and the final count
                printf "%-15s %-20s %s\n" "$dir" "$comp_name" "$final_count"
        done
        echo ""
done
