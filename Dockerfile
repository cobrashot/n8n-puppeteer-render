FROM n8nio/n8n:latest-debian

USER root

# Install Puppeteer dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Puppeteer globally with Chromium
RUN npm install -g puppeteer@18.1.0

# Set NODE_FUNCTION_ALLOW_EXTERNAL for n8n
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer

# Create directories and set permissions
RUN mkdir -p /opt/render/.n8n && \
    chmod -R 777 /opt/render/.n8n

# Create a startup script
RUN echo '#!/bin/bash\n\
mkdir -p /opt/render/.n8n/database\n\
chmod -R 777 /opt/render/.n8n\n\
export N8N_USER_FOLDER=/opt/render/.n8n\n\
exec n8n start' > /start.sh && \
chmod +x /start.sh

# Set the startup command
ENTRYPOINT ["/start.sh"]
