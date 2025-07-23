#!/bin/bash
# Deployment verification script for Snowflake Proxy Application

echo "🔍 Verifying Snowflake Proxy deployment readiness..."
echo

# Check if required files exist
echo "📁 Checking required files..."
required_files=(
    "package.json"
    "fix-build.sh"
    "README.md"
    ".env.example"
    ".gitignore"
    "client/index.html"
    "server/index.ts"
    "shared/schema.ts"
    "vite.config.ts"
    "tsconfig.json"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
    else
        echo "✗ $file (missing)"
        exit 1
    fi
done

echo
echo "🔧 Testing build process..."

# Clean previous builds
rm -rf dist/

# Run build
if npm run build > /dev/null 2>&1; then
    echo "✓ npm run build successful"
else
    echo "✗ npm run build failed"
    exit 1
fi

# Test fix script
if ./fix-build.sh > /dev/null 2>&1; then
    echo "✓ fix-build.sh successful"
else
    echo "✗ fix-build.sh failed"
    exit 1
fi

echo
echo "📦 Verifying build output..."

# Check build structure
if [ -f "dist/index.html" ]; then
    echo "✓ Frontend built correctly (index.html in dist/)"
else
    echo "✗ Frontend build issue (index.html not in dist/)"
    exit 1
fi

if [ -f "dist/index.js" ]; then
    echo "✓ Backend built correctly (index.js in dist/)"
else
    echo "✗ Backend build issue (index.js not in dist/)"
    exit 1
fi

if [ -d "dist/assets" ]; then
    echo "✓ Assets directory present"
else
    echo "✗ Assets directory missing"
    exit 1
fi

echo
echo "🌐 Testing development server..."

# Start dev server in background and test
npm run dev &
DEV_PID=$!

# Wait for server to start
sleep 5

# Check if server is responding
if curl -s http://localhost:5000 > /dev/null; then
    echo "✓ Development server responding"
else
    echo "✗ Development server not responding"
    kill $DEV_PID 2>/dev/null
    exit 1
fi

# Kill dev server
kill $DEV_PID 2>/dev/null

echo
echo "📋 Checking documentation..."

required_docs=(
    "README.md"
    "CONTRIBUTING.md"
    "CHANGELOG.md"
    "DEPLOYMENT.md"
    "LICENSE"
)

for doc in "${required_docs[@]}"; do
    if [ -f "$doc" ]; then
        echo "✓ $doc"
    else
        echo "✗ $doc (missing)"
        exit 1
    fi
done

echo
echo "🔐 Checking configuration files..."

config_files=(
    ".env.example"
    ".gitignore"
    ".dockerignore"
    "Dockerfile"
    "docker-compose.yml"
    ".github/workflows/deploy.yml"
)

for config in "${config_files[@]}"; do
    if [ -f "$config" ]; then
        echo "✓ $config"
    else
        echo "✗ $config (missing)"
        exit 1
    fi
done

echo
echo "🎉 All verification checks passed!"
echo
echo "📋 Deployment Summary:"
echo "   • Frontend: React + TypeScript + Tailwind CSS"
echo "   • Backend: Node.js + Express + PostgreSQL"
echo "   • Build: Vite + esbuild"
echo "   • Deployment: Ready for Replit, Vercel, Railway, Docker"
echo
echo "🚀 Next steps:"
echo "   1. Push to GitHub repository"
echo "   2. Configure environment variables"
echo "   3. Deploy using preferred platform"
echo "   4. Run './fix-build.sh' before Replit deployment"
echo
echo "✨ Your Snowflake Proxy application is ready for deployment!"