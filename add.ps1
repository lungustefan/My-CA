# Define the certificate URLs
$certUrls = @(
    "https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/LunguStefanRootCa.pem",
    "https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/LunguStefan-DV-CA.pem"
)

# Loop through each certificate URL
foreach ($url in $certUrls) {
    # Get the file name from the URL
    $fileName = Split-Path -Path $url -Leaf
    $certPath = "$env:USERPROFILE\$fileName"

    # Download the certificate
    Invoke-WebRequest -Uri $url -OutFile $certPath

    # Import and add the certificate to the Trusted Root Certification Authorities store
    $cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
    $cert.Import($certPath)
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store("Root", "LocalMachine")
    $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
    $store.Add($cert)
    $store.Close()

    # Delete the downloaded certificate file
    Remove-Item $certPath

    # Output confirmation
    Write-Host "$fileName has been added to the trusted certificate store.`n"
}
