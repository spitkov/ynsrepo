#!/bin/bash

# Exit script on any error
set -e

echo "Starting uninstallation..."

# Variables
REPO_URL="https://github.com/maybe-asdf/yaergu-ayva/"
DEST_DIR="$HOME/yaergu-ayva"
HIDDEN_DIR="$HOME/.ayva"
DESKTOP_FILE="ayva.desktop"
APPLICATIONS_DIR="$HOME/.local/share/applications"
BINARY_PATH="/usr/bin/ayva"
VENV_DIR="$HIDDEN_DIR/venv"

# Remove the binary file
echo "Removing the ayva binary from $BINARY_PATH..."
sudo rm -f "$BINARY_PATH"

# Remove the desktop file
echo "Removing $DESKTOP_FILE from $APPLICATIONS_DIR..."
rm -f "$APPLICATIONS_DIR/$DESKTOP_FILE"

# Remove the virtual environment
echo "Removing virtual environment at $VENV_DIR..."
rm -rf "$VENV_DIR"

# Remove the repository folder
echo "Removing $HIDDEN_DIR directory..."
rm -rf "$HIDDEN_DIR"

# Optionally, you can remove the repository clone directory if it exists
if [ -d "$DEST_DIR" ]; then
    echo "Removing $DEST_DIR directory..."
    rm -rf "$DEST_DIR"
fi

exit 0
