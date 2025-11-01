# MCP Configuratie Verificatie

**Datum:** 2025-11-01
**Onderzocht:** Werkbaarheid van MCP servers in `.claude/mcp-config.json`

## Samenvatting

De MCP configuratie in dit project bevat **4 van de 8 servers met incorrecte package namen**. Dit betekent dat de configuratie **NIET werkt** zoals momenteel geconfigureerd.

---

## Gedetailleerde Bevindingen

### ✅ CORRECT GECONFIGUREERD (4/8)

#### 1. Memory Server
- **Config:** `@modelcontextprotocol/server-memory`
- **Status:** ✅ Correct
- **NPM:** https://www.npmjs.com/package/@modelcontextprotocol/server-memory
- **Versie:** 2025.9.25
- **Downloads:** 72.270/week
- **Werkt:** Ja

#### 2. Sequential Thinking Server
- **Config:** `@modelcontextprotocol/server-sequential-thinking`
- **Status:** ✅ Correct
- **NPM:** https://www.npmjs.com/package/@modelcontextprotocol/server-sequential-thinking
- **Versie:** 2025.7.1
- **Downloads:** 72.270/week
- **Werkt:** Ja

#### 3. PostgreSQL Server
- **Config:** `@modelcontextprotocol/server-postgres`
- **Status:** ⚠️ **DEPRECATED sinds juli 2025**
- **NPM:** https://www.npmjs.com/package/@modelcontextprotocol/server-postgres
- **Versie:** 0.6.2 (1 jaar oud)
- **Downloads:** 19.911/week
- **Problemen:**
  - Package is gedepreceerd
  - **SQL injection vulnerability** (CVE gevonden door Datadog Security Labs)
  - Vervangen door fork: `@zeddotdev/postgres-context-server` v0.1.4
- **Aanbeveling:** Vervang door `@zeddotdev/postgres-context-server`

#### 4. Brave Search Server
- **Config:** `@modelcontextprotocol/server-brave-search`
- **Status:** ⚠️ **DEPRECATED**
- **NPM:** https://www.npmjs.com/package/@modelcontextprotocol/server-brave-search
- **Versie:** 0.6.2
- **Downloads:** 15.707/week
- **Problemen:**
  - Package wordt niet meer ondersteund
  - Brave plant nieuwe package naam (nog niet beschikbaar)
- **Aanbeveling:** Overweeg built-in WebSearch tool van Claude Code

---

### ❌ INCORRECT GECONFIGUREERD (4/8)

#### 5. Sentry Server
- **Config gebruikt:** `@modelcontextprotocol/server-sentry` ❌
- **Correct package:** `mcp-server-sentry` (Python/PyPI)
- **Probleem:** De NPM package `@modelcontextprotocol/server-sentry` bestaat NIET
- **Installatie:**
  ```bash
  # Python via uvx (aanbevolen)
  uvx mcp-server-sentry --auth-token YOUR_TOKEN

  # Of via pip
  pip install mcp-server-sentry
  ```
- **Configuratie fix:**
  ```json
  "sentry": {
    "command": "uvx",
    "args": ["mcp-server-sentry"],
    "env": {
      "SENTRY_AUTH_TOKEN": "${SENTRY_AUTH_TOKEN}"
    }
  }
  ```
- **Bronnen:**
  - PyPI: https://pypi.org/project/mcp-server-sentry/
  - GitHub: https://github.com/modelcontextprotocol/servers/tree/main/src/sentry

#### 6. Playwright Server
- **Config gebruikt:** `@modelcontextprotocol/server-playwright` ❌
- **Correct package:** `@playwright/mcp` (Microsoft)
- **Probleem:** De package `@modelcontextprotocol/server-playwright` bestaat NIET
- **Installatie:**
  ```bash
  npx @playwright/mcp@latest
  ```
- **Configuratie fix:**
  ```json
  "playwright": {
    "command": "npx",
    "args": ["-y", "@playwright/mcp"]
  }
  ```
- **Bronnen:**
  - NPM: https://www.npmjs.com/package/@playwright/mcp
  - GitHub: https://github.com/microsoft/playwright-mcp

#### 7. Git Server
- **Config gebruikt:** `@modelcontextprotocol/server-git` ❌
- **Correct package:** `mcp-server-git` (Python/PyPI)
- **Probleem:** NPM package bestaat niet (GitHub Issue #2089 bevestigt E404 error)
- **Installatie:**
  ```bash
  # Python via uvx (aanbevolen)
  uvx mcp-server-git --repository /path/to/repo

  # Of via pip
  pip install mcp-server-git
  ```
- **Configuratie fix:**
  ```json
  "git": {
    "command": "uvx",
    "args": ["mcp-server-git", "--repository", "${PWD}"]
  }
  ```
- **Bronnen:**
  - PyPI: https://pypi.org/project/mcp-server-git/
  - GitHub: https://github.com/modelcontextprotocol/servers/tree/main/src/git

#### 8. Docker Server
- **Config gebruikt:** `@modelcontextprotocol/server-docker` ❌
- **Correct package:** BESTAAT NIET als officieel package
- **Probleem:** Er is geen officiële `@modelcontextprotocol/server-docker`
- **Alternatieven:**
  - Community package: `docker-mcp` door QuantGeekDev
  - GitHub: https://github.com/QuantGeekDev/docker-mcp
- **Installatie (community):**
  ```bash
  npx docker-mcp
  ```
- **Configuratie fix:**
  ```json
  "docker": {
    "command": "npx",
    "args": ["-y", "docker-mcp"]
  }
  ```

---

## Bekende Bugs en Problemen

### 🐛 Bug #2731: npx -y servers falen na update
- **Issue:** https://github.com/anthropics/claude-code/issues/2731
- **Probleem:** Alle "npx -y" MCP servers falen na upgrade naar Claude Code CLI 1.0.37
- **Error:** `"MCP error -32000: Connection closed"`
- **Workaround:** Python servers (uvx, python3) werken nog wel
- **Status:** Gerapporteerd 29 juni 2025, gemarkeerd als "duplicate"

### 🐛 Bug #3825: Windows npx -y probleem
- **Issue:** https://github.com/anthropics/claude-code/issues/3825
- **Probleem:** "error: unknown option '-y received" op Windows
- **Platform:** Native Windows (WSL2 werkt wel)

### 🐛 Bug #3369: MCP werkt niet op Windows
- **Issue:** https://github.com/anthropics/claude-code/issues/3369
- **Probleem:** MCP functionaliteit werkt niet op native Windows
- **Workaround:** Gebruik WSL2

---

## Officiële MCP Servers Lijst (2025)

Van het officiële GitHub repository: https://github.com/modelcontextprotocol/servers

### Reference Servers (officieel door Anthropic):
1. ✅ **Everything** - Test server met prompts, resources, tools
2. ✅ **Fetch** - Web content fetching en conversie
3. ✅ **Filesystem** - Veilige file operaties (`@modelcontextprotocol/server-filesystem`)
4. ⚠️ **Git** - Git repository operaties (`mcp-server-git` - Python)
5. ✅ **Memory** - Knowledge graph persistente geheugen (`@modelcontextprotocol/server-memory`)
6. ✅ **Sequential Thinking** - Probleem-oplossing (`@modelcontextprotocol/server-sequential-thinking`)
7. ✅ **Time** - Tijd en timezone conversies

### Deprecated/Archived:
- ❌ **PostgreSQL** - Gedepreceerd, heeft security issues
- ❌ **Brave Search** - Niet meer ondersteund
- ⚠️ **Sentry** - Python versie superseded door Remote-MCP versie

---

## Aanbevelingen

### 1. Voor Directe Werking
Als je wilt dat de MCP servers nu werken, gebruik dan deze configuratie:

```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "@playwright/mcp"]
    },
    "sentry": {
      "command": "uvx",
      "args": ["mcp-server-sentry"],
      "env": {
        "SENTRY_AUTH_TOKEN": "${SENTRY_AUTH_TOKEN}"
      }
    },
    "git": {
      "command": "uvx",
      "args": ["mcp-server-git", "--repository", "${PWD}"]
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@zeddotdev/postgres-context-server", "${DATABASE_URL}"]
    }
  }
}
```

**Let op:** Voor `uvx` moet je `uv` geïnstalleerd hebben:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 2. Voor Productie
Overweeg alleen deze bewezen, stabiele servers:
- ✅ `@modelcontextprotocol/server-memory`
- ✅ `@modelcontextprotocol/server-sequential-thinking`
- ✅ `@playwright/mcp` (Microsoft)
- ✅ Claude Code's built-in tools (WebSearch, Bash, Grep, etc.)

### 3. Alternatieve Aanpak
In plaats van externe MCP servers te gebruiken, kun je veel functionaliteit krijgen via:
- **Claude Code Skills** - Herbruikbare prompts en workflows
- **Claude Code Agents** - Multi-agent orchestratie
- **Built-in tools** - WebSearch, Bash, Read, Edit, Write, etc.

De huidige `.claude/skills/*` en `.claude/agent/*` setup in dit project is mogelijk effectiever dan MCP servers.

---

## Verificatie Stappen

Om te testen of een MCP server werkt:

### 1. Test NPM Package
```bash
# Check of package bestaat
npm view @modelcontextprotocol/server-memory

# Test uitvoeren
npx -y @modelcontextprotocol/server-memory
```

### 2. Test Python Package
```bash
# Check of package bestaat
pip search mcp-server-sentry

# Test uitvoeren
uvx mcp-server-sentry --help
```

### 3. Test in Claude Code
```bash
# Voeg toe via CLI
claude mcp add memory -- npx -y @modelcontextprotocol/server-memory

# Lijst alle MCP servers
claude mcp list

# Verwijder server
claude mcp remove memory
```

---

## Bronnen

### Officiële Documentatie
- MCP Documentatie: https://modelcontextprotocol.io/
- Claude Code MCP Docs: https://docs.claude.com/en/docs/claude-code/mcp
- GitHub Servers: https://github.com/modelcontextprotocol/servers
- Microsoft MCP: https://github.com/microsoft/mcp

### Community Resources
- ClaudeLog MCP Setup: https://claudelog.com/faqs/how-to-setup-claude-code-mcp-servers/
- Awesome MCP Servers: https://github.com/punkpeye/awesome-mcp-servers
- MCP Directory: https://www.openmcpdirectory.com/

### Bug Reports
- Issue #2731: npx servers falen: https://github.com/anthropics/claude-code/issues/2731
- Issue #3825: Windows -y flag: https://github.com/anthropics/claude-code/issues/3825
- Issue #3369: Windows MCP issues: https://github.com/anthropics/claude-code/issues/3369

---

## Conclusie

**Status van huidige configuratie: ❌ NIET WERKEND**

- **4 van 8 servers** hebben incorrecte package namen
- **2 van 8 servers** zijn deprecated met security/support issues
- **Totaal werkend:** 2 van 8 servers (25%)

**Aanbeveling:**
1. ✅ Gebruik de gecorrigeerde configuratie hierboven
2. ✅ Installeer `uv` voor Python MCP servers
3. ⚠️ Let op Bug #2731 bij gebruik van Claude Code 1.0.37+
4. ✅ Overweeg alleen stabiele servers te gebruiken
5. ✅ Test elke server individueel voor productie gebruik

**Alternatief:**
De huidige skill-based en agent-based setup (zonder MCP servers) in dit project werkt mogelijk beter dan het toevoegen van onstabiele MCP servers. De built-in Claude Code tools zijn zeer capabel.
