#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: [RAJVEER THAKUR] |
 Roll No: [24MIM10115]
# Course: Open Source Software | VIT Bhopal
# Description: Checks if Python is installed, prints version
#              and license info, and gives a philosophy note
#              using a case statement.
# =============================================================

# --- Define the package name we want to inspect ---
PACKAGE="python3"    # The main Python 3 package name on Debian/Ubuntu

echo "============================================================"
echo "          FOSS PACKAGE INSPECTOR — Python Edition"
echo "============================================================"

# --- Check if the package is installed using dpkg ---
# dpkg -l lists installed packages; we grep for our package name
# &>/dev/null sends all output (stdout + stderr) to null so nothing prints here
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo " Status  : $PACKAGE is INSTALLED on this system."
    echo ""

    # --- Get detailed package info using dpkg -s ---
    echo " --- Package Details ---"
    dpkg -s "$PACKAGE" | grep -E 'Version|Maintainer|Homepage'  # Show key details only

    echo ""
    echo " --- Python Binary Location ---"
    which python3     # Shows where the python3 binary lives (e.g. /usr/bin/python3)

    echo ""
    echo " --- Python Version (direct check) ---"
    python3 --version  # Ask Python itself what version it is

else
    # Package is not installed — give instructions to install it
    echo " Status  : $PACKAGE is NOT installed on this system."
    echo " To install Python on Ubuntu/Debian, run:"
    echo "   sudo apt update && sudo apt install python3"
fi

echo ""
echo "------------------------------------------------------------"

# --- Philosophy note using a case statement ---
# The case statement checks the value of $PACKAGE and prints
# a matching philosophical note about that open-source software.
echo " --- Open Source Philosophy Note ---"

case $PACKAGE in
    python3 | python)
        # Note for Python — our main software choice
        echo " Python: Born from a community, governed by a community."
        echo " Guido van Rossum wrote Python to be readable by humans,"
        echo " not just machines. The PSF license ensures it stays free forever."
        ;;
    httpd | apache2)
        # Note for Apache web server
        echo " Apache: The web server that built the open internet."
        echo " It proved that collaborative open development could outperform"
        echo " any single company's proprietary product."
        ;;
    mysql | mariadb)
        # Note for MySQL/MariaDB database
        echo " MySQL: Open source at the heart of millions of applications."
        echo " Its dual license model sparked important debates about"
        echo " commercial exploitation of open-source work."
        ;;
    git)
        # Note for Git version control
        echo " Git: Built by Linus Torvalds in 10 days when a proprietary"
        echo " tool failed him. A reminder that freedom is also about not"
        echo " being locked into someone else's decisions."
        ;;
    firefox)
        # Note for Firefox browser
        echo " Firefox: A nonprofit fighting to keep the web open."
        echo " It exists because someone believed the internet"
        echo " should not be controlled by a single corporation."
        ;;
    vlc)
        # Note for VLC media player
        echo " VLC: Built by students who just wanted to watch movies"
        echo " on their university network. Now it plays everything, everywhere."
        ;;
    *)
        # Default case — for any other package not listed above
        echo " $PACKAGE: Every open-source tool represents a choice —"
        echo " the choice to share knowledge rather than lock it away."
        ;;
esac

echo "============================================================"
