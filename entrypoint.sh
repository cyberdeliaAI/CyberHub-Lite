#!/bin/sh
# Ensure data directory exists
mkdir -p /app/data
exec python3 -u /app/hub.py "$@"