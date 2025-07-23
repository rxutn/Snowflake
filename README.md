# Snowflake Proxy Application

A web-based Snowflake proxy interface that enables users to help bypass internet censorship with a simple, user-friendly toggle mechanism.

## 🌟 Features

- **Simple Toggle Interface**: One-click activation to help people bypass censorship
- **Educational Consent Modal**: Explains Snowflake's purpose and operation
- **Modern React Frontend**: Built with TypeScript, Tailwind CSS, and shadcn/ui
- **Express Backend**: Full-stack application with session management
- **Responsive Design**: Works seamlessly across desktop and mobile devices
- **Browser Extensions**: Quick links to Firefox and Chrome extensions

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ and npm
- PostgreSQL database (local or cloud)

### Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd snowflake-proxy
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your database configuration
```

4. Start development server:
```bash
npm run dev
```

The application will be available at `http://localhost:5000`

## 🏗️ Build & Deploy

### For Replit (Recommended)

1. Import this repository to Replit
2. Configure environment variables in Secrets
3. Run the deployment fix:
```bash
./fix-build.sh
```
4. Deploy using Replit's deployment feature

### For Other Platforms

1. Build the application:
```bash
npm run build
```

2. For Replit-style deployment, use the fix script:
```bash
./fix-build.sh
```

3. Deploy the `dist/` directory to your hosting platform

## 🛠️ Technology Stack

### Frontend
- **React 18** with TypeScript
- **Tailwind CSS** with shadcn/ui components
- **Wouter** for client-side routing
- **TanStack Query** for server state management
- **Vite** for fast development and builds

### Backend
- **Node.js** with Express.js
- **TypeScript** with ES modules
- **PostgreSQL** with Drizzle ORM
- **Express sessions** for user management

## 📁 Project Structure

```
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/     # UI components
│   │   ├── pages/          # Application pages
│   │   └── lib/           # Utilities and configs
├── server/                 # Express backend
│   ├── index.ts           # Main server file
│   ├── routes.ts          # API routes
│   └── storage.ts         # Storage interface
├── shared/                # Shared types and schemas
└── migrations/            # Database migrations
```

## 🔧 Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABASE_URL` | PostgreSQL connection string | Yes |
| `NODE_ENV` | Environment (development/production) | Yes |
| `PORT` | Server port (default: 5000) | No |

### Database Setup

The application uses PostgreSQL with Drizzle ORM. Supported providers:
- **Neon Database** (recommended for serverless)
- **Supabase**
- **Railway**
- **Local PostgreSQL**

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Related Links

- [Tor Project](https://www.torproject.org/)
- [Snowflake Documentation](https://snowflake.torproject.org/)
- [Firefox Extension](https://addons.mozilla.org/en-US/firefox/addon/torproject-snowflake/)
- [Chrome Extension](https://chrome.google.com/webstore/detail/snowflake/mafpmfcccpbjnhfhjnllmmalhifmlcie)

## ⚠️ Disclaimer

This is an educational implementation that simulates the Snowflake proxy interface. It is not affiliated with the official Tor Project. For actual Snowflake proxy functionality, please use the official Tor Project tools and browser extensions.

## 🙏 Acknowledgments

- Built with ❤️ for digital freedom
- Inspired by the Tor Project's Snowflake system
- UI components from [shadcn/ui](https://ui.shadcn.com/)