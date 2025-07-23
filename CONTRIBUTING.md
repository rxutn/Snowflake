# Contributing to Snowflake Proxy Application

Thank you for your interest in contributing! This document provides guidelines for contributing to the project.

## 🚀 Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/snowflake-proxy.git
   cd snowflake-proxy
   ```
3. **Install dependencies**:
   ```bash
   npm install
   ```
4. **Set up environment variables**:
   ```bash
   cp .env.example .env
   # Edit .env with your database configuration
   ```
5. **Start the development server**:
   ```bash
   npm run dev
   ```

## 🛠️ Development Workflow

### Making Changes

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the project structure:
   - Frontend components go in `client/src/components/`
   - Pages go in `client/src/pages/`
   - Backend routes go in `server/routes.ts`
   - Shared types go in `shared/schema.ts`

3. **Test your changes**:
   ```bash
   npm run dev
   # Test functionality in the browser
   ```

4. **Build and test deployment**:
   ```bash
   ./fix-build.sh
   # Verify build structure is correct
   ```

### Code Standards

- **TypeScript**: All code should be properly typed
- **ESLint**: Follow the existing linting rules
- **Components**: Use functional components with hooks
- **Styling**: Use Tailwind CSS classes and shadcn/ui components
- **File naming**: Use kebab-case for files, PascalCase for components

### Commit Messages

Use clear, descriptive commit messages:
```
feat: add consent modal animation
fix: resolve deployment build structure issue
docs: update README installation steps
style: improve mobile responsive design
```

## 🧪 Testing

Before submitting your contribution:

1. **Test development mode**:
   ```bash
   npm run dev
   ```

2. **Test production build**:
   ```bash
   ./fix-build.sh
   ```

3. **Verify all features work**:
   - Toggle functionality
   - Consent modal
   - External links
   - Responsive design

## 📝 Pull Request Process

1. **Update documentation** if needed
2. **Ensure your branch is up to date** with main:
   ```bash
   git checkout main
   git pull upstream main
   git checkout feature/your-feature-name
   git rebase main
   ```
3. **Push your changes**:
   ```bash
   git push origin feature/your-feature-name
   ```
4. **Create a Pull Request** on GitHub with:
   - Clear title and description
   - Screenshots if UI changes
   - Testing notes

## 🐛 Bug Reports

When reporting bugs, include:

1. **Environment information**:
   - Operating system
   - Browser version
   - Node.js version

2. **Steps to reproduce**:
   - Clear step-by-step instructions
   - Expected vs actual behavior

3. **Additional context**:
   - Screenshots if applicable
   - Console errors
   - Relevant code snippets

## 💡 Feature Requests

When suggesting features:

1. **Describe the problem** you're trying to solve
2. **Explain your proposed solution**
3. **Consider alternative solutions**
4. **Think about implementation complexity**

## 🎨 UI/UX Guidelines

- **Accessibility**: Ensure all features are keyboard navigable
- **Mobile-first**: Design for mobile, enhance for desktop
- **Performance**: Keep bundle size minimal
- **Consistency**: Follow existing design patterns
- **Dark mode**: Support both light and dark themes

## 🏗️ Architecture Guidelines

### Frontend
- Use React hooks for state management
- Implement proper error boundaries
- Keep components focused and reusable
- Use TypeScript for all new code

### Backend
- Keep API routes thin, logic in services
- Use proper error handling
- Implement input validation with Zod
- Follow RESTful conventions

### Database
- Use Drizzle ORM for all database operations
- Write migrations for schema changes
- Keep queries efficient
- Use proper indexing

## 🔒 Security

- Never commit sensitive data (API keys, passwords)
- Validate all user inputs
- Use proper authentication mechanisms
- Follow security best practices

## 📄 Documentation

- Update README.md for new features
- Add inline code comments for complex logic
- Update API documentation if backend changes
- Include JSDoc comments for functions

## 🤝 Code Review

All contributions go through code review:

- **Be responsive** to feedback
- **Ask questions** if feedback is unclear
- **Test suggested changes** before implementing
- **Thank reviewers** for their time

## ❓ Questions?

- Check existing [GitHub Issues](https://github.com/your-repo/issues)
- Create a new issue for discussion
- Reach out to maintainers

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to digital freedom! 🌐✊