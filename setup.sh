#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " DevOps Project 1 - Linux Server Setup"
echo "=========================================="

echo
echo "[1/10] Updating Ubuntu package index..."
sudo apt update

echo
echo "[2/10] Upgrading installed packages..."
sudo apt upgrade -y

echo
echo "[3/10] Installing Git..."
sudo apt install git -y

echo
echo "[4/10] Installing Java 17..."
sudo apt install openjdk-17-jdk -y

echo
echo "[5/10] Installing Maven..."
sudo apt install maven -y

echo
echo "[6/10] Installing Docker prerequisites..."
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg -y

echo
echo "[7/10] Adding Docker official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor --yes -o /usr/share/keyrings/docker.gpg

echo
echo "[8/10] Adding Docker official repository..."
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

echo
echo "[9/10] Installing Docker Engine..."
sudo apt install docker-ce docker-ce-cli containerd.io -y

echo
echo "[10/10] Starting and enabling Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo
echo "Adding current user to the docker group..."
sudo usermod -aG docker "$USER"

echo
echo "=========================================="
echo " Installation Verification"
echo "=========================================="

echo
echo "Git:"
git --version

echo
echo "Java:"
java --version

echo
echo "Maven:"
mvn --version

echo
echo "Docker:"
docker --version

echo
echo "Docker service:"
sudo systemctl is-active docker

echo
echo "Testing Docker with sudo..."
sudo docker run --rm hello-world

echo
echo "=========================================="
echo " Setup Completed Successfully"
echo "=========================================="
echo
echo "Your user was added to the docker group."
echo "To use Docker without sudo, log out and log back in,"
echo "or run:"
echo
echo "    newgrp docker"
echo
echo "Then test:"
echo
echo "    docker run hello-world"
