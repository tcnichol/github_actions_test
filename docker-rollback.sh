#!/bin/bash
# Usage: ./docker-rollback.sh v1.0.0

TARGET_VERSION="$1"
COMPOSE_FILE="docker-compose.yml"  # Path to your compose file

# Validate argument
if [ -z "$TARGET_VERSION" ]; then
  echo "Error: Please specify a version (e.g. ./docker-rollback.sh v1.0.0)"
  exit 1
fi

# Stop Watchtower (pause auto-updates)
echo "Pausing Watchtower..."
docker stop watchtower 2>/dev/null || echo "Watchtower not running (continuing anyway)"

# Roll back to target version
echo "Rolling back to $TARGET_VERSION..."
sed -i "s|image: tcnichol/test:.*|image: tcnichol/test:$TARGET_VERSION|" "$COMPOSE_FILE"

# Pull and restart
docker-compose pull
docker-compose up -d

echo ""
echo "Successfully rolled back to $TARGET_VERSION"
echo "Watchtower is paused. To resume auto-updates:"
echo "  docker start watchtower"