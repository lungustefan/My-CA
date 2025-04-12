# Define the URL of the certificate
$certUrl = "https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/LunguStefanRootCa.pem"

# Define the path to save the certificate
$certPath = "$env:USERPROFILE\LunguStefanRootCa.pem"

# Download the certificate
Invoke-WebRequest -Uri $certUrl -OutFile $certPath

# Import the certificate to the Trusted Root Certification Authorities store
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$cert.Import($certPath)
$store = New-Object System.Security.Cryptography.X509Certificates.X509Store("Root", "LocalMachine")
$store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
$store.Add($cert)
$store.Close()

# Delete the certificate file after importing
Remove-Item $certPath

# Output confirmation
Write-Host "LunguStefanRootCa.pem has been added to the trusted certificate store."
