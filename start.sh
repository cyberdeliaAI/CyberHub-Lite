#!/usr/bin/env bash
# CyberHub — Start script for macOS / Linux
set -e
cd "$(dirname "$0")"

if [ ! -x ".venv/bin/python" ]; then
    # Find a supported Python 3. Prefer versions with reliable wheels for
    # Pillow/numpy/OpenCV.
    PYTHON=""
    for cmd in python3.12 python3.11 python3.10 python3.13 python3 python; do
        if command -v "$cmd" &>/dev/null; then
            ok=$("$cmd" -c "import sys; print('1' if sys.version_info >= (3,10) and sys.version_info < (3,14) else '0')" 2>/dev/null || echo "0")
            if [ "$ok" = "1" ]; then
                PYTHON="$cmd"
                break
            fi
        fi
    done

    if [ -z "$PYTHON" ]; then
        echo "[ERROR] Supported Python not found. Install Python 3.10, 3.11, 3.12 or 3.13 from https://www.python.org"
        exit 1
    fi

    echo "[SETUP] Creating virtual environment..."
    "$PYTHON" -m venv .venv
fi

# Always ensure dependencies are up to date. Do not hide failures: if Pillow,
# numpy or OpenCV fail to install, the hub should not continue with a broken
# image stack.
echo "[SETUP] Checking Python packages..."
if ! ".venv/bin/python" -m pip install --upgrade pip -q; then
    deps_failed=1
elif ! ".venv/bin/python" -m pip install -q -r requirements.txt; then
    deps_failed=1
elif ! ".venv/bin/python" -c "import PIL, requests, send2trash" >/dev/null 2>&1; then
    deps_failed=1
else
    deps_failed=0
fi
if [ "$deps_failed" = "1" ]; then
    echo
    echo "[ERROR] Python packages are missing or failed to install."
    echo "[ERROR] This usually happens when the .venv was created with an unsupported Python version."
    echo "[ERROR] Recommended fix:"
    echo "        1. Install Python 3.12 or 3.11"
    echo "        2. Delete the .venv folder inside this hub folder"
    echo "        3. Run ./start.sh again"
    echo
    ".venv/bin/python" --version
    exit 1
fi

# Download local fonts + ONNX runtime on first run (idempotent, skips existing)
if [ ! -f "resources/fonts/inter-400.woff2" ]; then
    echo "[SETUP] Downloading fonts and assets (first run only)..."
    ".venv/bin/python" resources/fonts/download_fonts.py || \
        echo "[WARN] Font download failed — the hub will fall back to system fonts."
fi

# Run
exec ".venv/bin/python" hub.py "$@"
