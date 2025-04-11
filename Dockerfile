FROM n8nio/n8n:latest

USER node

# Install puppeteer locally in the user's home directory
RUN mkdir -p /home/node/.n8n/custom && \
    cd /home/node/.n8n/custom && \
    npm init -y && \
    npm install puppeteer@18.1.0 --no-save

# Set the NODE_FUNCTION_ALLOW_EXTERNAL environment variable
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer
ENV NODE_PATH=/home/node/.n8n/custom/node_modules
