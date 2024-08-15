#!/bin/bash

# Author: Daniel Guevara
# dgdiaz011202@gmail.com
# June 23rd, 2024

# Use this script to merge all GSEA result data.

# ------------- #
# Define routes #
# ------------- #

main_dir=/path_to_home_directory
output_dir=$main_dir/C2_CGP    
final_output_file=$output_dir/C2_CGP_all.tsv

# Check if the output directory exists and contains .tsv files
if [ ! -d "$output_dir" ] || [ -z "$(ls -A "$output_dir"/*.tsv 2>/dev/null)" ]; then
        echo "Error: Output directory is empty or does not contain any .tsv files."
        exit 1
fi

# Initialize the final output file
first_merge=true

# Loop through each .tsv file in the output directory
for file in "$output_dir"/*_merged.tsv; do
        # Extract the comparison name from the filename using parameter expansion
        filename=$(basename "$file")
        comparison="${filename#C2_CGP_}"
        comparison="${comparison%_merged.tsv}"

        # Merge the files
        if [ "$first_merge" = true ]; then
                # Add the comparison column header and data for the first file
                awk -v comparison="$comparison" 'BEGIN {OFS="\t"} NR==1 {print $0, "Comparison"} NR>1 {print $0, comparison}' "$file" > "$final_output_file"
                first_merge=false
        else
                # Append data without header and add the comparison column
                awk -v comparison="$comparison" 'BEGIN {OFS="\t"} NR>1 {print $0, comparison}' "$file" >> "$final_output_file"
        fi
done

echo "Merged all files into $final_output_file"
