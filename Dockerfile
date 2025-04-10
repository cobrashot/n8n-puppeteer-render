FROM n8nio/n8n:latest

USER root

# Install Chrome dependencies
RUN apt-get update && apt-get install -y \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgbm1 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install puppeteer with a compatible version
RUN npm install -g puppeteer@18.1.0

# Set the NODE_FUNCTION_ALLOW_EXTERNAL environment variable
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer

# Use the default n8n start command
ENTRYPOINT ["tini", "--", "n8n"]
