#!/bin/bash
set -e

apt update -y
apt upgrade -y

# Install essentials
apt install -y curl git build-essential

# Install Node LTS
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs

# Install PM2
npm install -g pm2

