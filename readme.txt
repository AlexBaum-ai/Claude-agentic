# Claude-Agentic Infrastructure
Een complete Claude Code infrastructuur met agents, skills, hooks en MCP integraties voor professionele software ontwikkeling.

===============================================================================
OVERZICHT
===============================================================================

Dit project biedt een productie-klare Claude Code setup met:

• 15+ Gespecialiseerde Agents - Autonome sub-agents voor complexe taken
• 17+ Auto-Activerende Skills - Context-aware kennisbanken
• Custom Slash Commands - Workflow automatisering
• Intelligente Hooks - Auto-activatie en validatie
• 8 MCP Server Integraties - Sentry, Playwright, Postgres, Git, Docker, etc.

Deze infrastructuur transformeert Claude Code van een basis CLI tool naar een
volledig geïntegreerde development agent met domein expertise en automatische
context-aware hulp.

===============================================================================
KERNFUNCTIES
===============================================================================

1. AGENTS - Autonome Complexe Taken
   --------------------------------
   Agents zijn standalone Claude instances voor specifieke complexe taken:

   • backend-developer - Node.js/Express/TypeScript development
   • frontend-developer - React/TypeScript/MUI development
   • code-architecture-reviewer - Architectuur review en validatie
   • code-refactor-master - Grootschalige refactoring
   • documentation-architect - Uitgebreide documentatie creatie
   • qa-software-tester - Test validatie en kwaliteitscontrole
   • sprint-orchestrator - Sprint planning en coordinatie
   • web-research-specialist - Technische research online
   • auto-error-resolver - Automatische TypeScript error fixes
   • En meer...

2. SKILLS - Auto-Activerende Kennisbanken
   ---------------------------------------
   Skills laden automatisch gebaseerd op context en bevatten best practices:

   • backend-dev-guidelines - Layered architecture, Prisma, Sentry, Zod
   • frontend-dev-guidelines - React Suspense, TanStack Query, MUI v7
   • skill-developer - Meta-skill voor skill creatie
   • error-tracking - Sentry v8 integratie patronen
   • route-tester - JWT cookie auth testing patterns
   • test-validator - Test uitvoering en validatie
   • task-tracker - Sprint task status synchronisatie
   • En 10+ meer specialized skills...

3. HOOKS - Intelligente Automatisering
   ------------------------------------
   • skill-activation-prompt - Auto-suggest relevante skills
   • post-tool-use-tracker - Track file wijzigingen voor context
   • error-handling-reminder - Valideer error tracking
   • tsc-check - TypeScript compilatie validatie
   • trigger-build-resolver - Auto-launch error resolver bij failures

4. SLASH COMMANDS
   --------------
   • /dev-docs - Creëer strategische plannen met task breakdown
   • /dev-docs-update - Update dev documentatie voor context compaction
   • /route-research-for-testing - Map routes en launch tests

5. MCP SERVER INTEGRATIES
   -----------------------
   • Sentry - Error tracking en production monitoring
   • Playwright - E2E testing en visual regression
   • Sequential Thinking - Enhanced reasoning voor complexe problemen
   • Memory - Persistent geheugen over sessies
   • Brave Search - Web research voor documentatie en oplossingen
   • Postgres - Directe database toegang en schema inspectie
   • Git - Advanced git operaties en history analysis
   • Docker - Container management en health monitoring

===============================================================================
WORKFLOW VOORBEELDEN
===============================================================================

WORKFLOW 1: Feature Development met Skill Guidance
---------------------------------------------------
Scenario: Je bouwt een nieuwe authenticated API route

1. Begin met development:
   $ Je opent: src/api/routes/user-profile.ts

2. Auto-activatie gebeurt:
   → Hook detecteert je werkt in backend code
   → Skill 'backend-dev-guidelines' activeert automatisch
   → Je krijgt inline guidance over:
     - Layered architecture (routes → controllers → services → repos)
     - BaseController pattern
     - Prisma database patterns
     - Sentry error tracking
     - Zod validation

3. Ontwikkel met confidence:
   - Follow de patterns uit de skill
   - Code wordt consistent met je codebase
   - Best practices zijn altijd beschikbaar

4. Test je route:
   → Gebruik skill 'route-tester' voor JWT cookie auth testing
   → Of gebruik /route-research-for-testing command

WORKFLOW 2: Autonomous Agent Development
-----------------------------------------
Scenario: Je wilt een complete refactor plannen en uitvoeren

1. Launch specialized agent:
   $ "Use the refactor-planner agent to analyze my auth system
      and create a refactoring strategy"

2. Agent werkt autonoom:
   → Analyseert huidige architectuur
   → Identificeert code smells en improvements
   → Creëert gedetailleerd refactor plan
   → Geeft stap-voor-stap implementatie guide

3. Execute met tweede agent:
   $ "Use the code-refactor-master agent to execute the plan"

   → Agent breekt grote files op
   → Updatet alle import paths
   → Behoudt functionaliteit
   → Test tijdens refactor

4. Review met derde agent:
   $ "Use the code-architecture-reviewer to validate the refactor"

   → Verificeert architectural consistency
   → Checkt best practices
   → Geeft improvement suggesties

WORKFLOW 3: Error Resolution met MCP Integration
-------------------------------------------------
Scenario: Production errors in Sentry

1. Monitor met Sentry MCP:
   $ "Check Sentry for recent errors in the authentication service"

   → Sentry MCP server queries errors
   → Filter op service en tijd
   → Analyse error patterns

2. Research solution:
   → Brave Search MCP voor documentatie
   → Sequential Thinking MCP voor complexe debugging
   → Memory MCP om eerdere oplossingen te herinneren

3. Fix en verify:
   → backend-dev-guidelines skill voor correcte patterns
   → error-tracking skill voor Sentry integratie
   → test-validator skill voor test uitvoering

4. Deploy en monitor:
   → Git MCP voor commit en push
   → Docker MCP voor service restart
   → Sentry MCP voor error rate monitoring

WORKFLOW 4: Sprint Planning en Execution
-----------------------------------------
Scenario: Je start een nieuwe sprint

1. Plan met command:
   $ /dev-docs "implement user notification system"

   → Creëert structured plan in dev/active/
   → Breakdown in phases en tasks
   → Includes acceptance criteria
   → Timeline estimates

2. Track met skills:
   → sprint-reader skill leest task JSON
   → task-tracker skill update status
   → todo-sync skill synchroniseert met TodoWrite

3. Develop met agents:
   → backend-developer voor API endpoints
   → frontend-developer voor UI components
   → qa-software-tester voor quality checks

4. Review en document:
   → documentation-architect voor feature docs
   → code-architecture-reviewer voor final review

WORKFLOW 5: Database Operations met Postgres MCP
-------------------------------------------------
Scenario: Je moet database schema wijzigen

1. Inspect huidige state:
   $ "Use Postgres MCP to show me the current user table schema"

   → Direct PostgreSQL toegang
   → Schema inspection
   → Bestaande constraints en indexes

2. Plan migration:
   → backend-dev-guidelines voor Prisma patterns
   → Check impact op bestaande queries
   → Plan rollback strategy

3. Execute met confidence:
   → Test eerst in development
   → Postgres MCP voor data validation
   → Monitor met Sentry MCP

WORKFLOW 6: E2E Testing Workflow
---------------------------------
Scenario: Feature development is klaar, nu testen

1. Auto test met Playwright MCP:
   $ "Use Playwright to test the new checkout flow"

   → Navigate door user journey
   → Take screenshots at each step
   → Validate form interactions
   → Check error states

2. Validate met skill:
   → test-validator skill runs automated tests
   → Checkt test coverage
   → Verifieert acceptance criteria

3. Visual regression:
   → Playwright screenshots
   → Compare met baseline
   → Report differences

===============================================================================
INSTALLATIE & SETUP
===============================================================================

STAP 1: Clone Repository
-------------------------
git clone https://github.com/jouw-org/claude-agentic.git
cd claude-agentic

STAP 2: Configure MCP Servers
------------------------------
Set environment variables in .env of shell:

# Sentry (Required voor error tracking)
export SENTRY_DSN="your-sentry-dsn"
export SENTRY_ORG="your-org-slug"
export SENTRY_PROJECT="your-project"
export SENTRY_AUTH_TOKEN="your-token"

# Brave Search (Optional - Claude heeft built-in WebSearch)
export BRAVE_API_KEY="your-brave-api-key"

# Postgres (Required voor database skills)
export DATABASE_URL="postgresql://user:pass@localhost:5432/dbname"

STAP 3: Configure Hooks
------------------------
cd .claude/hooks
npm install
chmod +x *.sh

STAP 4: Customize Settings
---------------------------
Copy .claude/settings.json.example naar .claude/settings.json
Pas aan voor jouw project structuur

STAP 5: Customize Skills
-------------------------
Update .claude/skills/skill-rules.json:
- Pas pathPatterns aan voor jouw project
- Bijvoorbeeld: "src/api/**/*.ts" → "backend/**/*.ts"

STAP 6: Verify Setup
---------------------
# Check hooks zijn executable
ls -la .claude/hooks/*.sh | grep rwx

# Validate skill-rules.json
cat .claude/skills/skill-rules.json | jq .

# Test MCP connection
claude --test-mcp

===============================================================================
PROJECT STRUCTUUR
===============================================================================

claude-agentic/
├── .claude/
│   ├── agent/              # 15+ specialized agents
│   │   ├── backend-developer.md
│   │   ├── frontend-developer.md
│   │   ├── code-refactor-master.md
│   │   ├── qa-software-tester.md
│   │   └── ...
│   │
│   ├── skills/             # 17+ auto-activating skills
│   │   ├── backend-dev-guidelines/
│   │   ├── frontend-dev-guidelines/
│   │   ├── skill-developer/
│   │   ├── error-tracking/
│   │   ├── route-tester/
│   │   ├── skill-rules.json
│   │   └── ...
│   │
│   ├── commands/           # Custom slash commands
│   │   ├── dev-docs.md
│   │   ├── dev-docs-update.md
│   │   └── route-research-for-testing.md
│   │
│   ├── hooks/              # Intelligent automation
│   │   ├── skill-activation-prompt.sh
│   │   ├── post-tool-use-tracker.sh
│   │   ├── error-handling-reminder.sh
│   │   ├── tsc-check.sh
│   │   └── ...
│   │
│   ├── mcp-config.json     # Project-specific MCP config
│   └── settings.json       # Claude Code settings
│
├── .mcp.json               # Global MCP configuration
└── readme.txt              # This file

===============================================================================
AGENTS OVERZICHT
===============================================================================

DEVELOPMENT AGENTS:
• backend-developer - Complete backend feature development
• frontend-developer - React/TypeScript frontend development
• project-architect - High-level architecture design

QUALITY & TESTING AGENTS:
• qa-software-tester - Test validation en quality assurance
• code-architecture-reviewer - Architecture consistency review
• auto-error-resolver - Automatic TypeScript error resolution

REFACTORING AGENTS:
• code-refactor-master - Large-scale refactoring execution
• refactor-planner - Refactoring strategy creation

DOCUMENTATION AGENTS:
• documentation-architect - Comprehensive documentation

DEBUGGING AGENTS:
• auth-route-debugger - Authentication issue debugging
• frontend-error-fixer - Frontend error resolution
• web-research-specialist - Technical research online

COORDINATION AGENTS:
• sprint-orchestrator - Sprint planning en execution
• team-coordinator - Multi-agent task coordination
• plan-reviewer - Development plan validation

TESTING AGENTS:
• auth-route-tester - Authenticated endpoint testing

===============================================================================
SKILLS OVERZICHT
===============================================================================

DEVELOPMENT GUIDELINES:
• backend-dev-guidelines - Node.js/Express/TypeScript patterns
• frontend-dev-guidelines - React/TypeScript/MUI v7 patterns

TESTING & VALIDATION:
• route-tester - JWT cookie auth testing
• test-validator - Test execution en validation
• spec-guardian - Feature spec validation

ERROR TRACKING:
• error-tracking - Sentry v8 integration patterns
• sentry-monitor - Production error monitoring

DATABASE:
• postgres-manager - PostgreSQL operations

INFRASTRUCTURE:
• docker-manager - Container management
• git-operations - Advanced Git workflows

SPRINT MANAGEMENT:
• sprint-reader - Sprint task JSON parsing
• task-tracker - Task status synchronization
• todo-sync - TodoWrite integration

DEVELOPMENT WORKFLOW:
• skill-developer - Meta-skill voor skill creation
• web-researcher - Technical research
• memory-keeper - Persistent memory management

TESTING:
• e2e-tester - Playwright E2E testing

ARCHITECTURE:
• deep-thinker - Sequential thinking for complex problems

===============================================================================
MCP SERVERS DETAILS
===============================================================================

1. SENTRY
   Purpose: Error tracking en performance monitoring
   Tools: Query errors, create issues, monitor production
   Setup: Requires SENTRY_DSN, SENTRY_ORG, SENTRY_PROJECT, SENTRY_AUTH_TOKEN

2. PLAYWRIGHT
   Purpose: E2E testing en visual regression
   Tools: Navigate, screenshot, form testing, assertions
   Setup: Auto-installed via npx

3. SEQUENTIAL-THINKING
   Purpose: Enhanced reasoning voor complex problems
   Tools: Multi-step thinking, architecture decisions
   Setup: Auto-installed via npx

4. MEMORY
   Purpose: Persistent geheugen over sessies
   Tools: Remember decisions, recall context, track patterns
   Setup: Auto-installed via npx

5. BRAVE-SEARCH
   Purpose: Web research (alternative to built-in WebSearch)
   Tools: Documentation search, error solutions, best practices
   Setup: Requires BRAVE_API_KEY (optional)

6. POSTGRES
   Purpose: Direct database access
   Tools: Schema inspection, queries, test data management
   Setup: Requires DATABASE_URL

7. GIT
   Purpose: Advanced git operations
   Tools: Commit history, branch management, PR operations
   Setup: Auto-installed via npx

8. DOCKER
   Purpose: Container management
   Tools: Start/stop services, logs, health checks
   Setup: Auto-installed via npx (optional DOCKER_HOST)

===============================================================================
GEBRUIK TIPS
===============================================================================

1. Agents for Complex Tasks
   -------------------------
   "Use the [agent-name] agent to [specific task]"

   Agents werken autonoom en returnen comprehensive reports.
   Gebruik agents wanneer je multi-step autonomous work wilt.

2. Skills for Inline Guidance
   ---------------------------
   Skills activeren automatisch gebaseerd op:
   - File paths je werkt in
   - Keywords in je prompts
   - Code patterns je schrijft

   Skills geven inline best practices tijdens development.

3. Slash Commands for Workflows
   -----------------------------
   /dev-docs "your planning task"

   Commands trigger gespecialiseerde workflows en creëren
   persistent task structures.

4. MCP Servers for External Integration
   -------------------------------------
   "Check Sentry for errors"
   "Use Postgres to query users table"
   "Run Playwright test for login flow"

   MCP servers geven toegang tot external tools en services.

5. Hooks for Automation
   --------------------
   Hooks werken automatisch in de achtergrond:
   - Suggereren relevante skills
   - Tracken file changes
   - Valideren code quality
   - Triggeren automated fixes

===============================================================================
CUSTOMIZATION GUIDE
===============================================================================

Voor Jouw Project Aanpassen:
-----------------------------

1. Update skill-rules.json pathPatterns:
   Pas file path patterns aan naar jouw project structuur

2. Customize agents:
   Kopieer relevante agents en pas aan voor jouw tech stack

3. Configure MCP servers:
   Enable alleen de MCPs die je nodig hebt

4. Setup hooks:
   Begin met essentials (skill-activation, post-tool-use-tracker)
   Voeg optional hooks toe op basis van behoefte

5. Create custom skills:
   Gebruik skill-developer skill om jouw eigen skills te maken

===============================================================================
TROUBLESHOOTING
===============================================================================

Skills Activeren Niet:
- Check .claude/skills/skill-rules.json bestaat
- Verify pathPatterns matchen jouw files
- Check hooks zijn executable (chmod +x)
- Verify settings.json heeft correct hook config

MCP Connection Fails:
- Check environment variables zijn set
- Verify npx kan packages downloaden
- Test manual: npx -y @modelcontextprotocol/server-[name]

Agents Niet Gevonden:
- Check .claude/agent/[agent-name].md bestaat
- Verify agent file is valid markdown
- Check geen syntax errors in YAML frontmatter

Hooks Werken Niet:
- Check executable permissions
- Verify npm dependencies geïnstalleerd
- Test manual execution: ./.claude/hooks/[hook-name].sh
- Check settings.json hook configuration

===============================================================================
ADVANCED WORKFLOWS
===============================================================================

Multi-Agent Coordination:
-------------------------
Je kunt meerdere agents orchestreren voor complex work:

1. "Use sprint-orchestrator to break down this epic"
2. "Use backend-developer to implement API layer"
3. "Use frontend-developer to build UI components"
4. "Use qa-software-tester to validate everything"
5. "Use documentation-architect to document the feature"

Skill Chaining:
---------------
Skills kunnen samen werken in een development flow:

1. backend-dev-guidelines → tijdens API development
2. error-tracking → voor Sentry integration
3. route-tester → voor endpoint testing
4. test-validator → voor test validation

MCP Integration Patterns:
--------------------------
Combine MCP servers voor powerful workflows:

1. Memory MCP → Remember architecture decisions
2. Sequential Thinking MCP → Plan complex refactor
3. Git MCP → Analyze commit history
4. Postgres MCP → Validate data impact
5. Sentry MCP → Monitor error rates

===============================================================================
CONTRIBUTING
===============================================================================

Wil je bijdragen?

1. Create custom agents voor jouw use cases
2. Build new skills voor jouw domain
3. Share workflow patterns die werken
4. Report issues en improvements
5. Contribute MCP server configurations

===============================================================================
RESOURCES
===============================================================================

Documentation:
- .claude/agent/README.md - Agent integration guide
- .claude/skills/README.md - Skills setup en creation
- .claude/hooks/README.md - Hooks configuration
- .claude/skills/skill-developer/ - Meta-skill voor skill development

Example Workflows:
Zie de workflow voorbeelden hierboven voor concrete use cases.

Support:
Create issues in de repository voor vragen en bug reports.

===============================================================================
VERSION & LICENSE
===============================================================================

Version: 1.0
License: [Your License]
Maintainer: [Your Info]

Built with Claude Code by Anthropic
MCP Protocol: Model Context Protocol

===============================================================================
