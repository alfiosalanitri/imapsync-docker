#!/bin/bash

set -e

# 🚨 Require version as argument
if [[ -z "$1" ]]; then
  echo "Usage: ./release.sh vX.Y.Z"
  exit 1
fi

VERSION="$1"

# ✅ Check tag format
if ! [[ "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Error: Version must follow semantic versioning format, e.g., v1.0.0"
  exit 1
fi

# 🟡 Commit changes if any
if ! git diff-index --quiet HEAD --; then
  echo "Uncommitted changes detected. Staging and committing..."
  git add .
  git commit -m "Release $VERSION"
fi

# 🏷️ Create and push tag
git tag "$VERSION"
git push origin "$VERSION"

# 🐳 Output image name for clarity
echo ""
echo "✅ Tag $VERSION pushed!"
echo "The Docker image will be available at:"
echo "  ghcr.io/alfiosalanitri/imapsync-docker:$VERSION"
echo "  ghcr.io/alfiosalanitri/imapsync-docker:latest"
