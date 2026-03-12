#!/bin/bash

# DagHub Setup Script
# This script helps you connect your project to DagHub

echo "=== DagHub Setup ==="
echo ""

# Get user input
read -p "Enter your DagHub username: " DAGSHUB_USER
read -p "Enter your DagHub repository name: " DAGSHUB_REPO
read -p "Enter your DagHub token: " -s DAGSHUB_TOKEN
echo ""

# Configure DVC remote
echo "Configuring DVC remote..."
dvc remote add origin https://dagshub.com/$DAGSHUB_USER/$DAGSHUB_REPO.dvc
dvc remote modify origin --local auth basic
dvc remote modify origin --local user $DAGSHUB_USER
dvc remote modify origin --local password $DAGSHUB_TOKEN

# Configure Git remote
echo "Configuring Git remote..."
git remote add origin https://dagshub.com/$DAGSHUB_USER/$DAGSHUB_REPO.git

echo ""
echo "✓ DagHub configuration complete!"
echo ""
echo "Next steps:"
echo "1. git add ."
echo "2. git commit -m 'Initial commit'"
echo "3. git push -u origin main"
echo "4. dvc push"
