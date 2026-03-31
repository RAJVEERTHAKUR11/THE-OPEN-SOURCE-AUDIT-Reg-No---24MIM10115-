#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: [RAJVEER THAKUR ] 
| Roll No: [24MIM10115]
# Course: Open Source Software | VIT Bhopal
# Description: Displays a welcome screen with system info
#              and license details for the chosen OSS project.
# =============================================================

# --- Student & Project Info ---
STUDENT_NAME="[RAJVEER THAKUR ]"           
ROLL_NUMBER="[24MIM10115]"     
SOFTWARE_CHOICE="Python"            

# --- Collect System Information using command substitution $() ---
KERNEL=$(uname -r)                   # Gets the Linux kernel version
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Gets distro name
USER_NAME=$(whoami)                  # Gets the currently logged-in user
HOME_DIR=$HOME                       # Gets the home directory of current user
UPTIME=$(uptime -p)                  # Gets how long the system has been running
CURRENT_DATE=$(date '+%d %B %Y')    # Gets current date in readable format
CURRENT_TIME=$(date '+%H:%M:%S')    # Gets current time

# --- Display the System Identity Report ---
echo "============================================================"
echo "       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "============================================================"
echo " Student  : $STUDENT_NAME"
echo " Roll No  : $ROLL_NUMBER"
echo " Software : $SOFTWARE_CHOICE"
echo "------------------------------------------------------------"
echo " Linux Distribution : $DISTRO"
echo " Kernel Version     : $KERNEL"
echo " Logged-in User     : $USER_NAME"
echo " Home Directory     : $HOME_DIR"
echo " System Uptime      : $UPTIME"
echo " Current Date       : $CURRENT_DATE"
echo " Current Time       : $CURRENT_TIME"
echo "------------------------------------------------------------"

# --- Python Version Info (shows if Python is installed) ---
# Check if python3 is available on the system
if command -v python3 &>/dev/null; then
    PYTHON_VERSION=$(python3 --version)   # Gets Python version
    echo " Python Installed   : $PYTHON_VERSION"
else
    echo " Python Installed   : Not found — install with: sudo apt install python3"
fi

echo "------------------------------------------------------------"

# --- License Information for Python ---
# Python is released under the PSF (Python Software Foundation) License
echo " Open-Source License covering Python:"
echo "   PSF License (Python Software Foundation License)"
echo "   This is a permissive license — similar to BSD."
echo "   You are free to use, modify, and distribute Python."
echo "   Even for commercial use — without sharing your changes."
echo "============================================================"
