#!/bin/bash

# Define certificate URLs and target filenames
declare -A certs=(
    ["LunguStefanRootCa"]="https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/LunguStefanRootCa.pem"
    ["LunguStefan-DV-CA"]="https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/LunguStefan-DV-CA.pem"
)

# Download and rename PEMs to CRTs
for name in "${!certs[@]}"; do
    url="${certs[$name]}"
    dest="/usr/local/share/ca-certificates/$name.crt"
    curl -s -o "$dest" "$url"
    echo "$name.pem downloaded to $dest"
done

# Update CA certificates
update-ca-certificates

echo "All certificates have been added to the trusted certificate store."
