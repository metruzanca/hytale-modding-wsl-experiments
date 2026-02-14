#!/bin/bash
# Setup script for Hytale plugin development in WSL
# This configures your global Gradle properties with the Hytale path

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Setting up Hytale plugin development environment..."

# Check for HYTALE_HOME
if [ -z "$HYTALE_HOME" ]; then
    echo -e "${RED}Error: HYTALE_HOME environment variable is not set${NC}"
    echo ""
    echo "Please set it first by running:"
    echo "  export HYTALE_HOME=\"/mnt/c/Users/YOUR_USERNAME/AppData/Roaming/Hytale\""
    echo ""
    echo "Or if you're using direnv, run: direnv allow"
    exit 1
fi

# Verify the path exists
if [ ! -d "$HYTALE_HOME" ]; then
    echo -e "${RED}Error: Hytale directory does not exist: $HYTALE_HOME${NC}"
    echo "Please ensure Hytale is installed on Windows and the path is correct"
    exit 1
fi

# Configure Gradle user properties
GRADLE_USER_HOME="${HOME}/.gradle"
PROPS_FILE="${GRADLE_USER_HOME}/gradle.properties"

# Create .gradle directory if needed
mkdir -p "$GRADLE_USER_HOME"

# Read existing properties or create empty
touch "$PROPS_FILE"

# Remove existing hytale.home_path if present
if grep -q "^hytale.home_path=" "$PROPS_FILE"; then
    sed -i '/^hytale.home_path=/d' "$PROPS_FILE"
    echo -e "${YELLOW}Updated existing Hytale path configuration${NC}"
else
    echo -e "${GREEN}Adding Hytale path configuration${NC}"
fi

# Add the new path
echo "hytale.home_path=${HYTALE_HOME}" >> "$PROPS_FILE"

echo ""
echo -e "${GREEN}✓ Setup complete!${NC}"
echo ""
echo "Hytale path configured in: ${PROPS_FILE}"
echo "Path: ${HYTALE_HOME}"
echo ""
echo "You can now run: gradle devServer"
