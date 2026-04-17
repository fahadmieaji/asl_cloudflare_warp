#!/bin/bash

# Cloudflare WARP Automation Script
# This script automates the installation and connection of Cloudflare WARP.

set -e # Exit immediately if a command exits with a non-zero status.

echo "Starting Cloudflare WARP setup..."

# 1. Update and Upgrade System
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Add Cloudflare WARP GPG Key
echo "Adding Cloudflare WARP GPG key..."
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# 3. Add Cloudflare WARP Repository
# Note: Using 'bullseye' as per your manual commands.
echo "Adding Cloudflare WARP repository..."
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bullseye main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

# 4. Install Cloudflare WARP
echo "Installing cloudflare-warp..."
sudo apt update
sudo apt install cloudflare-warp -y

# 5. Register and Connect
# We use '|| true' for registration in case it's already registered to prevent script failure.
echo "Registering WARP client..."
sudo warp-cli --accept-tos registration new || echo "Already registered or registration skipped."

echo "Connecting to WARP..."
sudo warp-cli --accept-tos connect

# 6. Verify Status
echo "Checking WARP status..."
sleep 2 # Give it a moment to establish connection
warp-cli status

echo "------------------------------------------"
echo "Cloudflare WARP automation complete!"
echo "------------------------------------------"
