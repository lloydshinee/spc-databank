#!/bin/bash

set -e  # exit on error

APP_NAME="Databank"
BRANCH="main"

echo "🚀 Starting deployment..."

# Go to project directory (script location)
cd "$(dirname "$0")"

echo "📥 Pulling latest code..."
git pull origin $BRANCH

echo "📦 Installing dependencies..."
npm install

echo "🏗️  Building app..."
npm run build

echo "♻️  Restarting app with PM2..."
pm2 restart $APP_NAME || pm2 start npm --name "$APP_NAME" -- run start

echo "✅ Deployment complete!"
