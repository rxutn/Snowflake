# Snowflake Proxy Application

## Overview

This is a full-stack web application that implements a Snowflake proxy interface for the Tor Project. Snowflake is a system that helps users in censored regions access the Tor network by providing WebRTC-based proxy connections. The application features a modern React frontend with a Node.js/Express backend, designed to simulate and manage proxy connections.

## User Preferences

Preferred communication style: Simple, everyday language.

## Recent Changes

- **July 23, 2025**: Fixed Replit deployment issue with build directory structure
- **July 23, 2025**: Created fix-build.sh script to resolve Vite output vs deployment expectations mismatch
- **July 23, 2025**: Renamed project from "rest-express" to "Snowflake"
- **July 23, 2025**: Updated logo to use Snowflake-specific logo with onion and snowflake design 
- **July 23, 2025**: Simplified Snowflake interface by removing retry and consent page buttons
- **July 23, 2025**: Updated toggle behavior to show consent modal when enabling proxy  
- **July 23, 2025**: Updated toggle text to "Help people to bypass censorship using Snowflake ✊"
- **July 23, 2025**: Removed "Keep running when browser is closed" persistent option per user request
- **July 23, 2025**: Added browser extension links for Firefox and Chrome with emoji icons
- **July 23, 2025**: Added footer with anatole.co attribution, Tor Project disclaimer, and open source link

## System Architecture

### Frontend Architecture
- **Framework**: React 18 with TypeScript
- **Styling**: Tailwind CSS with shadcn/ui component library
- **Routing**: Wouter for client-side routing
- **State Management**: TanStack Query (React Query) for server state management
- **Build Tool**: Vite for fast development and optimized builds
- **UI Components**: Comprehensive shadcn/ui component system with Radix UI primitives

### Backend Architecture
- **Runtime**: Node.js with Express.js framework
- **Language**: TypeScript with ES modules
- **Database**: PostgreSQL with Drizzle ORM
- **Database Provider**: Neon Database (serverless PostgreSQL)
- **Session Management**: Express sessions with PostgreSQL session store
- **Development**: tsx for TypeScript execution in development

### Project Structure
The application follows a monorepo structure with clear separation:
- `client/` - React frontend application
- `server/` - Express backend API
- `shared/` - Shared TypeScript types and database schema
- `migrations/` - Database migration files

## Key Components

### Frontend Components
1. **SnowflakeEmbed**: Main component that simulates WebRTC proxy functionality
2. **ConsentModal**: Educational modal explaining Snowflake's purpose and operation
3. **UI Components**: Complete shadcn/ui component library for consistent design
4. **Pages**: Snowflake main page and 404 error handling

### Backend Components
1. **Express Server**: Main application server with middleware setup
2. **Storage Interface**: Abstract storage layer with in-memory implementation
3. **Route Registration**: Modular route handling system
4. **Vite Integration**: Development server integration for hot reloading

### Database Schema
- **Users Table**: Basic user management with username/password authentication
- **Drizzle ORM**: Type-safe database operations with Zod validation
- **PostgreSQL**: Production-ready database with session persistence

## Data Flow

1. **Client Requests**: Frontend makes API calls through TanStack Query
2. **API Routes**: Express server handles requests with `/api` prefix
3. **Storage Layer**: Abstract storage interface allows for different implementations
4. **Database Operations**: Drizzle ORM provides type-safe database interactions
5. **Session Management**: PostgreSQL-backed sessions for user persistence

## External Dependencies

### Core Dependencies
- **@neondatabase/serverless**: Serverless PostgreSQL connection
- **drizzle-orm**: Type-safe database ORM
- **@tanstack/react-query**: Server state management
- **wouter**: Lightweight React router
- **express**: Web application framework

### UI Dependencies
- **@radix-ui/***: Comprehensive set of low-level UI primitives
- **tailwindcss**: Utility-first CSS framework
- **lucide-react**: Icon library
- **class-variance-authority**: Utility for managing component variants

### Development Dependencies
- **vite**: Build tool and development server
- **tsx**: TypeScript execution for Node.js
- **drizzle-kit**: Database migration and management tool

## Deployment Strategy

### Development
- **Frontend**: Vite dev server with hot module replacement
- **Backend**: tsx for TypeScript execution with file watching
- **Database**: Local PostgreSQL or Neon Database connection
- **Integration**: Vite proxy integration for seamless full-stack development

### Production
- **Build Process**: 
  - Frontend: Vite builds to `dist/public`
  - Backend: esbuild bundles server code to `dist/index.js`
- **Static Serving**: Express serves built frontend assets
- **Database**: PostgreSQL with connection pooling via Neon
- **Environment**: NODE_ENV=production with optimized builds

### Configuration
- **Database**: Configured via `DATABASE_URL` environment variable
- **TypeScript**: Shared configuration across client/server/shared code
- **Path Aliases**: Consistent import paths using `@/` and `@shared/` aliases
- **Session Store**: PostgreSQL-backed sessions using connect-pg-simple

The application is designed to be easily deployable on platforms like Replit, with proper environment variable configuration and database provisioning.