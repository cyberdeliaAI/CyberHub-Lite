FROM python:3.12-slim

WORKDIR /app

# Install system dependencies for fonts (fallback) and basic tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends fonts-dejavu-core fonts-liberation && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements first for layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Pre-download fonts at build time so first launch is instant
RUN python resources/fonts/download_fonts.py || true

# Create non-root user
RUN useradd -m -s /bin/sh cyberhub && chown -R cyberhub:cyberhub /app

# Make entrypoint executable
RUN chmod +x entrypoint.sh

# Default: listen on all interfaces with no auth (Docker network isolation handles security)
# Override with --listen --auth or --share-network as needed
EXPOSE 8899

# Run entrypoint as root (for chown), then it switches to cyberhub
ENTRYPOINT ["./entrypoint.sh"]
CMD ["--listen", "--no-auth"]