#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: [RAJVEER THAKUR ]
 | Roll No: [24MIM10115]
# Course: Open Source Software | VIT Bhopal
# Description: Asks the user 3 questions interactively, then
#              generates a personal open source philosophy
#              statement and saves it to a .txt file.
# =============================================================

# --- Alias concept (demonstrated via comment as required) ---
# In a real shell session, you could define:
#   alias today='date "+%d %B %Y"'
# to create a shortcut command. Below we use the full date command instead,
# but this demonstrates the concept of aliases in bash.

echo "============================================================"
echo "        OPEN SOURCE MANIFESTO GENERATOR"
echo "        Inspired by Python and the FOSS Philosophy"
echo "============================================================"
echo ""
echo " Answer 3 questions and your personal manifesto will be"
echo " generated and saved as a text file."
echo ""

# --- Read user input interactively using the 'read' command ---
# -p flag shows a prompt message before waiting for input

read -p " 1. Name one open-source tool you use every day: " TOOL
echo ""

read -p " 2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

read -p " 3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Get current date and logged-in username ---
DATE=$(date '+%d %B %Y')       # Formatted date e.g. 21 March 2026
USERNAME=$(whoami)             # The person running this script

# --- Define output filename using string concatenation ---
# We combine the word "manifesto_" with the username and ".txt"
OUTPUT="manifesto_${USERNAME}.txt"

echo "------------------------------------------------------------"
echo " Generating your manifesto..."
echo ""

# --- Write the manifesto to the output file using > (overwrite) ---
# > creates the file if it doesn't exist, or overwrites if it does

echo "============================================================" > "$OUTPUT"
echo "          MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "          By: $USERNAME | Date: $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Compose the manifesto paragraph using the user's answers ---
# String concatenation happens naturally in bash when you put variables
# next to text inside an echo statement

echo " Every day, I rely on $TOOL — a tool that someone built" >> "$OUTPUT"
echo " and chose to share with the world, expecting nothing in return." >> "$OUTPUT"
echo " That act of sharing is what the open-source movement stands for." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo " To me, freedom means $FREEDOM. In the world of software," >> "$OUTPUT"
echo " that freedom is not just a feature — it is a right. The right" >> "$OUTPUT"
echo " to read the code that runs your machine, to learn from it," >> "$OUTPUT"
echo " to fix it when it breaks, and to pass it on to others." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo " Python taught me this. It was not built by a corporation" >> "$OUTPUT"
echo " trying to capture market share. It was built by Guido van Rossum" >> "$OUTPUT"
echo " in his spare time, with the belief that a programming language" >> "$OUTPUT"
echo " should be beautiful, readable, and free for everyone." >> "$OUTPUT"
echo " Millions of people learned to code because of that one decision." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo " One day, I want to build $BUILD and release it openly —" >> "$OUTPUT"
echo " so that someone I have never met, in a country I may never" >> "$OUTPUT"
echo " visit, can use it, improve it, and build something even better." >> "$OUTPUT"
echo " That is what it means to stand on the shoulders of giants." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo " This is my commitment to the open-source philosophy." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "                              — $USERNAME, $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm save and display the manifesto ---
echo " Manifesto saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"

# --- cat displays the contents of the saved file ---
cat "$OUTPUT"

echo "============================================================"
