#!/bin/bash

# Save the current directory
ORIGINAL_DIR=$(pwd)

# Navigate to the Git repository root directory
REPO_ROOT=$(git rev-parse --show-toplevel)
cd "$REPO_ROOT" || { echo "Failed to enter $REPO_ROOT directory"; exit 1; }

# Precommit
../scripts/precommit.sh

# Return to the original directory
cd "$ORIGINAL_DIR"
