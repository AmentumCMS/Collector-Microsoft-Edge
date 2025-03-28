#!/bin/bash

# URL to fetch the JSON data
json_url="https://edgeupdates.microsoft.com/api/products?view=enterprise"

# Fetch the JSON data
json_data=$(curl -s "$json_url")

# Extract the last three versions
versions=$(echo $json_data | jq -r '.[] | select(.Product == "Stable") | .Releases[] | select(.Platform=="Windows" and .Architecture=="x64") | .ProductVersion' | sort -r | uniq | head -n 1)

# Base URL for downloading Microsoft Edge
base_url="https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files"

# Function to download a specific version
download_edge_version() {
    version=$1
    url="${base_url}/${version}/MicrosoftEdgeSetup.exe"
    output="MicrosoftEdgeSetup_${version}.exe"
    curl -sSw "Downloading Microsoft Edge version $version: " -L -o "$output" "$url"
    if [ $? ]; then
	echo "Done!"
    else
	echo "Error"
	exit 1
    fi	
}

# Loop through the versions and download each one
for version in $versions; do
    download_edge_version "$version"
done

echo "All specified versions of Microsoft Edge have been downloaded successfully."
