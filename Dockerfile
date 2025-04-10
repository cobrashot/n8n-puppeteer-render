FROM n8nio/n8n:latest

USER root

# Install dependencies for Puppeteer
RUN apt-get update && apt-get install -y \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    libu2f-udev \
    libvulkan1 \
    libwebpmux3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to node user
USER node

# Set the NODE_FUNCTION_ALLOW_EXTERNAL environment variable
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer
