#!/bin/bash

# --- PyCUDA Source Setup Script 

# Configuration Variables
PYCUDA_VERSION="2025.1.2"
PYCUDA_FILENAME="pycuda-${PYCUDA_VERSION}.tar.gz"
PYCUDA_DIR="pycuda-${PYCUDA_VERSION}"

# This path is relative to your user's home directory (~).
CONFIG_SOURCE_PATH="./pycuda_build_config/siteconf.py"

echo "Setting up PyCUDA ${PYCUDA_VERSION} source in /tmp..."

# Go to a temporary directory and check
cd /tmp || { echo "Error: Failed to change directory to /tmp. Exiting."; exit 1; }

# Download the PyCUDA source package (silent download)
wget -q "https://pypi.io/packages/source/p/pycuda/${PYCUDA_FILENAME}"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download ${PYCUDA_FILENAME}. Exiting."
    exit 1
fi
echo "Downloaded source."

# Extract the tarball (silent extraction)
tar -xvf "${PYCUDA_FILENAME}" > /dev/null

if [ ! -d "${PYCUDA_DIR}" ]; then
    echo "Error: Extraction failed. Directory ${PYCUDA_DIR} not found. Exiting."
    exit 1
fi

# Change into the extracted directory
cd "${PYCUDA_DIR}" || { echo "Error: Failed to change directory to ${PYCUDA_DIR}. Exiting."; exit 1; }

# Copy the custom siteconf.py into the build directory
cp "${CONFIG_SOURCE_PATH}" .

if [ $? -ne 0 ]; then
    echo "Error: Failed to copy siteconf.py. Ensure source path is correct. Exiting."
    exit 1
fi

echo "✅ Setup complete. Custom siteconf.py is in place."
echo "Ready to build: python setup.py install"