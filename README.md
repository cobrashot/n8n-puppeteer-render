# n8n with Puppeteer on Render

This repository contains configuration files to deploy n8n with Puppeteer support on Render.

## Features

- Pre-configured n8n Docker image
- Puppeteer support for web automation workflows
- Ready to deploy on Render

## Deployment

1. Fork this repository
2. Create a new Web Service on Render
3. Connect this repository
4. Render will automatically deploy using the Docker configuration

## Environment Variables

The following environment variables are configured:
- `N8N_PORT`: 5678
- `PORT`: 5678
- `NODE_FUNCTION_ALLOW_EXTERNAL`: puppeteer
- `N8N_METRICS`: true
- `N8N_HIRING_BANNER_ENABLED`: false
- `N8N_VERSION_NOTIFICATIONS_ENABLED`: false

## Persistent Storage

This configuration includes a 10GB disk mounted at `/home/node/.n8n` to store your workflows and data.
