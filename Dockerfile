FROM n8nio/n8n:latest

# Install puppeteer with a compatible version (global install)
RUN npm install -g puppeteer@18.1.0

# Set the NODE_FUNCTION_ALLOW_EXTERNAL environment variable
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer
