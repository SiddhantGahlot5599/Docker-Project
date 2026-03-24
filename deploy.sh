#!/bin/bash

set -e   # stop if any command fails

echo "=============================="
echo "Starting Deployment..."
echo "=============================="

echo "Pulling latest code..."
git pull origin main

echo "Stopping old containers..."
docker-compose down

echo "Building & starting new containers..."
docker-compose up -d --build

echo "Cleaning unused images..."
docker image prune -f

echo "=============================="
echo "Deployment Completed 🚀"
echo "=============================="
