# MCP Configuration Guide

## Environment Setup

Create a `.env` file in your project root with the following variables:

```bash
# Required for Sentry MCP
SENTRY_DSN=https://your-key@o123456.ingest.sentry.io/123456
SENTRY_ORG=your-org-slug
SENTRY_PROJECT=your-project-name
SENTRY_AUTH_TOKEN=your-auth-token

# Required for Brave Search MCP (or use built-in WebSearch)
BRAVE_API_KEY=your-brave-api-key

# Required for PostgreSQL MCP
DATABASE_URL=postgresql://user:password@localhost:5432/dbname

# Optional for Docker MCP
DOCKER_HOST=unix:///var/run/docker.sock
```

## Getting API Keys

### Sentry
1. Go to https://sentry.io/settings/account/api/auth-tokens/
2. Create new token with scopes: `project:read`, `project:write`, `event:read`
3. Copy DSN from your project settings
4. Get org slug from URL: `https://sentry.io/organizations/{org-slug}/`

### Brave Search
1. Go to https://brave.com/search/api/
2. Sign up for API access
3. Generate API key
4. Note: Claude Code may have built-in WebSearch, Brave is optional

## Installation in Claude Code

Add to your Claude Code settings (location varies by OS):

**macOS/Linux**: `~/.config/claude-code/config.json`
**Windows**: `%APPDATA%\claude-code\config.json`

```json
{
  "mcpServers": {
    "sentry": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sentry"],
      "env": {
        "SENTRY_DSN": "your-dsn",
        "SENTRY_ORG": "your-org",
        "SENTRY_PROJECT": "your-project",
        "SENTRY_AUTH_TOKEN": "your-token"
      }
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-playwright"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

## Verification

After setup, restart Claude Code and run:

```
"List all available MCP tools"
```

You should see tools prefixed with:
- `mcp__sentry__*`
- `mcp__playwright__*`
- `mcp__sequential_thinking__*`
- `mcp__memory__*`
- `mcp__brave_search__*` (if configured)
- `mcp__postgres__*` (if configured)
- `mcp__git__*` (if configured)
- `mcp__docker__*` (if configured)

## Troubleshooting

### MCPs not appearing

1. Check config.json syntax (valid JSON)
2. Restart Claude Code completely
3. Check logs for MCP initialization errors
4. Verify environment variables are set

### Sentry connection failing

1. Verify DSN format
2. Check auth token has correct scopes
3. Confirm project and org names are correct
4. Test with curl:
   ```bash
   curl -H "Authorization: Bearer YOUR_TOKEN" \
        https://sentry.io/api/0/organizations/YOUR_ORG/
   ```

### Playwright errors

1. May need to install browsers first:
   ```bash
   npx playwright install
   ```
2. Check browser compatibility with your OS

### Database connection failing

1. Verify DATABASE_URL format
2. Check database is running
3. Confirm user has correct permissions
4. Test connection:
   ```bash
   psql "$DATABASE_URL" -c "SELECT 1"
   ```
