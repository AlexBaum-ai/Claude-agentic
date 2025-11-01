# AI Software Development Team

Complete guide voor het AI software team dat samen SaaS producten ontwikkelt.

---

## ⚠️ BELANGRIJKE CORRECTIE: MCP Toegang

**Dit document bevat verouderde informatie over MCP toegang voor agents.**

### De Realiteit:

```
❌ NIET WAAR: "Agents hebben MCP toegang"
✅ WAAR:      "Agents gebruiken alleen standaard tools + Bash CLI"
```

**Wat Agents WEL Hebben:**
- File operations (Read, Write, Edit, Glob, Grep)
- Bash tool (git, docker, npm, psql, sentry-cli, npx playwright)
- Web tools (WebFetch, WebSearch)
- Task management (TodoWrite)
- Skills en SlashCommands

**Wat Agents NIET Hebben:**
- ❌ Direct MCP toegang (mcp__sentry__*, mcp__memory__*, etc.)
- ❌ Sequential Thinking MCP
- ❌ Memory MCP
- ❌ Playwright MCP
- ❌ PostgreSQL MCP

**Hoe Het Wel Werkt:**
- Agents gebruiken **CLI equivalenten** via Bash tool
- `sentry-cli` in plaats van Sentry MCP
- `psql` in plaats van PostgreSQL MCP
- `npx playwright` in plaats van Playwright MCP
- Files voor persistentie in plaats van Memory MCP

**Voor Echte MCP Toegang:**
- Gebruik **Skills** in de main conversation (niet agents!)
- Zie `MCP_REALITY.md` voor details

---

## 👥 Team Structuur

```
                    ┌─────────────────────┐
                    │  team-coordinator   │
                    │  (Orchestrator)     │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ↓                ↓                ↓
   ┌──────────────────┐ ┌──────────────┐ ┌──────────────────┐
   │ backend-developer│ │frontend-dev  │ │ qa-software-    │
   │                  │ │              │ │ tester          │
   └──────────────────┘ └──────────────┘ └──────────────────┘
              ↓                ↓                ↓
        ┌──────────────────────────────────────────┐
        │    sprint-orchestrator & project-architect│
        └──────────────────────────────────────────┘
```

## 🎯 Agent Rollen & Specialisaties

### 1. **team-coordinator** (Team Lead)

**Rol**: Coördineert het team, wijst taken toe, monitort voortgang

**Responsibilities:**
- Analyseert user requests en wijst toe aan juiste agent(s)
- Coördineert dependencies tussen agents
- Monitort team voortgang
- Handled blockers
- Rapporteert status

**MCPs**: Alle (kan alle MCPs gebruiken voor coördinatie)

**Gebruik wanneer:**
- Complete features die meerdere agents nodig hebben
- Sprint executie
- Complex work met dependencies

**Voorbeeld:**
```
User: "Implement user authentication"
team-coordinator:
  1. Assigns backend-developer → API endpoints
  2. Assigns frontend-developer → Login UI
  3. Assigns qa-software-tester → Testing
  4. Monitors progress and ensures smooth handoffs
```

---

### 2. **backend-developer** (Backend Specialist)

**Rol**: Server-side implementation, APIs, databases

**Responsibilities:**
- Design & implement REST/GraphQL APIs
- Database schema & queries
- Authentication & security
- Business logic
- Performance optimization
- Error handling & Sentry integration

**Tools Beschikbaar:**
- ✅ **Bash** - CLI access (git, docker, npm, psql, sentry-cli, etc.)
- ✅ **File Operations** - Read, Write, Edit, Glob, Grep
- ✅ **Web Tools** - WebFetch, WebSearch
- ❌ **MCP Toegang** - Agents hebben GEEN direct MCP toegang

**CLI Equivalenten (via Bash):**
- `sentry-cli` voor error monitoring
- `psql $DATABASE_URL` voor database queries
- `git` voor version control
- `docker` voor container management
- Files voor data persistentie (geen Memory MCP)

**Skills:**
- `backend-dev-guidelines` - Follow layered architecture
- `error-tracking` - Sentry instrumentation
- `route-tester` - Test API endpoints

**Team Integration:**
- **Works after**: project-architect (specs ready)
- **Works before**: frontend-developer (APIs ready for consumption)
- **Collaborates with**: qa-software-tester (for testing)

**Voorbeeld Workflow:**
```
team-coordinator assigns: "Implement auth API"
↓
backend-developer:
  1. Analyzes requirements → Plans JWT flow
  2. Writes to file → Stores design decisions in projectdoc/
  3. Implements endpoints:
     - POST /auth/register
     - POST /auth/login
     - POST /auth/logout
  4. Uses Bash: sentry-cli → Adds error tracking
  5. Uses Bash: psql → Verifies schema
  6. Writes unit + integration tests
  7. Reports to team-coordinator: "Backend ready ✅"
```

---

### 3. **frontend-developer** (Frontend Specialist)

**Rol**: UI/UX implementation, React components, frontend state

**Responsibilities:**
- React component development
- UI/UX implementation
- Frontend state management
- API integration
- Responsive design
- Performance optimization

**Tools Beschikbaar:**
- ✅ **Bash** - CLI access (git, npm, npx playwright)
- ✅ **File Operations** - Read, Write, Edit, Glob, Grep
- ✅ **Web Tools** - WebFetch, WebSearch
- ❌ **MCP Toegang** - Agents hebben GEEN direct MCP toegang

**CLI Equivalenten (via Bash):**
- `npx playwright test` voor E2E testing
- `git` voor version control
- Files voor component patterns (geen Memory MCP)

**Skills:**
- `frontend-dev-guidelines` - React + MUI v7 patterns
- `e2e-tester` - E2E testing support

**Team Integration:**
- **Depends on**: backend-developer (needs APIs ready)
- **Works with**: project-architect (design specs)
- **Tested by**: qa-software-tester

**Voorbeeld Workflow:**
```
team-coordinator assigns: "Implement login UI"
Dependency: Backend API ready ✅
↓
frontend-developer:
  1. Analyzes requirements → Plans component structure
  2. Implements components:
     - LoginPage.tsx
     - RegisterPage.tsx
     - AuthContext
  3. Integrates with backend API /auth/login
  4. Writes to file → Documents pattern in projectdoc/
  5. Tests locally with Bash: npm run dev
  6. Reports to team-coordinator: "Frontend ready ✅"
```

---

### 4. **qa-software-tester** (QA Specialist)

**Rol**: Testing, quality assurance, production monitoring

**Responsibilities:**
- Unit & integration testing
- E2E testing (Playwright)
- Spec compliance verification
- Performance testing
- Production monitoring (Sentry)
- Bug verification

**Tools Beschikbaar:**
- ✅ **Bash** - CLI access (npx playwright, sentry-cli, npm test)
- ✅ **File Operations** - Read, Write, Edit, Glob, Grep
- ✅ **Web Tools** - WebFetch, WebSearch
- ❌ **MCP Toegang** - Agents hebben GEEN direct MCP toegang

**CLI Equivalenten (via Bash):**
- `npx playwright test` voor E2E testing
- `sentry-cli issues list` voor error monitoring
- `npm test` of `jest` voor unit/integration tests

**Skills:**
- `test-validator` - Run all test suites
- `e2e-tester` - Playwright E2E tests
- `sentry-monitor` - Production monitoring
- `spec-guardian` - Spec compliance

**Team Integration:**
- **Tests after**: backend-developer + frontend-developer done
- **Reports to**: team-coordinator
- **Blocks deployment** if tests fail

**Voorbeeld Workflow:**
```
team-coordinator assigns: "Test auth feature"
Dependencies: Backend ✅ + Frontend ✅
↓
qa-software-tester:
  1. Uses test-validator skill:
     - Bash: npm test → Unit tests: ✅ 32/32
     - Bash: npm run test:integration → Integration: ✅ 24/24

  2. Uses e2e-tester skill:
     - Bash: npx playwright test auth
     - Login flow: ✅ PASS
     - Register flow: ✅ PASS
     - Screenshots saved to test-results/

  3. Uses spec-guardian skill:
     - Reads API specs from projectdoc/
     - API compliance: ✅ 100%
     - DB schema: ✅ matches

  4. Reports to team-coordinator:
     "All tests passing ✅ Ready for deployment"
```

---

### 5. **sprint-orchestrator** (Sprint Manager)

**Rol**: Sprint planning, task tracking, progress reporting

**Responsibilities:**
- Create sprint structure
- Break down features into tasks
- Track task status
- Update PROGRESS.md
- Report sprint metrics

**Tools Beschikbaar:**
- ✅ **Bash** - CLI access (git)
- ✅ **File Operations** - Read, Write, Edit sprint JSON files
- ❌ **MCP Toegang** - Agents hebben GEEN direct MCP toegang

**Data Storage:**
- Sprint data opgeslagen in `.claude/sprints/*.json`
- Progress tracking in `PROGRESS.md`
- Geen Memory MCP, gebruikt files

**Skills:**
- `sprint-reader` - Read sprint tasks
- `task-tracker` - Update task status
- `todo-sync` - Sync with TodoWrite

**Team Integration:**
- **Works with**: All agents (tracks their progress)
- **Reports to**: team-coordinator & user

**Voorbeeld Workflow:**
```
User: "Create Sprint 3"
↓
sprint-orchestrator:
  1. Analyzes feature requirements
  2. Creates sprint structure:
     - .claude/sprints/sprint-3.json
     - 12 tasks (4 backend, 4 frontend, 4 QA)
  3. Sets dependencies
  4. Initializes PROGRESS.md

User: "Start SPRINT-3-005"
↓
sprint-orchestrator:
  1. Uses sprint-reader → Gets task details
  2. Uses task-tracker → Marks in-progress
  3. Uses todo-sync → Creates TodoWrite items

Agent completes work:
↓
sprint-orchestrator:
  1. Uses task-tracker → Marks completed
  2. Updates PROGRESS.md
  3. Reports metrics
```

---

### 6. **project-architect** (Architecture Specialist)

**Rol**: Architecture design, technical documentation

**Responsibilities:**
- System architecture design
- Technical documentation
- API specification
- Database schema design
- Technology choices

**Tools Beschikbaar:**
- ✅ **Bash** - CLI access
- ✅ **File Operations** - Write documentation to projectdoc/
- ✅ **Web Tools** - WebSearch for research
- ❌ **MCP Toegang** - Agents hebben GEEN direct MCP toegang

**Data Storage:**
- Architecture docs in `projectdoc/` directory
- Design decisions in markdown files
- Geen Memory MCP, gebruikt files

**Skills:**
- `spec-guardian` - Spec verification

**Team Integration:**
- **Works before**: All developers (provides specs)
- **Consulted by**: team-coordinator for architecture decisions

**Voorbeeld Workflow:**
```
User: "Design payment processing system"
↓
project-architect:
  1. Analyzes requirements:
     - Considers: Stripe vs PayPal vs custom
     - Designs: Payment flow, refunds, webhooks

  2. Uses WebSearch tool:
     - Researches best practices
     - Checks latest Stripe API documentation

  3. Creates documentation (via Write tool):
     - projectdoc/04-API-ENDPOINTS.md
     - projectdoc/03-DATABASE-SCHEMA.md
     - projectdoc/01-ARCHITECTUUR.md
     - projectdoc/DECISIONS.md (design decisions log)

  4. Reports to team-coordinator:
     "Architecture ready, specs documented ✅"
```

---

## 🔄 Team Workflows

### Workflow 1: Complete Feature (Multi-Agent)

```
User Request: "Implement password reset functionality"

┌──────────────────────────────────────────────────┐
│ PHASE 1: PLANNING (5 min)                       │
└──────────────────────────────────────────────────┘

team-coordinator:
  └─ Launches sprint-orchestrator
     ├─ Reads SPRINT-2-015
     ├─ Marks in-progress
     └─ Creates 12 TodoWrite items

team-coordinator:
  └─ Launches project-architect
     ├─ Verifies API specs ✅
     ├─ Verifies DB schema ✅
     └─ All specs ready


┌──────────────────────────────────────────────────┐
│ PHASE 2: BACKEND (30 min)                       │
└──────────────────────────────────────────────────┘

team-coordinator:
  └─ Launches backend-developer

backend-developer:
  ├─ Uses Sequential Thinking MCP
  │  └─ Plans: Email flow, token generation, expiry
  ├─ Implements:
  │  ├─ POST /auth/reset-password
  │  ├─ POST /auth/confirm-reset
  │  └─ Email service
  ├─ Uses Sentry MCP
  │  └─ Adds error tracking
  ├─ Writes tests (16 unit, 8 integration)
  └─ Reports: "Backend ready ✅"


┌──────────────────────────────────────────────────┐
│ PHASE 3: FRONTEND (25 min)                      │
└──────────────────────────────────────────────────┘

team-coordinator:
  └─ Launches frontend-developer

frontend-developer:
  ├─ Uses Sequential Thinking MCP
  │  └─ Plans: Form flow, validation, success states
  ├─ Implements:
  │  ├─ ResetPasswordPage.tsx
  │  ├─ ConfirmResetPage.tsx
  │  └─ Form validation
  ├─ Integrates with backend API
  └─ Reports: "Frontend ready ✅"


┌──────────────────────────────────────────────────┐
│ PHASE 4: TESTING (20 min)                       │
└──────────────────────────────────────────────────┘

team-coordinator:
  └─ Launches qa-software-tester

qa-software-tester:
  ├─ Uses test-validator skill
  │  ├─ Unit: ✅ 48/48
  │  └─ Integration: ✅ 32/32
  ├─ Uses e2e-tester skill (Playwright MCP)
  │  ├─ Reset flow: ✅ PASS
  │  ├─ Email flow: ✅ PASS
  │  └─ Screenshots taken
  ├─ Uses spec-guardian skill
  │  └─ Compliance: ✅ 100%
  └─ Reports: "All tests passing ✅"


┌──────────────────────────────────────────────────┐
│ PHASE 5: DEPLOYMENT (5 min)                     │
└──────────────────────────────────────────────────┘

team-coordinator:
  ├─ Uses Git MCP
  │  ├─ Commits all changes
  │  └─ Creates PR
  └─ Deploys to production


┌──────────────────────────────────────────────────┐
│ PHASE 6: MONITORING (30 min)                    │
└──────────────────────────────────────────────────┘

team-coordinator:
  └─ Launches qa-software-tester (monitoring)

qa-software-tester:
  ├─ Uses sentry-monitor skill (Sentry MCP)
  │  └─ No errors in 30 min ✅
  ├─ Uses e2e-tester (production)
  │  └─ Reset flow works ✅
  └─ Reports: "Production verified ✅"


┌──────────────────────────────────────────────────┐
│ PHASE 7: COMPLETION (2 min)                     │
└──────────────────────────────────────────────────┘

team-coordinator:
  └─ Launches sprint-orchestrator

sprint-orchestrator:
  ├─ Uses task-tracker → Marks complete
  ├─ Updates PROGRESS.md
  └─ Reports success to user

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ FEATURE COMPLETE
Total Time: 1 hour 17 minutes
Team Members Used: 5 agents
Human Intervention: 0 prompts
Quality: All tests passing, production verified
```

---

### Workflow 2: Backend-Only Task

```
User Request: "Add Sentry error tracking to auth service"

team-coordinator analyzes:
  → Backend-only task
  → No frontend changes needed
  → No new features (enhancement)

team-coordinator:
  └─ Launches backend-developer ONLY

backend-developer:
  ├─ Uses Sentry MCP
  │  └─ Verifies Sentry configuration
  ├─ Invokes error-tracking skill
  │  └─ Adds instrumentation to auth service
  ├─ Tests error capture
  └─ Reports: "Sentry tracking added ✅"

Time: 15 minutes
Agents used: 1 (backend-developer)
```

---

### Workflow 3: Complete Sprint Execution

```
User Request: "Execute Sprint 3 autonomously"

team-coordinator reads Sprint 3:
  - 12 tasks total
  - 4 backend tasks
  - 4 frontend tasks
  - 4 QA tasks

team-coordinator creates execution plan:

  Week 1:
  ├─ Monday: Backend tasks 1-2
  ├─ Tuesday: Backend tasks 3-4
  ├─ Wednesday: Frontend tasks 1-2
  ├─ Thursday: Frontend tasks 3-4
  └─ Friday: QA tasks 1-4

Execution:

Day 1 (Backend Tasks 1-2):
  team-coordinator → backend-developer
  └─ SPRINT-3-001: API endpoints ✅ (2h)
  └─ SPRINT-3-002: Database migration ✅ (1.5h)

Day 2 (Backend Tasks 3-4):
  team-coordinator → backend-developer
  └─ SPRINT-3-003: Business logic ✅ (2.5h)
  └─ SPRINT-3-004: Error handling ✅ (1h)

Day 3 (Frontend Tasks 1-2):
  team-coordinator → frontend-developer
  └─ SPRINT-3-005: UI components ✅ (2h)
  └─ SPRINT-3-006: State management ✅ (2h)

Day 4 (Frontend Tasks 3-4):
  team-coordinator → frontend-developer
  └─ SPRINT-3-007: Forms & validation ✅ (2.5h)
  └─ SPRINT-3-008: Routing ✅ (1.5h)

Day 5 (QA Tasks 1-4):
  team-coordinator → qa-software-tester
  └─ SPRINT-3-009: Unit tests ✅ (1h)
  └─ SPRINT-3-010: Integration tests ✅ (1.5h)
  └─ SPRINT-3-011: E2E tests ✅ (2h)
  └─ SPRINT-3-012: Production monitoring ✅ (1h)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ SPRINT 3 COMPLETE
Total Time: 5 days (22.5 hours of work)
Tasks: 12/12 completed
Quality: All tests passing
Agents used: All 5 agents coordinated by team-coordinator
```

---

## 🎯 How to Use the Team

### Basic Usage

**Single agent task:**
```
User: "Add validation to register endpoint"
Assistant: *Launches backend-developer agent directly*
```

**Multi-agent feature:**
```
User: "Implement shopping cart"
Assistant: *Launches team-coordinator agent*
team-coordinator → Coordinates backend + frontend + QA
```

**Complete sprint:**
```
User: "Execute Sprint 2"
Assistant: *Launches team-coordinator agent*
team-coordinator → Orchestrates all agents for 8 tasks
```

### Agent Selection Logic

```
IF task is backend-only:
  → Use backend-developer directly

ELSE IF task is frontend-only:
  → Use frontend-developer directly

ELSE IF task is testing-only:
  → Use qa-software-tester directly

ELSE IF task requires multiple specialties:
  → Use team-coordinator (will assign to specialists)

ELSE IF complete sprint execution:
  → Use team-coordinator
```

---

## 📊 Team Benefits

### vs Single Autonomous Agent

**Single Agent Approach** (old autonomous-developer):
- ❌ Jack of all trades, master of none
- ❌ No specialization
- ❌ Cannot parallelize work
- ❌ Less expert in each domain

**Team Approach** (team-coordinator + specialists):
- ✅ Each agent is expert in their domain
- ✅ Can work in parallel (frontend + backend simultaneously)
- ✅ Better code quality (specialists)
- ✅ Realistic workflow (mimics real teams)
- ✅ Can scale (add more specialists)

### Performance Gains

**Example: User Authentication Feature**

Single Agent:
  - Total time: 2.5 hours sequential

Team Approach:
  - Backend: 45 min
  - Frontend: 40 min (starts after backend done)
  - QA: 25 min (after both done)
  - Total: 1 hour 50 min ✅ (27% faster)

With parallel work:
  - Backend + Architecture: Parallel
  - Frontend + Backend tests: Parallel where possible
  - Total: ~1 hour 30 min ✅ (40% faster)

---

## 🔧 Tool Toegang (Gecorrigeerde Versie)

```
Agent                  | MCP Toegang | Tools Beschikbaar
-----------------------|-------------|----------------------------------
team-coordinator       | ❌ Nee      | Bash, Files, Web, TodoWrite, Task
backend-developer      | ❌ Nee      | Bash, Files, Web, TodoWrite, Task
frontend-developer     | ❌ Nee      | Bash, Files, Web, TodoWrite, Task
qa-software-tester     | ❌ Nee      | Bash, Files, Web, TodoWrite, Task
sprint-orchestrator    | ❌ Nee      | Bash, Files, Web, TodoWrite, Task
project-architect      | ❌ Nee      | Bash, Files, Web, TodoWrite, Task
```

**Via Bash CLI Equivalenten:**
- `sentry-cli` → Error monitoring
- `psql` → Database queries
- `npx playwright` → E2E testing
- `git` → Version control
- `docker` → Containers
- Files → Data persistentie (i.p.v. Memory MCP)

---

## 📚 Summary

**Je hebt nu een compleet AI software team:**

👨‍💼 **team-coordinator** - Team lead, orchestrates everyone
👨‍💻 **backend-developer** - Backend specialist (APIs, DB, CLI tools)
🎨 **frontend-developer** - Frontend specialist (React, UI/UX)
🧪 **qa-software-tester** - QA specialist (Testing via CLI tools)
📋 **sprint-orchestrator** - Sprint manager (task tracking in files)
🏗️ **project-architect** - Architecture specialist (design docs)

**Realiteit**:
- ✅ Gecoördineerd team workflow systeem
- ✅ Role-based specialisatie via prompts
- ✅ Werkt met standaard tools + Bash CLI
- ❌ Geen direct MCP toegang voor agents
- ⚠️ Voor MCP's: Gebruik skills in main conversation

**Result**: Een gestructureerde aanpak voor complexe projecten via role-based agents die CLI tools gebruiken! 🚀

**Voor Echte MCP Integratie**: Zie `MCP_REALITY.md`
