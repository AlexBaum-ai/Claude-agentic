# Project Flow Architecture: Complete Overview

## Executive Summary

This project uses a **multi-agent AI development framework** with specialized agents, sprint-based task management, and integrated skills/MCPs for seamless development coordination. The flow starts with planning, breaks into sprints, distributes work across specialized agents, tracks progress automatically, and ensures quality gates before deployment.

---

## Component Hierarchy

### 1. **project-architect** (PLANNING AGENT)
**Role**: Transform project ideas into comprehensive technical documentation

**Responsibilities**:
- Analyze project requirements and constraints
- Design system architecture
- Create technical documentation:
  - Architecture diagrams & design patterns
  - Database schemas and relationships
  - API endpoint specifications
  - Tech stack decisions
  - Implementation roadmap
  - Folder structure
  - User workflows

**Triggers**:
- "I need to build a new feature/project"
- "Create technical documentation for..."
- "Design the architecture for..."

**Output**: `/projectdoc/` directory with:
- 01-ARCHITECTUUR.md (System design)
- 02-FOLDER-STRUCTURE.md (Project layout)
- 03-DATABASE-SCHEMA.md (DB design)
- 04-API-ENDPOINTS.md (API specs)
- 05-TECH-STACK.md (Technologies)
- 06-WORKFLOWS.md (User/system flows)
- 07-IMPLEMENTATIE-ROADMAP.md (Implementation phases)
- README.md (Quick reference)

**Skills Used**:
- memory-keeper (Store architectural decisions)
- web-researcher (Research technologies)
- git-operations (Analyze project history)
- deep-thinker (Complex design decisions)

---

### 2. **sprint-orchestrator** (SPRINT PLANNING AGENT)
**Role**: Break projects into manageable sprints and track progress

**Responsibilities**:
- Analyze project scope and dependencies
- Decompose into logical sprints (1-2 weeks each)
- Categorize tasks by role (frontend/backend/qa)
- Create sprint JSON structure
- Manage progress tracking
- Report real-time status

**Triggers**:
- "Create sprints for [project description]"
- "Update progress" / "Show progress"
- "Mark [task-id] as complete"
- "Sprint summary" / "What's next?"

**Folder Structure Created**:
```
.claude/
├── sprints/
│   ├── sprint-1.json
│   ├── sprint-2.json
│   └── sprint-N.json
├── TODO/
│   ├── sprint-1.json (active tasks)
│   └── sprint-2.json
├── DONE/
│   └── (completed tasks)
└── PROGRESS.md (real-time dashboard)
```

**Sprint JSON Format**:
```json
{
  "sprintNumber": 1,
  "sprintGoal": "Foundation & Core Infrastructure",
  "duration": "1-2 weeks",
  "status": "pending|in-progress|completed",
  "tasks": [
    {
      "taskId": "SPRINT-1-005",
      "title": "Implement user authentication API",
      "assignedTo": "backend|frontend|qa",
      "estimatedHours": 8,
      "priority": "high|medium|low",
      "status": "pending|in-progress|completed|blocked",
      "dependencies": ["SPRINT-1-002"],
      "acceptanceCriteria": ["Criteria 1", "Criteria 2"]
    }
  ]
}
```

**Skills Used**:
- sprint-reader (Read sprint tasks)
- task-tracker (Update task status)
- todo-sync (Sync with TodoWrite)

---

## Development Agents (IMPLEMENTATION)

### 3. **backend-developer** (BACKEND IMPLEMENTATION)
**Specialization**: Server-side logic, APIs, databases, authentication

**Responsibilities**:
- Design and implement REST/GraphQL APIs
- Create database schemas and migrations
- Implement authentication & security
- Write business logic and services
- Handle data validation & error handling
- Implement caching & optimization
- Write unit & integration tests

**Triggers**:
- Task: SPRINT-X-YYY (backend)
- "Create API endpoint for..."
- "Implement authentication for..."
- "Optimize database query..."

**Workflow**:
1. Uses sprint-reader skill → reads SPRINT-X-YYY details
2. Uses task-tracker skill → marks as in-progress
3. Uses todo-sync skill → creates TodoWrite items
4. Implements the feature
5. Uses task-tracker skill → marks as completed

**Skills Used**:
- sprint-reader (Read task details)
- task-tracker (Update status)
- todo-sync (Sync with TodoWrite)
- postgres-manager (Database operations)
- docker-manager (Development environment)
- git-operations (Version control)
- error-tracking (Sentry integration)
- route-tester (Test API routes)
- memory-keeper (Store patterns)
- web-researcher (Technical research)
- deep-thinker (Complex decisions)

**MCPs Available**:
- Sequential Thinking (Complex reasoning)
- PostgreSQL (Database access)
- Docker (Container management)
- Git (Version control)
- Sentry (Error tracking)
- Memory (Persistent storage)

---

### 4. **frontend-developer** (FRONTEND IMPLEMENTATION)
**Specialization**: UI/UX, React components, state management, styling

**Responsibilities**:
- Create responsive UI components
- Implement user workflows
- Handle client-side state management
- Integrate with backend APIs
- Ensure accessibility (WCAG)
- Optimize performance
- Write component tests

**Triggers**:
- Task: SPRINT-X-YYY (frontend)
- "Create login page component"
- "Implement form validation"
- "Make responsive layout for..."

**Workflow**:
1. Uses sprint-reader skill → reads SPRINT-X-YYY details
2. Waits for backend task completion
3. Uses task-tracker skill → marks as in-progress
4. Uses todo-sync skill → creates TodoWrite items
5. Implements the components
6. Uses task-tracker skill → marks as completed

**Skills Used**:
- sprint-reader (Read task details)
- task-tracker (Update status)
- todo-sync (Sync with TodoWrite)
- e2e-tester (Playwright testing)
- docker-manager (API service health)
- git-operations (Version control)
- memory-keeper (Store UI patterns)
- web-researcher (Tech research)
- deep-thinker (Complex decisions)

**MCPs Available**:
- Sequential Thinking (Complex reasoning)
- Playwright (E2E testing)
- Git (Version control)
- Memory (Persistent storage)

---

### 5. **qa-software-tester** (QUALITY ASSURANCE)
**Specialization**: Testing, validation, quality gates, production monitoring

**Responsibilities**:
- Design comprehensive test strategies
- Execute functional testing
- Test edge cases and error handling
- Perform security testing
- Conduct integration & E2E testing
- Monitor production for regressions
- Create test reports
- Verify acceptance criteria met

**Triggers**:
- Task: SPRINT-X-YYY (qa)
- "Test the authentication feature"
- "Run E2E tests for..."
- "Verify production deployment"

**Workflow**:
1. Uses sprint-reader skill → reads SPRINT-X-YYY details
2. Waits for backend & frontend completion
3. Uses task-tracker skill → marks as in-progress
4. Uses todo-sync skill → creates TodoWrite items
5. Executes comprehensive testing
6. Documents results
7. Uses task-tracker skill → marks as completed

**Skills Used**:
- sprint-reader (Read task details)
- task-tracker (Update status)
- todo-sync (Sync with TodoWrite)
- e2e-tester (Playwright testing)
- postgres-manager (Test data setup)
- docker-manager (Environment health)
- sentry-monitor (Production monitoring)
- git-operations (Version history)

**MCPs Available**:
- Sequential Thinking (Complex reasoning)
- Playwright (E2E testing)
- PostgreSQL (Test data)
- Docker (Environment management)
- Sentry (Error monitoring)

---

## Team Orchestrator (COORDINATION)

### 6. **team-coordinator** (OVERALL ORCHESTRATOR)
**Role**: Coordinate the entire team to deliver features efficiently

**Responsibilities**:
- Analyze user requests
- Assign tasks to specialized agents
- Manage dependencies between agents
- Monitor team progress
- Handle blockers and escalations
- Ensure quality gates
- Communicate between team members

**Decision Framework**:
```
Backend API → backend-developer
Database changes → backend-developer
Server-side logic → backend-developer

UI components → frontend-developer
React pages → frontend-developer
Frontend state → frontend-developer

Testing → qa-software-tester
Bug verification → qa-software-tester
Production monitoring → qa-software-tester

Sprint planning → sprint-orchestrator
Task tracking → sprint-orchestrator
Progress reporting → sprint-orchestrator

Architecture design → project-architect
Technical specs → project-architect
System design → project-architect

Multi-agent feature → team-coordinator
Complete sprint → team-coordinator
```

**Coordination Example**: Feature Development

```
User: "Implement user authentication"

Team Coordinator:
  ↓ Task Assignment Plan
  
  Phase 1: Planning (Parallel)
  ├─ sprint-orchestrator: Read task, mark in-progress
  └─ project-architect: Verify API specs, DB schema
  
  Phase 2: Backend (Sequential)
  └─ backend-developer:
     ├─ POST /auth/register
     ├─ POST /auth/login
     ├─ POST /auth/logout
     └─ JWT middleware
     Status: ✅ Backend ready
  
  Phase 3: Frontend (After Backend)
  └─ frontend-developer:
     ├─ Login page
     ├─ Register page
     ├─ Auth context
     └─ Protected routes
     Status: ✅ Frontend ready
  
  Phase 4: Testing (After Implementation)
  └─ qa-software-tester:
     ├─ Unit tests
     ├─ Integration tests
     ├─ E2E tests
     └─ Spec compliance
     Status: ✅ All tests passing
  
  Phase 5: Completion
  └─ sprint-orchestrator: Mark complete, update PROGRESS.md
```

---

## Sprint Task Management System

### Task Lifecycle

```
pending → in-progress → completed
           ↓
         blocked → in-progress → completed
```

### Automatic Skills Integration

#### 1. **sprint-reader** Skill
**Purpose**: Read and parse sprint task data

**Auto-invokes when**:
- Task ID mentioned (SPRINT-X-YYY)
- Checking available tasks
- Verifying dependencies
- Getting task details

**Output**: Formatted task details with acceptance criteria, dependencies, priority

#### 2. **task-tracker** Skill
**Purpose**: Update sprint task status automatically

**Auto-invokes when**:
- Starting task → marks in-progress
- Completing task → marks completed, moves to DONE/
- Encountering blocker → marks blocked

**Updates**:
- `.claude/TODO/sprint-X.json` (active tasks)
- `.claude/DONE/sprint-X.json` (completed tasks)
- `.claude/PROGRESS.md` (metrics & status)

#### 3. **todo-sync** Skill
**Purpose**: Synchronize sprint tasks with TodoWrite

**Auto-invokes when**:
- Starting sprint task → creates TodoWrite items
- Breaking down tasks → adds sub-tasks
- Completing work → syncs completion

**Benefits**:
- Acceptance criteria → TodoWrite checklist
- Subtasks tracked in TodoWrite
- Status synced automatically

---

## Progress Tracking (PROGRESS.md)

The system maintains a real-time progress dashboard with:

```markdown
# Sprint Progress Dashboard

## Overall Progress
- Total Sprints: X
- Completed Sprints: Y
- Active Sprint: Z
- Total Tasks: A
- Completed Tasks: B (X%)
- In Progress: C
- Blocked: D

## Sprint Status
### Sprint 1: [Goal]
**Status**: ✅ Completed | 🔄 In Progress | ⏳ Pending
**Progress**: X/Y tasks (Z%)

#### Frontend Tasks
- ✅ SPRINT-1-001: [Task] (Completed: YYYY-MM-DD)
- 🔄 SPRINT-1-002: [Task] (In Progress)
- ⏳ SPRINT-1-003: [Task]
- 🚫 SPRINT-1-004: [Task] (Blocked: reason)

#### Backend Tasks
- [Same format]

#### QA Tasks
- [Same format]

## Blocked Tasks
| Task ID | Title | Blocked By | Notes |

## Recent Completions (Last 7 Days)
- YYYY-MM-DD: SPRINT-X-YYY - [Task Title]

## Upcoming Priorities
1. [Next critical task]
2. [Next critical task]
```

---

## Model Context Protocols (MCPs)

Available MCPs for agent use:

| MCP | Purpose | Used By |
|-----|---------|---------|
| **Sequential Thinking** | Complex reasoning, architecture, debugging | All agents |
| **PostgreSQL** | Database queries, schema inspection, test data | Backend, QA |
| **Docker** | Container management, service health | Backend, Frontend, QA |
| **Playwright** | E2E testing, screenshots, visual regression | Frontend, QA |
| **Git** | Version control, commits, branches, history | All agents |
| **Sentry** | Error tracking, monitoring, performance | Backend, QA |
| **Memory** | Persistent storage across sessions | All agents |
| **Brave Search** | Web research, documentation lookup | All agents |

---

## Skills Ecosystem

### Domain Skills

**backend-dev-guidelines**
- Layered architecture patterns
- API design (REST principles)
- Database patterns (Prisma)
- Authentication & security
- Error handling & validation
- Testing strategies

**frontend-dev-guidelines**
- React patterns & hooks
- State management
- MUI v7 styling
- TypeScript standards
- Performance optimization
- Accessibility (WCAG)

### Sprint Management Skills

**sprint-reader**: Read task details from JSON
**task-tracker**: Update task status automatically
**todo-sync**: Sync with TodoWrite tool

### Testing Skills

**e2e-tester**: Playwright-based E2E testing
**test-validator**: Test validation & quality
**route-tester**: API endpoint testing

### Operational Skills

**docker-manager**: Container operations
**postgres-manager**: Database management
**git-operations**: Version control
**sentry-monitor**: Error monitoring
**memory-keeper**: Persistent memory
**web-researcher**: Technical research
**deep-thinker**: Complex problem solving
**error-tracking**: Error handling patterns
**spec-guardian**: Specification validation

---

## Complete Development Flow Example

### Feature: "Implement user authentication"

**[00:00] INITIATION**
```
User: "I want to build user authentication system"
↓
Team Coordinator identifies multi-agent feature
```

**[00:05] PLANNING PHASE**
```
sprint-orchestrator agent launches:
  → Analyzes requirements
  → Creates Sprint 1: Authentication Foundation
  → Tasks:
    - SPRINT-1-001: Database schema (backend)
    - SPRINT-1-002: Auth API endpoints (backend)
    - SPRINT-1-003: Login UI (frontend)
    - SPRINT-1-004: Test auth flow (qa)
  → Creates .claude/sprints/sprint-1.json
  → Initializes PROGRESS.md
  → Marks SPRINT-1 as "in-progress"

project-architect agent (parallel):
  → Verifies/creates technical documentation
  → API specs for /auth endpoints
  → Database schema definition
  → Auth workflow documentation
```

**[00:15] BACKEND PHASE**
```
backend-developer agent launches:
  → Uses sprint-reader: reads SPRINT-1-002
  → Uses task-tracker: marks SPRINT-1-002 in-progress
  → Uses todo-sync: creates TodoWrite items
  → Uses sequential-thinking: plans auth architecture
  → Implements:
    - POST /api/auth/register
    - POST /api/auth/login
    - POST /api/auth/logout
    - JWT middleware
    - Password hashing (bcrypt)
    - Database migrations
  → Uses postgres-manager: validates schema
  → Writes unit tests
  → Uses task-tracker: marks SPRINT-1-002 completed
  → PROGRESS.md updates: ✅ Backend ready
```

**[00:50] FRONTEND PHASE**
```
frontend-developer agent launches:
  → Uses sprint-reader: reads SPRINT-1-003
  → Waits for backend completion ✅
  → Uses task-tracker: marks SPRINT-1-003 in-progress
  → Uses todo-sync: creates TodoWrite items
  → Uses sequential-thinking: plans UI flow
  → Implements:
    - Login page component
    - Register page component
    - Auth context (React)
    - Protected routes
    - Form validation
  → Uses e2e-tester: validates components render
  → Uses task-tracker: marks SPRINT-1-003 completed
  → PROGRESS.md updates: ✅ Frontend ready
```

**[01:30] QA PHASE**
```
qa-software-tester agent launches:
  → Uses sprint-reader: reads SPRINT-1-004
  → Waits for backend + frontend ✅
  → Uses task-tracker: marks SPRINT-1-004 in-progress
  → Uses todo-sync: creates TodoWrite items
  → Comprehensive testing:
    - Unit tests: ✅ 32/32 passing
    - Integration tests: ✅ 24/24 passing
    - E2E tests (Playwright):
      ✅ Register flow
      ✅ Login flow
      ✅ Logout flow
    - Security tests
      ✅ Password strength
      ✅ JWT validation
    - Error handling
      ✅ Invalid credentials
      ✅ Missing fields
    - Spec compliance: ✅ 100%
  → Creates test report
  → Uses task-tracker: marks SPRINT-1-004 completed
  → PROGRESS.md updates: ✅ All tests passing, ready for deployment
```

**[02:00] COMPLETION & DEPLOYMENT**
```
sprint-orchestrator agent:
  → Verifies all tasks completed
  → Updates PROGRESS.md with final metrics:
    - Sprint 1: 4/4 tasks completed (100%)
    - Time: 2 hours
    - Quality: All tests passing ✅
  → Marks SPRINT-1 as "completed"

team-coordinator:
  → Deploys to production
  → Monitors with Sentry for errors
  → Reports to user: "Feature complete and deployed ✅"
```

---

## Data Flow Diagram

```
Project Request
    ↓
project-architect (Design)
    ↓ (Creates technical specs)
sprint-orchestrator (Plan)
    ↓ (Creates sprint tasks)
    ├─→ backend-developer
    │   ├─ sprint-reader (read task)
    │   ├─ task-tracker (mark in-progress)
    │   ├─ todo-sync (create TodoWrite)
    │   ├─ [Implement]
    │   ├─ task-tracker (mark completed)
    │   └─ PROGRESS.md (updated)
    │       ↓
    ├─→ frontend-developer
    │   ├─ sprint-reader (read task)
    │   ├─ task-tracker (mark in-progress)
    │   ├─ todo-sync (create TodoWrite)
    │   ├─ [Implement]
    │   ├─ task-tracker (mark completed)
    │   └─ PROGRESS.md (updated)
    │       ↓
    └─→ qa-software-tester
        ├─ sprint-reader (read task)
        ├─ task-tracker (mark in-progress)
        ├─ todo-sync (create TodoWrite)
        ├─ [Test]
        ├─ task-tracker (mark completed)
        └─ PROGRESS.md (updated)
            ↓
        sprint-orchestrator (Mark sprint done)
            ↓
        Deployed ✅
```

---

## Key Configuration Files

### `.claude/settings.json`
Enables MCP servers and hooks:
- All MCPs enabled via `enableAllProjectMcpServers: true`
- Hooks:
  - `skill-activation-prompt.sh` (UserPromptSubmit)
  - `post-tool-use-tracker.sh` (PostToolUse)
  - `tsc-check.sh` (Stop - TypeScript validation)
  - `trigger-build-resolver.sh` (Stop - Build validation)

### `.claude/mcp-config.json`
Configures 8 MCP servers:
- Sentry, Playwright, Sequential Thinking, Memory
- Brave Search, PostgreSQL, Git, Docker

### `.claude/skills/skill-rules.json`
Defines when skills auto-activate based on:
- Keywords in prompts
- Intent patterns (regex)
- File path patterns
- Content patterns

---

## Best Practices

1. **Always use task IDs** (SPRINT-X-YYY format) to trigger automatic tracking
2. **Let skills activate automatically** - agents invoke them as needed
3. **Update PROGRESS.md frequently** - maintain real-time visibility
4. **Check dependencies** - verify prerequisites before starting tasks
5. **Document blockers clearly** - explain impact and next steps
6. **Respect role boundaries** - assign tasks to appropriate agents
7. **Use sequential workflow** - backend → frontend → QA
8. **Monitor in real-time** - use Sentry for production issues
9. **Store decisions in memory-keeper** - persist knowledge across sessions
10. **Break down complex tasks** - use TodoWrite for subtasks

---

## Summary of Component Interactions

| From | To | Trigger | Content |
|------|-----|---------|---------|
| project-architect | sprint-orchestrator | Project specs complete | Technical documentation |
| sprint-orchestrator | backend-developer | SPRINT-X-YYY (backend) | Task details + acceptance criteria |
| sprint-orchestrator | frontend-developer | SPRINT-X-YYY (frontend) | Task details + API specs |
| sprint-orchestrator | qa-software-tester | SPRINT-X-YYY (qa) | Task details + test requirements |
| backend-developer | frontend-developer | API endpoints ready | Endpoint specs + test credentials |
| backend-developer + frontend-developer | qa-software-tester | Implementation complete | Features ready for testing |
| qa-software-tester | sprint-orchestrator | Testing complete | Test results + approval status |
| sprint-orchestrator | team-coordinator | All sprint tasks done | Sprint completion report |
| team-coordinator | User | All phases complete | Feature deployment confirmation |

---

**This architecture enables autonomous, coordinated development with transparent progress tracking, automatic task management, and quality gates at every stage.**
