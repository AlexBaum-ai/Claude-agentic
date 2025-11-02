# MCP Test Prompt voor Agents

## Test 1: Test met backend-developer agent

Kopieer deze prompt en gebruik Task tool om backend-developer agent te starten:

```
Test alle beschikbare MCP tools en rapporteer welke werken.

TAAK: MCP Availability Test

Probeer de volgende MCP tools te gebruiken en rapporteer voor elk:
- ✅ Werkt
- ❌ Niet beschikbaar
- ⚠️ Error

1. Memory MCP:
   Probeer: mcp__memory__read_graph
   Expected: Leest de knowledge graph (kan leeg zijn)

2. Sequential Thinking MCP:
   Probeer: mcp__sequential-thinking__sequentialthinking
   Test: Denk door een simpel probleem (bijv. "wat is 2+2")

3. Brave Search MCP:
   Probeer: mcp__brave_search__brave_web_search
   Query: "nodejs express best practices"
   Note: Vereist BRAVE_API_KEY environment variable

4. Git MCP:
   Probeer: List available git tools
   Check: Zijn er mcp__git__* tools beschikbaar?

5. Postgres MCP:
   Probeer: List available postgres tools
   Check: Zijn er mcp__postgres__* tools beschikbaar?
   Note: Vereist DATABASE_URL environment variable

6. Sentry MCP:
   Probeer: List available sentry tools
   Check: Zijn er mcp__sentry__* tools beschikbaar?
   Note: Vereist SENTRY_* environment variables

7. Docker MCP:
   Probeer: List available docker tools
   Check: Zijn er mcp__docker__* tools beschikbaar?

8. Playwright MCP:
   Probeer: List available playwright tools
   Check: Zijn er mcp__playwright__* tools beschikbaar?

RAPPORTEER:
- Voor elke MCP: status (✅/❌/⚠️)
- Welke tools je ziet
- Eventuele errors
- Of je de tool succesvol kon aanroepen
```

---

## Test 2: Test ZONDER agent (in main conversation)

Kopieer deze prompt in de main Claude conversation (NIET via Task tool):

```
Test alle beschikbare MCP tools in de main conversation.

Probeer voor elke MCP:
1. mcp__memory__read_graph
2. mcp__sequential-thinking__sequentialthinking (met een simpel probleem)
3. mcp__brave_search__brave_web_search (query: "test")

Rapporteer:
- Welke tools beschikbaar zijn
- Welke succesvol werken
- Verschil tussen main conversation en agent access
```

---

## Test 3: Vergelijk Main vs Agent

Gebruik dit script om beide te testen:

**Stap 1:** Test in main conversation (zie Test 2)
**Stap 2:** Test via agent (zie Test 1)
**Stap 3:** Vergelijk resultaten

Expected outcome:
- Main conversation: Heeft toegang tot MCP tools (afhankelijk van settings)
- Agent (backend-developer): Heeft toegang tot MCP tools die genoemd staan in de agent .md file

---

## Verwachte Output

### Als MCPs werken:
```
✅ Memory MCP: Working
   Tools: mcp__memory__read_graph, mcp__memory__create_entities, etc.
   Test: Successfully read knowledge graph (0 entities)

✅ Sequential Thinking: Working
   Tools: mcp__sequential-thinking__sequentialthinking
   Test: Successfully used for reasoning

⚠️ Brave Search: API key not set
   Tools visible but cannot execute without BRAVE_API_KEY
```

### Als MCPs NIET werken in agent:
```
❌ Memory MCP: Not available in agent context
   Error: Tool permission request failed

❌ Sequential Thinking: Not available
   No mcp__sequential-thinking__* tools found
```

---

## Hoe Te Gebruiken

### Optie A: Via Task Tool (test in agent)
```
/Use Task tool/
subagent_type: backend-developer
prompt: [Copy Test 1 prompt hierboven]
```

### Optie B: Direct in conversation (test main)
```
[Copy Test 2 prompt hierboven]
```

### Optie C: Test specifieke agent
```
/Use Task tool/
subagent_type: team-coordinator
prompt: Test alle MCP tools die je beschikbaar hebt en rapporteer welke werken
```

---

## Troubleshooting

Als MCPs niet werken:

1. **Check .claude/settings.json:**
   ```json
   {
     "enableAllProjectMcpServers": true
   }
   ```

2. **Check environment variables:**
   ```bash
   echo $BRAVE_API_KEY
   echo $DATABASE_URL
   echo $SENTRY_DSN
   ```

3. **Check agent .md file:**
   Agents moeten expliciet vermelden welke MCPs beschikbaar zijn.
   Zie: `.claude/agents/backend-developer.md` (regel 150-156)

4. **Restart Claude Code:**
   Soms moet Claude Code opnieuw gestart worden na MCP config changes
