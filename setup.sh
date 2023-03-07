#!/bin/bash

# Update package list and upgrade packages
sudo apt-get update
sudo apt-get upgrade

# Install Python, Git, Snort, and UFW
sudo apt-get install -y python snort ufw masscan
pip install pyautogui keyboard

#Running wide MassScan
echo "Finding Competition IP's / Edron SaaS"
masscan "10.65.0.0/16"
echo "Adjacent to Cloud private"
masscan "172.16.32.254"
echo "Cloud private"
masscan "192.168.255.1"
echo "Office Workstations"
masscan "192.168.1.0/24"
echo "Office Servers"
masscan "192.168.100.0/24"