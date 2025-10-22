#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------
# Setup script to fetch build scripts from private GitHub repo
# ------------------------------------------------------------

BRANCH="stub"  # or "main" or whichever branch you want
GITHUB_TOKEN="{{ GITHUB PERSONAL ACCESS TOKEN }}"
OWNER="Emestek"
REPO="blossom"
TARGET_DIR="emestek/blossom"

# Verify token is available
if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "❌ GITHUB_TOKEN is empty. Please set it in ~/.config/emestek/env"
  exit 1
fi

# Create target directory if missing
mkdir -p "$TARGET_DIR"

# Build authenticated API URL
ZIP_URL="https://api.github.com/repos/${OWNER}/${REPO}/tarball/${BRANCH}"

# Fetch and extract
echo "⬇️  Downloading ${REPO}:${BRANCH} ..."
curl -L -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github.v3+json" \
  "$ZIP_URL" | tar -xz -C "$TARGET_DIR" --strip-components=1

# Make all bin scripts executable
BIN_DIR="$TARGET_DIR/bin"
if [ -d "$BIN_DIR" ]; then
  echo "⚙️  Setting execute permissions on .sh files in $BIN_DIR ..."
  find "$BIN_DIR" -type f -name "*.sh" -exec chmod +x {} \;
fi

echo "✅ Build scripts successfully downloaded and bin scripts are executable in $TARGET_DIR"
