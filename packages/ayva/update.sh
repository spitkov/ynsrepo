#!/bin/bash

# Exit script on any error
set -e

echo "Starting update..."

# Variables
REPO_URL="https://github.com/maybe-asdf/yaergu-ayva/"
DEST_DIR="$HOME/yaergu-ayva"
HIDDEN_DIR="$HOME/.ayva"
DESKTOP_FILE="ayva.desktop"
APPLICATIONS_DIR="$HOME/.local/share/applications"
BINARY_PATH="/usr/bin/ayva"
VENV_DIR="$HIDDEN_DIR/venv"

# Check if the repository directory exists
if [ ! -d "$HIDDEN_DIR" ]; then
    echo "The repository directory does not exist. Please install the software first."
    exit 1
fi

# Navigate to the hidden repository directory
cd "$HIDDEN_DIR"

# Pull the latest changes from the repository (without checking for changes)
echo "Pulling latest changes from the repository..."
git pull origin main

# Reinstall dependencies in the virtual environment
echo "Reinstalling dependencies..."
source "$VENV_DIR/bin/activate"
pip install --upgrade vosk pyaudio

# Rebuild or refresh the binary if necessary
if [ -f "$DEST_DIR/ayva" ]; then
    echo "Reinstalling the ayva binary..."
    sudo mv -f "$DEST_DIR/ayva" "$BINARY_PATH"
else
    echo "No ayva binary found, skipping installation."
fi

# Update the desktop entry (if any change is detected)
if [ -f "$DEST_DIR/$DESKTOP_FILE" ]; then
    echo "Updating desktop entry..."
    mv -f "$DEST_DIR/$DESKTOP_FILE" "$APPLICATIONS_DIR"
else
    echo "No changes detected for the desktop entry."
fi

exit 0
