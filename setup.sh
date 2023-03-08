#!/bin/bash

# Update package list and upgrade packages
sudo apt-get update
sudo apt-get upgrade

# Install Python, Git, Snort, and UFW
sudo apt-get install -y python snort ufw masscan
pip install pyautogui keyboard

#Running wide MassScan
echo "Finding Competition IP's / Edron SaaS"
masscan "10.65.0.0/16 --ports 0-65535"
echo "Adjacent to Cloud private"
masscan "172.16.32.254 --ports 0-65535"
echo "Cloud private"
masscan "192.168.255.1 --ports 0-65535"
echo "Office Workstations"
masscan "192.168.1.0/24 --ports 0-65535"
echo "Office Servers"
masscan "192.168.100.0/24 --ports 0-65535"