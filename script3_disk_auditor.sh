#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: [RAJVEER THAKUR ] | 
Roll No: [24MIM10115]
# Course: Open Source Software | VIT Bhopal
# Description: Loops through important system directories and
#              reports disk usage and permissions for each.
#              Also checks Python's config directory specifically.
# =============================================================

# --- List of standard Linux directories to audit ---
# These are important directories every Linux user should know
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib/python3")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "============================================================"
echo " Format: Directory => Permissions | Owner | Group | Size"
echo "------------------------------------------------------------"

# --- For loop: goes through each directory in the DIRS array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before trying to read it
    if [ -d "$DIR" ]; then

        # Extract permissions, owner, and group using ls -ld and awk
        # ls -ld gives: drwxr-xr-x 2 root root 4096 Jan 1 /etc
        # awk '{print $1}' gets column 1 (permissions like drwxr-xr-x)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')    # Permission string
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')    # Owner username
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')    # Group name

        # du -sh gives human-readable size (K, M, G)
        # 2>/dev/null suppresses "permission denied" errors
        # cut -f1 gets just the size number (first column)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print the result in a clean format
        echo " $DIR"
        echo "   Permissions : $PERMS"
        echo "   Owner/Group : $OWNER / $GROUP"
        echo "   Size        : $SIZE"
        echo ""

    else
        # Directory does not exist on this system
        echo " $DIR => Does NOT exist on this system"
        echo ""
    fi

done

echo "------------------------------------------------------------"

# --- Special section: Check Python's config and install directories ---
echo " --- Python-Specific Directory Check ---"
echo ""

# Python's standard directories on a Linux system
PYTHON_DIRS=("/usr/bin/python3" "/usr/lib/python3" "/etc/python3" "/usr/local/lib/python3.10" "/usr/local/lib/python3.11" "/usr/local/lib/python3.12")

for PYDIR in "${PYTHON_DIRS[@]}"; do

    # Check if it's a file (for /usr/bin/python3 which is a binary, not a dir)
    if [ -f "$PYDIR" ]; then
        PERMS=$(ls -l "$PYDIR" | awk '{print $1}')
        OWNER=$(ls -l "$PYDIR" | awk '{print $3}')
        echo " Found file : $PYDIR"
        echo "   Permissions : $PERMS | Owner: $OWNER"
        echo ""

    elif [ -d "$PYDIR" ]; then
        # It's a directory
        PERMS=$(ls -ld "$PYDIR" | awk '{print $1}')
        OWNER=$(ls -ld "$PYDIR" | awk '{print $3}')
        SIZE=$(du -sh "$PYDIR" 2>/dev/null | cut -f1)
        echo " Found dir  : $PYDIR"
        echo "   Permissions : $PERMS | Owner: $OWNER | Size: $SIZE"
        echo ""
    fi

done

# --- Show all Python versions installed on the system ---
echo "------------------------------------------------------------"
echo " All Python versions found on this system:"
ls /usr/bin/python* 2>/dev/null || echo " No Python binaries found in /usr/bin"

echo "============================================================"
