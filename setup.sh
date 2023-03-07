#!/bin/bash

# Update package list and upgrade packages
sudo apt-get update
sudo apt-get upgrade

# Install Python, Git, Snort, and UFW
sudo apt-get install -y python snort ufw
pip install pyautogui keyboard