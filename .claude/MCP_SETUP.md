# MCP Configuration Guide

## 🇳🇱 Nederlandse Handleiding: MCP's Downloaden en Instellen

### Wat zijn MCP's?

Model Context Protocol (MCP) servers geven Claude extra mogelijkheden zoals:
- **Sentry**: Productie errors monitoren
- **Playwright**: End-to-end testing met browsers
- **Sequential Thinking**: Complexe problemen oplossen
- **Memory**: Context bewaren tussen sessies
- **PostgreSQL**: Database queries uitvoeren
- **Git**: Git operaties
- **Docker**: Container management
- **Brave Search**: Web searches

### Stap 1: Kopieer de MCP Configuratie

Kopieer het bestand `.claude/mcp-config.json` naar je Claude Code configuratie map:

**macOS/Linux**:
```bash
mkdir -p ~/.config/claude-code
cp .claude/mcp-config.json ~/.config/claude-code/config.json
```

**Windows**:
```powershell
mkdir $env:APPDATA\claude-code -ErrorAction SilentlyContinue
copy .claude\mcp-config.json $env:APPDATA\claude-code\config.json
```

### Stap 2: Stel Environment Variables In

Maak een `.env` bestand in je project root:

```bash
# Verplicht voor Sentry MCP
SENTRY_DSN=https://your-key@o123456.ingest.sentry.io/123456
SENTRY_ORG=your-org-slug
SENTRY_PROJECT=your-project-name
SENTRY_AUTH_TOKEN=your-auth-token

# Optioneel voor Brave Search (Claude heeft ingebouwde WebSearch)
BRAVE_API_KEY=your-brave-api-key

# Verplicht voor PostgreSQL MCP
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
```

**Waar haal je deze keys?**
- **Sentry**: https://sentry.io/settings/account/api/auth-tokens/
- **Brave Search**: https://brave.com/search/api/ (optioneel)
- **Database URL**: Jouw lokale of remote PostgreSQL database

### Stap 3: Update Config met Je Keys

Open `~/.config/claude-code/config.json` (of `%APPDATA%\claude-code\config.json` op Windows) en vervang de placeholder waarden:

```json
{
  "mcpServers": {
    "sentry": {
      "env": {
        "SENTRY_DSN": "https://jouw-echte-key@o123456.ingest.sentry.io/123456",
        "SENTRY_ORG": "jouw-org-naam",
        "SENTRY_PROJECT": "jouw-project-naam",
        "SENTRY_AUTH_TOKEN": "jouw-auth-token"
      }
    }
  }
}
```

### Stap 4: Herstart Claude Code

De MCP's worden **automatisch gedownload** bij de eerste keer gebruiken via `npx -y`. Geen handmatige installatie nodig!

1. Sluit Claude Code volledig af
2. Start Claude Code opnieuw op
3. De MCP's worden bij eerste gebruik automatisch gedownload

### Stap 5: Verificatie

Test of alles werkt door in Claude Code te vragen:

```
"List alle beschikbare MCP tools"
```

Je zou tools moeten zien zoals:
- `mcp__sentry__*` (als Sentry geconfigureerd is)
- `mcp__playwright__*` (altijd beschikbaar)
- `mcp__sequential_thinking__*` (altijd beschikbaar)
- `mcp__memory__*` (altijd beschikbaar)
- `mcp__postgres__*` (als DATABASE_URL is ingesteld)
- `mcp__git__*` (altijd beschikbaar)
- `mcp__docker__*` (altijd beschikbaar)

### Welke MCP's zijn Verplicht?

**Minimaal vereist voor dit AI Software Team:**
- ✅ **sequential-thinking**: Automatisch gedownload, geen setup nodig
- ✅ **memory**: Automatisch gedownload, geen setup nodig
- ✅ **playwright**: Automatisch gedownload, geen setup nodig

**Optioneel maar aanbevolen:**
- ⚠️ **sentry**: Vereist account en API keys (zie stap 2)
- ⚠️ **postgres**: Vereist database (als je database features gebruikt)
- ⚠️ **brave-search**: Vereist API key (Claude heeft ingebouwde WebSearch)

**Altijd beschikbaar zonder setup:**
- ✅ **git**: Automatisch gedownload
- ✅ **docker**: Automatisch gedownload

### Troubleshooting

**❌ "MCP not found" error**
```bash
# Oplossing: Controleer of npx werkt
npx --version

# Als npx niet werkt, installeer Node.js:
# https://nodejs.org/
```

**❌ "Sentry authentication failed"**
```bash
# Oplossing: Test je Sentry token
curl -H "Authorization: Bearer YOUR_TOKEN" \
     https://sentry.io/api/0/organizations/YOUR_ORG/

# Als dit werkt, check je config.json syntax (moet valid JSON zijn)
```

**❌ "Database connection error"**
```bash
# Oplossing: Test je database connectie
psql "$DATABASE_URL" -c "SELECT 1"

# Als dit werkt maar MCP niet, check DATABASE_URL format in config.json
```

**❌ "Playwright browsers not installed"**
```bash
# Oplossing: Installeer browsers handmatig
npx playwright install
```

### Snel Start Zonder Sentry

Als je **alleen wilt testen** zonder Sentry/database setup:

1. Kopieer alleen deze basis config naar `~/.config/claude-code/config.json`:

```json
{
  "mcpServers": {
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
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git"]
    }
  }
}
```

2. Herstart Claude Code
3. Begin met ontwikkelen! 🚀

Deze 4 MCP's zijn genoeg om te beginnen. Sentry en database kun je later toevoegen.

---

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
