#!/bin/bash
# Fix build script for Replit deployment
# This script resolves the mismatch between Vite output (dist/public) and Replit deployment expectations (dist)

echo "Running build process..."
npm run build

echo "Fixing directory structure for Replit deployment..."
# Move files from dist/public to dist and remove the public directory
if [ -d "dist/public" ]; then
    cp -r dist/public/* dist/
    rm -rf dist/public
    echo "✓ Build structure fixed: index.html now in dist/"
else
    echo "! No dist/public directory found"
fi

echo "Verifying build structure..."
ls -la dist/

echo "Build fix completed successfully!"