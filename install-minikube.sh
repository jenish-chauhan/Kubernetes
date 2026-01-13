#!/bin/bash
set -e

echo "=============================="
echo "Minikube Installation Script"
echo "=============================="

# Update system
echo "[1/6] Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install required packages
echo "[2/6] Installing required dependencies..."
sudo apt install -y \
  curl \
  wget \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release \
  conntrack \
  socat

# Install Docker
echo "[3/6] Installing Docker..."
if ! command -v docker &> /dev/null; then
  curl -fsSL https://get.docker.com | sudo bash
  sudo usermod -aG docker $USER
  sudo systemctl enable docker
  sudo systemctl start docker
else
  echo "Docker already installed"
fi

# Install kubectl
echo "[4/6] Installing kubectl..."
if ! command -v kubectl &> /dev/null; then
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  rm kubectl
else
  echo "kubectl already installed"
fi

# Install Minikube
echo "[5/6] Installing Minikube..."
if ! command -v minikube &> /dev/null; then
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  rm minikube-linux-amd64
else
  echo "Minikube already installed"
fi

# Verify installations
echo "[6/6] Verifying installations..."
docker --version
kubectl version --client
minikube version

echo "=============================="
echo "Installation Completed"
echo "IMPORTANT:"
echo "1. Log out and log back in OR run: newgrp docker"
echo "2. Start Minikube using:"
echo "   minikube start --driver=docker"
echo "=============================="


#newgrp docker