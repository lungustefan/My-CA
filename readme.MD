# LunguStefan CA Trust Script

This script adds the **LunguStefanRootCa.pem** certificate to the trusted certificate store on both **Windows** and **Linux** systems. It ensures that the certificate is downloaded and trusted by the system, allowing applications to interact with services that rely on this root certificate.

## Features
- **Windows 10/11 Support**: Downloads and adds the certificate to the trusted root certificate store.
- **Linux Support**: Downloads and adds the certificate to the system's trusted certificate store.
- **Coming Soon**: Support for additional platforms.

## Installation

### Windows 10/11

To add the **LunguStefanRootCa.pem** certificate to the trusted certificate store on Windows 10/11, follow these steps:

1. Press **Win + R** to open the **Run** dialog.
2. Enter the following command and press **Enter**:

    ```bash
    powershell.exe -Command "Invoke-Expression (iwr https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/add.ps1 -UseBasicP)"
    ```

   - **`iwr`**: Downloads the script from the provided GitHub URL.
   - **`Invoke-Expression`**: Executes the downloaded script.
   - **`powershell.exe`**: Launches PowerShell directly from the Run dialog.

3. The script will add the certificate to the **Trusted Root Certification Authorities** store, and you'll receive a confirmation message.

---

### Linux

For Linux systems, use the following command to download and add the **LunguStefanRootCa.pem** certificate to the trusted certificate store:

1. Open a terminal window.
2. Run the following command:

    ```bash
    sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/lungustefan/My-CA/refs/heads/main/add.sh)"
    ```

   - **`curl`**: Downloads the certificate from the provided GitHub URL.
   - **`bash -c`**: Executes the downloaded script with superuser privileges.

3. The script will add the certificate to the **trusted certificate store**, and you'll receive a confirmation message.

---

## Verification

### Windows
Once the script has finished running, the system should trust the LunguStefanRootCa certificate. To verify:
1. Open the **Certificate Manager** by running `certmgr.msc`.
2. Check the **Trusted Root Certification Authorities** store for the certificate.

### Linux
After running the script, the certificate will be in your system's trusted certificate store. You can verify it by running
```bash
curl https://dns.lungustefan.ro/ 
```
