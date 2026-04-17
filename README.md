# Cloudflare WARP Automation

This script automates the installation, registration, and connection of the Cloudflare WARP client on Debian-based systems.

## Features
- Updates system packages.
- Adds Cloudflare's GPG key and repository.
- Installs `cloudflare-warp`.
- Automatically accepts Terms of Service for registration and connection.
- Verifies connection status at the end.

## Usage
1. Download the script directly to your Linux machine:
   ```bash
   wget https://github.com/fahadmieaji/asl_cloudflare_warp/raw/refs/heads/main/automate_warp.sh
   ```
2. Make it executable:
   ```bash
   chmod +x automate_warp.sh
   ```
3. Run the script with sudo:
   ```bash
   sudo ./automate_warp.sh
   ```

## Supported Systems
- Debian (specifically Bullseye as per repository configuration).
- Ubuntu (may require updating the repo string in the script to match your version).

## Useful Commands
- Check status: `warp-cli status`
- Disconnect: `warp-cli disconnect`
- Connect: `warp-cli connect`
