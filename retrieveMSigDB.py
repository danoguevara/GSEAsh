import os
import requests
import csv
import argparse

# Define the base URL for downloading gene set .grp files
base_url = "https://www.gsea-msigdb.org/gsea/msigdb/human/download_geneset.jsp?geneSetName={}&fileType=grp"

# Function to read gene sets from a CSV file
def read_gene_sets_from_csv(file_path):
    gene_sets = []
    with open(file_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            gene_sets.append(row[1])  # Assuming each gene set is in the first column
    return gene_sets

# Function to download and save a gene set .grp file
def download_gene_set(gene_set_name, output_directory):
    url = base_url.format(gene_set_name)
    response = requests.get(url)
    if response.status_code == 200:
        file_path = os.path.join(output_directory, f"{gene_set_name}.grp")
        with open(file_path, 'wb') as file:
            file.write(response.content)
        print(f"Downloaded: {gene_set_name}")
    else:
        print(f"Failed to download: {gene_set_name} - Status code: {response.status_code}")

# Main execution
if __name__ == "__main__":
    # Set up command-line argument parsing
    parser = argparse.ArgumentParser(description="Download gene sets from MSigDB")
    parser.add_argument('--file', required=True, help="Path to the CSV file containing gene set names")
    parser.add_argument('--output-dir', required=True, help="Directory to save the downloaded .grp files")

    args = parser.parse_args()

    # Read gene sets from the provided CSV file
    gene_sets = read_gene_sets_from_csv(args.file)

    # Ensure the output directory exists
    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    # Download each gene set
    for gene_set in gene_sets:
        download_gene_set(gene_set, args.output_dir)

    print("All gene sets have been downloaded.")
