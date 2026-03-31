#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: [RAJVEER THAKUR ] | 
Roll No: [24MIM10115]
# Course: Open Source Software | VIT Bhopal
# Description: Reads a log file line by line, counts how many
#              lines contain a keyword, and shows the last 5
#              matching lines. Accepts file path and keyword
#              as command-line arguments.
# Usage: ./script4_log_analyzer.sh /var/log/syslog ERROR
# =============================================================

# --- Command-line arguments ---
# $1 is the first argument passed when running the script (log file path)
# $2 is the second argument (keyword to search); defaults to "error" if not given
LOGFILE=$1
KEYWORD=${2:-"error"}    # If no keyword given, use "error" as default

# --- Counter variable to track how many matching lines we find ---
COUNT=0

echo "============================================================"
echo "              LOG FILE ANALYZER"
echo "============================================================"

# --- Validate: check if user gave a filename at all ---
if [ -z "$LOGFILE" ]; then
    echo " ERROR: No log file specified."
    echo " Usage: ./script4_log_analyzer.sh <logfile> [keyword]"
    echo " Example: ./script4_log_analyzer.sh /var/log/syslog error"
    exit 1    # Exit the script with error code 1
fi

# --- Validate: check if the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo " ERROR: File '$LOGFILE' not found."
    echo ""

    # --- Retry suggestion: list available log files for the user ---
    echo " Available log files in /var/log:"
    ls /var/log/*.log 2>/dev/null | head -10    # Show up to 10 log files
    echo ""

    # If /var/log/syslog or /var/log/messages exists, suggest it
    if [ -f "/var/log/syslog" ]; then
        echo " Suggestion: Try running with /var/log/syslog"
        echo " ./script4_log_analyzer.sh /var/log/syslog $KEYWORD"
    elif [ -f "/var/log/messages" ]; then
        echo " Suggestion: Try running with /var/log/messages"
        echo " ./script4_log_analyzer.sh /var/log/messages $KEYWORD"
    fi

    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo " WARNING: The file '$LOGFILE' is empty."
    echo " Nothing to analyze."
    exit 0
fi

echo " Log File : $LOGFILE"
echo " Keyword  : $KEYWORD"
echo " Scanning..."
echo "------------------------------------------------------------"

# --- Main loop: read the log file line by line ---
# 'while IFS= read -r LINE' reads each line exactly as-is
# IFS= prevents trimming of leading/trailing spaces
# -r prevents backslash from being treated as escape character
while IFS= read -r LINE; do

    # Check if this line contains our keyword (case-insensitive with -i flag)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter by 1
    fi

done < "$LOGFILE"    # Feed the log file as input to the while loop

# --- Summary output ---
echo ""
echo " RESULT: Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo ""

# --- Show last 5 matching lines using grep + tail ---
if [ $COUNT -gt 0 ]; then
    echo "------------------------------------------------------------"
    echo " Last 5 lines containing '$KEYWORD':"
    echo "------------------------------------------------------------"
    # grep -i does case-insensitive search, tail -5 shows last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo " No lines found matching keyword '$KEYWORD'."
fi

echo "============================================================"
