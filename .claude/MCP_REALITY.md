# MCP Reality Check: Hoe MCP's ECHT Werken

Dit document legt uit hoe Model Context Protocol (MCP) servers **werkelijk** werken in Claude Code, inclusief de beperkingen en alternatieven.

---

## 🔴 De Harde Waarheid

### Wat de Documentatie Claimt

```
❌ "Agents hebben MCP toegang voor Sentry, PostgreSQL, Playwright, etc."
❌ "backend-developer gebruikt Sentry MCP voor error tracking"
❌ "qa-software-tester gebruikt Playwright MCP voor E2E testing"
```

### De Realiteit

```
✅ Agents hebben GEEN MCP toegang
✅ Agents gebruiken CLI tools via Bash
✅ Alleen main conversation + skills kunnen MCP's gebruiken
```

---

## 🏗️ MCP Architectuur in Claude Code

### Waar MCP's Beschikbaar Zijn

```
┌─────────────────────────────────────────────┐
│  Main Conversation (Claude met jou)         │
│  ✅ Heeft MCP toegang (als geconfigureerd)  │
│                                              │
│  ├─ Skills (inline context)                 │
│  │  ✅ Kan MCP's gebruiken                  │
│  │  └─ Inherit van main conversation        │
│  │                                           │
│  ├─ Agents (via Task tool)                  │
│  │  ❌ GEEN MCP toegang                     │
│  │  └─ Krijgen alleen standaard tools       │
│  │                                           │
│  └─ Hooks (externe scripts)                 │
│     ❌ GEEN MCP toegang                     │
│     └─ Draaien buiten Claude context        │
└─────────────────────────────────────────────┘
```

### Test Bewijs

We hebben dit getest met de backend-developer agent:

```
Query: "Test if you have Memory MCP and Sequential Thinking MCP"

Result:
  ❌ Memory MCP: Not available
  ❌ Sequential Thinking MCP: Not available
  ✅ Standard tools: Read, Write, Edit, Bash, Grep, Glob, WebFetch, WebSearch
```

---

## 🛠️ Tool Vergelijkingstabel

| Component | MCP Toegang | Tools | Data Storage |
|-----------|-------------|-------|--------------|
| **Main Conversation** | ✅ Ja (indien config) | Standaard + MCP | MCP of files |
| **Skills** | ✅ Via main | Inherit van main | Via main |
| **Agents** | ❌ Nee | Standaard + Bash | Files only |
| **Hooks** | ❌ Nee | Bash CLI | Files only |

---

## 💡 CLI Alternatieven

Agents gebruiken CLI equivalenten voor alle MCP functionaliteit:

### Sentry MCP → sentry-cli

**MCP Manier (niet beschikbaar voor agents):**
```typescript
// Dit werkt NIET in agents
mcp__sentry__query_issues({
  project: "my-app",
  query: "is:unresolved"
})
```

**CLI Manier (werkt WEL in agents):**
```bash
# Via Bash tool
sentry-cli issues list --project=my-app --status=unresolved
```

### PostgreSQL MCP → psql

**MCP Manier (niet beschikbaar voor agents):**
```typescript
// Dit werkt NIET in agents
mcp__postgres__query({
  query: "SELECT * FROM users WHERE active = true"
})
```

**CLI Manier (werkt WEL in agents):**
```bash
# Via Bash tool
psql $DATABASE_URL -c "SELECT * FROM users WHERE active = true"
```

### Playwright MCP → npx playwright

**MCP Manier (niet beschikbaar voor agents):**
```typescript
// Dit werkt NIET in agents
mcp__playwright__navigate({ url: "http://localhost:3000" })
mcp__playwright__click({ selector: "button.login" })
mcp__playwright__screenshot({ path: "login.png" })
```

**CLI Manier (werkt WEL in agents):**
```bash
# Via Bash tool
npx playwright test tests/login.spec.ts
npx playwright screenshot http://localhost:3000 login.png
```

### Memory MCP → Files

**MCP Manier (niet beschikbaar voor agents):**
```typescript
// Dit werkt NIET in agents
mcp__memory__create_entity({
  name: "project_context",
  content: "E-commerce platform, Stripe payments"
})
```

**File Manier (werkt WEL in agents):**
```bash
# Via Write tool
echo "E-commerce platform, Stripe payments" > .claude/context/project.txt
```

### Sequential Thinking MCP → Native Reasoning

**MCP Manier (niet beschikbaar voor agents):**
```typescript
// Dit werkt NIET in agents
mcp__sequential_thinking__create_session({
  task: "Analyze authentication architecture"
})
```

**Native Manier (werkt WEL in agents):**
```markdown
# Agent gebruikt gewoon zijn native reasoning
# Claude's reasoning abilities zijn ingebouwd
# Geen MCP nodig voor thinking
```

---

## ✅ Hoe MCP's WEL Te Gebruiken

### Optie 1: Skills in Main Conversation (AANBEVOLEN)

**Setup:**
```markdown
# In .claude/skills/my-skill/SKILL.md
---
name: my-skill
description: Skill that uses MCP tools
---

When this skill is activated, use these MCP tools:
- mcp__sentry__query_issues for error monitoring
- mcp__playwright__navigate for E2E testing
```

**Gebruik:**
```
User: "Check production errors"
→ Claude (main) activates sentry-monitor skill
→ Skill uses mcp__sentry__query_issues ✅
→ MCP call succeeds (if configured)
```

### Optie 2: Direct in Main Conversation

**Gebruik:**
```
User: "Query Sentry for recent errors"
→ Claude (main) directly uses mcp__sentry__query_issues ✅
→ MCP call succeeds (if configured)
```

### Optie 3: Agents met CLI Fallback (CURRENT)

**Gebruik:**
```
User: "Launch backend-developer to add error tracking"
→ backend-developer agent (no MCP access)
→ Agent uses: bash sentry-cli ✅
→ CLI equivalent works
```

---

## 🎯 Beste Praktijken

### 1. Voor E2E Testing

**❌ NIET:**
```
"Launch qa-software-tester agent to run E2E tests"
→ Agent heeft geen Playwright MCP
→ Agent moet npx playwright gebruiken
```

**✅ WEL:**
```
"Use e2e-tester skill to run E2E tests"
→ Skill draait in main conversation
→ Kan Playwright MCP gebruiken (sneller!)
→ Fallback naar npx playwright als MCP ontbreekt
```

### 2. Voor Error Monitoring

**❌ NIET:**
```
"Launch backend-developer to add Sentry integration"
→ Agent gebruikt sentry-cli (CLI)
→ Werkt, maar niet wat gedocumenteerd staat
```

**✅ WEL:**
```
"Use sentry-monitor skill to check production errors"
→ Skill gebruikt mcp__sentry__* (native MCP)
→ Sneller en rijkere data
→ Fallback naar sentry-cli als MCP ontbreekt
```

### 3. Voor Database Queries

**❌ NIET:**
```
"Agent: query database with PostgreSQL MCP"
→ Agent heeft geen PostgreSQL MCP
→ Agent moet psql CLI gebruiken
```

**✅ WEL:**
```
"Agent: query database with psql CLI"
→ Realistische verwachting
→ psql $DATABASE_URL -c "SELECT..."
→ Werkt betrouwbaar
```

---

## 🔧 MCP Setup Voor Skills

Als je MCP's wilt gebruiken in skills (main conversation):

### Stap 1: Configureer MCP's

**macOS/Linux:**
```bash
mkdir -p ~/.config/claude-code
cat > ~/.config/claude-code/config.json << 'EOF'
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-playwright"]
    },
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
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
EOF
```

### Stap 2: Restart Claude Code

```bash
# MCP's worden automatisch gedownload bij eerste gebruik
# Geen handmatige installatie nodig (via npx -y)
```

### Stap 3: Verificatie

```
User in Claude Code: "Do I have access to mcp__playwright__ tools?"
→ Als JA: ✅ Skills kunnen MCP's gebruiken
→ Als NEE: ⚠️ Skills gebruiken CLI fallbacks
```

### Stap 4: Gebruik Skills (niet agents!)

```
✅ "Use e2e-tester skill" → Kan MCP gebruiken
✅ "Use sentry-monitor skill" → Kan MCP gebruiken
❌ "Launch qa-software-tester agent" → Geen MCP toegang
```

---

## 📊 Prestatie Vergelijking

### E2E Testing

| Methode | Speed | Data Richness | Agent Support |
|---------|-------|---------------|---------------|
| Playwright MCP | ⚡⚡⚡ Zeer snel | 🎯🎯🎯 Rijke data | ❌ Nee |
| npx playwright | ⚡⚡ Matig | 🎯🎯 Basis data | ✅ Ja |

### Error Monitoring

| Methode | Speed | Data Richness | Agent Support |
|---------|-------|---------------|---------------|
| Sentry MCP | ⚡⚡⚡ Zeer snel | 🎯🎯🎯 Rijke data | ❌ Nee |
| sentry-cli | ⚡⚡ Matig | 🎯🎯 Basis data | ✅ Ja |

### Database Queries

| Methode | Speed | Data Richness | Agent Support |
|---------|-------|---------------|---------------|
| PostgreSQL MCP | ⚡⚡⚡ Zeer snel | 🎯🎯🎯 Structured | ❌ Nee |
| psql CLI | ⚡⚡ Matig | 🎯 Plain text | ✅ Ja |

---

## 🎭 Agent vs Skill Beslissingsmatrix

### Gebruik Agents Wanneer:

✅ Je een multi-step autonome taak hebt
✅ CLI tools voldoende zijn
✅ Je role-based specialisatie wilt
✅ Je team coordinatie patroon wilt

**Voorbeeld:**
```
"Launch backend-developer to implement auth API"
→ Agent gebruikt Bash tools
→ Volledig autonoom
→ Rapporteert terug wanneer klaar
```

### Gebruik Skills Wanneer:

✅ Je MCP toegang nodig hebt
✅ Je in-context guidance wilt
✅ Je snelle MCP operaties wilt
✅ Je rijke data uit MCP's wilt

**Voorbeeld:**
```
"Use sentry-monitor skill to check errors"
→ Skill draait in main conversation
→ Gebruikt mcp__sentry__* tools
→ Snelle, rijke error data
```

---

## 🚫 Veelgemaakte Fouten

### Fout 1: MCP's Verwachten in Agents

```markdown
❌ VERKEERD:
"Launch backend-developer agent, let it use Sentry MCP"

✅ CORRECT:
"Launch backend-developer agent, it will use sentry-cli via Bash"
```

### Fout 2: Skills Gebruiken via Agents

```markdown
❌ VERKEERD:
"Launch agent, then use skill with MCP inside agent"

✅ CORRECT:
"Use skill in main conversation (has MCP access)"
```

### Fout 3: Hooks met MCP's

```markdown
❌ VERKEERD:
"Hook will use Playwright MCP to run tests"

✅ CORRECT:
"Hook will use npx playwright CLI command"
```

---

## 📖 Samenvatting

### De Kern

```
┌────────────────────────────────────────┐
│  MCP ACCESS HIERARCHY                  │
├────────────────────────────────────────┤
│  1. Main Conversation    ✅ MCP Toegang│
│  2. Skills (in main)     ✅ MCP Toegang│
│  3. Agents               ❌ Geen MCP   │
│  4. Hooks                ❌ Geen MCP   │
└────────────────────────────────────────┘
```

### Praktische Gevolgen

**Voor E-Commerce Platform Voorbeeld:**
- team-coordinator agent: Gebruikt Bash, geen MCP
- backend-developer agent: Gebruikt sentry-cli, geen Sentry MCP
- frontend-developer agent: Gebruikt npx playwright, geen Playwright MCP
- qa-software-tester agent: Gebruikt CLI tools, geen MCP's

**Het systeem werkt nog steeds, maar:**
- Langzamer dan met echte MCP's
- Minder rijke data uit CLI tools
- Functioneel equivalent
- Niet wat origineel gedocumenteerd stond

### Voor Echte MCP Integratie

**Use skills in main conversation:**
```
✅ "Use sentry-monitor skill"      → Heeft MCP toegang
✅ "Use e2e-tester skill"          → Heeft MCP toegang
❌ "Launch qa-software-tester"     → Geen MCP toegang
❌ "Launch backend-developer"      → Geen MCP toegang
```

---

## 🔗 Gerelateerde Documenten

- `AI_SOFTWARE_TEAM.md` - Gecorrigeerde agent documentatie
- `ARCHITECTURE_V2.md` - Skills-first architectuur
- `MCP_SETUP.md` - MCP configuratie guide
- `.claude/skills/*/SKILL.md` - Skill definities met MCP support

---

**Laatste Update**: Na ontdekking dat agents geen MCP toegang hebben (getest en bewezen)

**Status**: ✅ Accurate representatie van hoe het systeem ECHT werkt
