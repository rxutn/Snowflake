# Deployment Guide

This guide covers various deployment options for the Snowflake proxy application.

## Prerequisites

- Node.js 18+ and npm
- PostgreSQL database (local or cloud)
- Environment variables configured

## Environment Setup

1. Copy the environment template:
```bash
cp .env.example .env
```

2. Configure your variables:
```bash
DATABASE_URL=postgresql://username:password@host:5432/database
NODE_ENV=production
```

## Build Process

```bash
# Install dependencies
npm install

# Build the application
npm run build
```

This creates:
- `dist/public/` - Frontend static files
- `dist/index.js` - Backend server bundle

## Deployment Options

### 1. Replit (Recommended)

The application is optimized for Replit deployment:

1. Import the repository to Replit
2. Configure environment variables in Secrets
3. Run the build fix script before deployment: `./fix-build.sh`
4. The application will auto-deploy using the existing configuration

**Note**: Due to a mismatch between Vite's build output (`dist/public`) and Replit's deployment expectations (`dist`), use the provided `fix-build.sh` script to restructure the build output correctly.

### 2. Vercel

For frontend-focused deployment:

1. Connect your GitHub repository to Vercel
2. Configure build settings:
   - Build Command: `npm run build`
   - Output Directory: `dist/public`
3. Add environment variables in Vercel dashboard

### 3. Railway

For full-stack deployment:

1. Connect repository to Railway
2. Configure environment variables
3. Railway will auto-detect and deploy both frontend and backend

### 4. Heroku

Traditional deployment option:

1. Create a new Heroku app
2. Add PostgreSQL addon
3. Configure environment variables
4. Deploy via Git:
```bash
git push heroku main
```

### 5. Docker (Optional)

Create a `Dockerfile`:
```dockerfile
FROM node:18-alpine

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build

EXPOSE 5000
CMD ["npm", "start"]
```

Build and run:
```bash
docker build -t snowflake .
docker run -p 5000:5000 snowflake
```

### 6. VPS/Self-Hosted

For custom server deployment:

1. Clone repository on your server
2. Install dependencies and build
3. Set up process manager (PM2):
```bash
npm install -g pm2
pm2 start dist/index.js --name snowflake
pm2 startup
pm2 save
```

4. Configure reverse proxy (Nginx):
```nginx
server {
    listen 80;
    server_name your-domain.com;
    
    location / {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## Database Setup

### Neon Database (Recommended)

1. Create account at [neon.tech](https://neon.tech)
2. Create new project
3. Copy connection string to `DATABASE_URL`

### Other PostgreSQL Providers

- **Supabase**: Full-featured PostgreSQL with dashboard
- **Railway**: Built-in PostgreSQL addon
- **AWS RDS**: Managed PostgreSQL service
- **DigitalOcean**: Managed database service

## Post-Deployment

1. **Test functionality**:
   - Verify proxy toggle works
   - Check consent modal
   - Test all external links

2. **Monitor performance**:
   - Database connections
   - Response times
   - Error rates

3. **Configure monitoring** (optional):
   - Sentry for error tracking
   - Analytics for usage metrics
   - Uptime monitoring

## Environment Variables Reference

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABASE_URL` | PostgreSQL connection string | Yes |
| `NODE_ENV` | Environment (development/production) | Yes |
| `PORT` | Server port (default: 5000) | No |

## SSL/HTTPS

For production deployments, ensure HTTPS is enabled:
- Most cloud platforms handle this automatically
- For self-hosted, use Let's Encrypt with Certbot
- Configure proper security headers

## Scaling Considerations

- **Database**: Use connection pooling for high traffic
- **CDN**: Serve static assets via CDN for better performance
- **Load Balancer**: Multiple instances for high availability
- **Caching**: Implement Redis for session storage if needed

## Troubleshooting

### Common Issues

1. **Database connection errors**:
   - Verify `DATABASE_URL` format
   - Check database server accessibility
   - Ensure database exists

2. **Build failures**:
   - Check Node.js version compatibility
   - Verify all dependencies are installed
   - Clear node_modules and reinstall

3. **Assets not loading**:
   - Verify static file serving configuration
   - Check file paths in build output
   - Ensure proper MIME types

### Support

For deployment assistance:
- Check GitHub issues
- Review platform-specific documentation
- Test locally before deploying