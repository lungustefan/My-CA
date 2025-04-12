#!/bin/bash
curl -o /usr/local/share/ca-certificates/LunguStefanRootCa.crt https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/LunguStefanRootCa.pem
update-ca-certificates
echo "LunguStefanRootCa.pem has been added to the trusted certificate store."
