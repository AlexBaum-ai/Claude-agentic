# Agenticcode Flow Guide: ProjectManager → SprintOrchestrator → Developer Agents → QA Cycle

## Executive Summary

Dit document beschrijft de complete flow van het Agenticcode multi-agent systeem, van initiele projectplanning tot deployment. Het systeem coordineert gespecialiseerde AI agents die elk toegang hebben tot specifieke Model Context Protocol (MCP) servers om hun taken efficiënt uit te voeren.

**Kernprincipes:**
- **Gelaagde Architectuur**: Project Architect → Sprint Orchestrator → Development Agents → QA → Deployment
- **Parallellisatie**: Onafhankelijke taken worden gelijktijdig uitgevoerd
- **Directe MCP Toegang**: Agents hebben directe toegang tot relevante tools zonder tussenkomst
- **Automatische Tracking**: Real-time progress monitoring via sprints en todo-systeem
- **Quality Gates**: Elke fase heeft specifieke acceptatiecriteria

---

## 📊 Agent Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        USER REQUEST                              │
│              "Build an E-commerce Platform"                      │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                   🎯 STAGE 1: PLANNING                          │
│                   project-architect                             │
│                                                                   │
│  MCPs: memory, git, sequential-thinking                         │
│                                                                   │
│  Creates:                                                        │
│  ✓ Architecture diagrams                                        │
│  ✓ Database schemas                                             │
│  ✓ API specifications                                           │
│  ✓ Tech stack decisions                                         │
│  ✓ Implementation roadmap                                       │
│                                                                   │
│  Output: /projectdoc/ directory                                 │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│               📋 STAGE 2: SPRINT CREATION                       │
│                   sprint-orchestrator                           │
│                                                                   │
│  MCPs: memory, git, sequential-thinking                         │
│                                                                   │
│  Creates:                                                        │
│  ✓ Sprint breakdown (1-2 week cycles)                          │
│  ✓ Task dependencies mapping                                    │
│  ✓ Role assignments (backend/frontend/qa)                      │
│  ✓ Priority levels                                              │
│  ✓ Acceptance criteria                                          │
│                                                                   │
│  Output: .claude/sprints/sprint-N.json                          │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
        ┌────────────────────┴────────────────────┐
        │                                         │
        ▼                                         ▼
┌──────────────────┐                    ┌──────────────────┐
│  Backend Tasks   │                    │  Frontend Tasks  │
│    (Parallel)    │                    │    (Parallel)    │
└────────┬─────────┘                    └────────┬─────────┘
         │                                       │
         ▼                                       ▼
┌─────────────────────────────────────────────────────────────────┐
│           💻 STAGE 3: DEVELOPMENT (PARALLEL)                    │
│                                                                   │
│  ┌──────────────────────────┐    ┌───────────────────────────┐ │
│  │  backend-developer       │    │  frontend-developer       │ │
│  │                          │    │                           │ │
│  │  MCPs:                   │    │  MCPs:                    │ │
│  │  • postgres              │    │  • playwright             │ │
│  │  • sentry                │    │  • git                    │ │
│  │  • git                   │    │  • memory                 │ │
│  │  • docker                │    │  • sequential-thinking    │ │
│  │  • memory                │    │                           │ │
│  │  • sequential-thinking   │    │  Implements:              │ │
│  │                          │    │  • React components       │ │
│  │  Implements:             │    │  • UI/UX workflows        │ │
│  │  • Database schemas      │    │  • State management       │ │
│  │  • API endpoints         │    │  • API integration        │ │
│  │  • Business logic        │    │  • Form validation        │ │
│  │  • Authentication        │    │  • Responsive design      │ │
│  │  • Caching               │    │                           │ │
│  └──────────────────────────┘    └───────────────────────────┘ │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              🧪 STAGE 4: QUALITY ASSURANCE                      │
│                   qa-software-tester                            │
│                                                                   │
│  MCPs: playwright, sentry, sequential-thinking, memory          │
│                                                                   │
│  Executes:                                                       │
│  ✓ Unit tests                                                   │
│  ✓ Integration tests                                            │
│  ✓ E2E tests (Playwright)                                       │
│  ✓ Security tests                                               │
│  ✓ Performance tests                                            │
│  ✓ Acceptance criteria validation                              │
│  ✓ Production monitoring (Sentry)                               │
│                                                                   │
│  Quality Gate: All tests must pass ✅                          │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              🚀 STAGE 5: DEPLOYMENT & MONITORING                │
│                   team-coordinator                              │
│                                                                   │
│  MCPs: memory, git, sequential-thinking                         │
│                                                                   │
│  Final Steps:                                                    │
│  ✓ Sprint completion verification                               │
│  ✓ Deployment to production                                     │
│  ✓ Monitor errors via Sentry                                    │
│  ✓ Update PROGRESS.md                                           │
│  ✓ Prepare next sprint                                          │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔑 MCP Access Matrix per Agent & Stage

### Overzicht: Welke Agents gebruiken welke MCPs in welke Stage

| Agent | Stage | MCP Servers | MCP Tools | Primary Use Cases |
|-------|-------|-------------|-----------|-------------------|
| **project-architect** | Planning | • memory<br>• git<br>• sequential-thinking | `mcp__memory__*`<br>`mcp__git__*`<br>`mcp__sequential-thinking__*` | • Store architectural decisions<br>• Analyze project history<br>• Complex design reasoning<br>• Create technical specs |
| **sprint-orchestrator** | Sprint Creation | • memory<br>• git<br>• sequential-thinking | `mcp__memory__*`<br>`mcp__git__*`<br>`mcp__sequential-thinking__*` | • Task dependency analysis<br>• Sprint breakdown logic<br>• Store sprint patterns<br>• Track progress |
| **backend-developer** | Development | • postgres<br>• sentry<br>• git<br>• docker<br>• memory<br>• sequential-thinking | `mcp__postgres__*`<br>`mcp__sentry__*`<br>`mcp__git__*`<br>`mcp__docker__*`<br>`mcp__memory__*`<br>`mcp__sequential-thinking__*` | • Database queries & schema<br>• Error tracking setup<br>• Version control<br>• Container management<br>• Store backend patterns<br>• Complex logic reasoning |
| **frontend-developer** | Development | • playwright<br>• git<br>• memory<br>• sequential-thinking | `mcp__playwright__*`<br>`mcp__git__*`<br>`mcp__memory__*`<br>`mcp__sequential-thinking__*` | • E2E testing<br>• Component screenshots<br>• Version control<br>• Store UI patterns<br>• Complex UI logic |
| **qa-software-tester** | QA & Testing | • playwright<br>• sentry<br>• sequential-thinking<br>• memory | `mcp__playwright__*`<br>`mcp__sentry__*`<br>`mcp__sequential-thinking__*`<br>`mcp__memory__*` | • E2E test automation<br>• Visual regression<br>• Error monitoring<br>• Test strategy planning<br>• Store test patterns |
| **team-coordinator** | Coordination | • memory<br>• git<br>• sequential-thinking | `mcp__memory__*`<br>`mcp__git__*`<br>`mcp__sequential-thinking__*` | • Team coordination<br>• Progress tracking<br>• Decision storage<br>• Complex orchestration |

### MCP Server Details

#### 1. **PostgreSQL** (`postgres`)
- **Display Name**: PostgreSQL Database
- **Description**: Direct database access voor queries, schema inspection en migrations
- **Available to**: backend-developer, auth-route-tester, auth-route-debugger
- **Common Operations**:
  - Schema inspection
  - Data queries
  - Migration validation
  - Test data setup

#### 2. **Sentry** (`sentry`)
- **Display Name**: Sentry Error Tracking
- **Description**: Error monitoring, tracking en analysis
- **Available to**: backend-developer, qa-software-tester, auto-error-resolver, auth-route-debugger, frontend-error-fixer
- **Common Operations**:
  - Query production errors
  - Create issues
  - Monitor performance
  - Track error trends

#### 3. **Git** (`git`)
- **Display Name**: Git Operations
- **Description**: Git repository management, history analysis en operations
- **Available to**: All agents
- **Common Operations**:
  - Commit changes
  - Branch management
  - History analysis
  - Code review

#### 4. **Docker** (`docker`)
- **Display Name**: Docker Management
- **Description**: Container management, logs, health checks
- **Available to**: backend-developer
- **Common Operations**:
  - Start/stop containers
  - View logs
  - Health checks
  - Environment setup

#### 5. **Memory** (`memory`)
- **Display Name**: Persistent Memory
- **Description**: Cross-session memory en knowledge persistence
- **Available to**: All agents
- **Common Operations**:
  - Store decisions
  - Retrieve context
  - Pattern recognition
  - Knowledge base

#### 6. **Sequential Thinking** (`sequential-thinking`)
- **Display Name**: Sequential Thinking
- **Description**: Complex reasoning en problem decomposition
- **Available to**: All agents
- **Common Operations**:
  - Architecture decisions
  - Complex debugging
  - Multi-step planning
  - Problem analysis

#### 7. **Playwright** (`playwright`)
- **Display Name**: Playwright E2E
- **Description**: End-to-end testing, screenshots, UI validation
- **Available to**: frontend-developer, qa-software-tester, frontend-error-fixer
- **Common Operations**:
  - E2E test execution
  - Screenshot capture
  - Visual regression
  - User flow validation

#### 8. **Brave Search** (`brave-search`)
- **Display Name**: Brave Web Search
- **Description**: Web search en research capabilities
- **Available to**: web-research-specialist
- **Common Operations**:
  - Documentation lookup
  - Best practices research
  - Error solutions
  - Technology comparison

---

## 📖 Stage-by-Stage Detailed Breakdown

### Stage 1: Planning (project-architect)

**Duration**: 15-30 minutes
**MCPs Used**: memory, git, sequential-thinking

#### Responsibilities:
1. **Requirements Analysis**
   - Gather and validate requirements
   - Identify constraints and dependencies
   - Define success criteria

2. **Architecture Design**
   - System architecture diagrams
   - Design patterns selection
   - Scalability considerations
   - Security architecture

3. **Database Design**
   - Entity-Relationship diagrams
   - Schema definitions
   - Relationships and constraints
   - Migration strategies

4. **API Specification**
   - RESTful endpoint definitions
   - Request/response schemas
   - Authentication flows
   - Error handling patterns

5. **Tech Stack Decisions**
   - Frontend framework
   - Backend framework
   - Database selection
   - DevOps tools
   - Third-party services

#### Output Files:
```
/projectdoc/
├── 01-ARCHITECTUUR.md
├── 02-FOLDER-STRUCTURE.md
├── 03-DATABASE-SCHEMA.md
├── 04-API-ENDPOINTS.md
├── 05-TECH-STACK.md
├── 06-WORKFLOWS.md
├── 07-IMPLEMENTATIE-ROADMAP.md
└── README.md
```

#### MCP Usage Examples:
```javascript
// Store architectural decision
mcp__memory__create_entities({
  entities: [{
    name: "Authentication Strategy",
    entityType: "architectural-decision",
    observations: [
      "Using JWT tokens with refresh token rotation",
      "Session timeout: 15 minutes",
      "Refresh token lifetime: 7 days"
    ]
  }]
})

// Analyze project history
mcp__git__log({
  maxCount: 50,
  path: "src/auth"
})

// Complex reasoning for microservices
mcp__sequential-thinking__create_session({
  title: "Microservices Architecture Design"
})
```

---

### Stage 2: Sprint Creation (sprint-orchestrator)

**Duration**: 10-20 minutes per sprint
**MCPs Used**: memory, git, sequential-thinking

#### Responsibilities:
1. **Project Decomposition**
   - Break project into logical sprints
   - Define sprint goals
   - Estimate duration (1-2 weeks)

2. **Task Creation**
   - Create specific, actionable tasks
   - Assign to roles (backend/frontend/qa)
   - Set priority levels
   - Define acceptance criteria

3. **Dependency Mapping**
   - Identify task dependencies
   - Create execution order
   - Flag blocking tasks

4. **Progress Tracking Setup**
   - Initialize PROGRESS.md
   - Create sprint JSON files
   - Setup TODO/DONE directories

#### Sprint JSON Structure:
```json
{
  "sprintNumber": 1,
  "sprintGoal": "E-commerce Foundation: User Management & Product Catalog",
  "duration": "2 weeks",
  "status": "in-progress",
  "startDate": "2025-01-06",
  "endDate": "2025-01-20",
  "tasks": [
    {
      "taskId": "SPRINT-1-001",
      "title": "Design and implement user database schema",
      "description": "Create users, roles, and permissions tables with proper relationships",
      "assignedTo": "backend",
      "estimatedHours": 6,
      "priority": "high",
      "status": "completed",
      "dependencies": [],
      "acceptanceCriteria": [
        "User table created with fields: id, email, password_hash, role, created_at",
        "Unique constraint on email",
        "Role enum: customer, admin, seller",
        "Migration scripts created and tested",
        "Database indexes optimized"
      ],
      "completedAt": "2025-01-07T14:30:00Z"
    },
    {
      "taskId": "SPRINT-1-002",
      "title": "Implement user registration API endpoint",
      "description": "POST /api/auth/register with validation and error handling",
      "assignedTo": "backend",
      "estimatedHours": 8,
      "priority": "high",
      "status": "in-progress",
      "dependencies": ["SPRINT-1-001"],
      "acceptanceCriteria": [
        "POST /api/auth/register endpoint created",
        "Password hashing with bcrypt (min 10 rounds)",
        "Email validation and uniqueness check",
        "Returns JWT token on success",
        "Proper error responses (400, 409, 500)",
        "Unit tests with 90%+ coverage"
      ]
    }
  ],
  "metrics": {
    "totalTasks": 24,
    "completedTasks": 1,
    "inProgressTasks": 1,
    "blockedTasks": 0,
    "completionPercentage": 4
  }
}
```

#### MCP Usage Examples:
```javascript
// Store sprint planning patterns
mcp__memory__create_entities({
  entities: [{
    name: "Sprint Planning Pattern - E-commerce",
    entityType: "sprint-pattern",
    observations: [
      "Sprint 1: Foundation (Auth, User, Product schemas)",
      "Sprint 2: Core Features (Cart, Checkout, Orders)",
      "Sprint 3: Advanced Features (Search, Recommendations)",
      "Sprint 4: Admin Panel and Analytics"
    ]
  }]
})

// Complex dependency analysis
mcp__sequential-thinking__create_session({
  title: "Task Dependency Analysis for Sprint 1"
})
```

---

### Stage 3: Development (backend-developer & frontend-developer)

#### A. Backend Development

**Duration**: Variable per task (4-16 hours typical)
**MCPs Used**: postgres, sentry, git, docker, memory, sequential-thinking

##### Workflow:
```
1. Read sprint task → sprint-reader skill
2. Mark in-progress → task-tracker skill
3. Create TodoWrite items → todo-sync skill
4. Implement feature
5. Write tests
6. Mark completed → task-tracker skill
```

##### Key Activities:

**Database Operations** (postgres MCP):
```javascript
// Inspect existing schema
mcp__postgres__query({
  query: "SELECT * FROM information_schema.tables WHERE table_schema = 'public'"
})

// Test new migration
mcp__postgres__query({
  query: `
    CREATE TABLE products (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      description TEXT,
      price DECIMAL(10,2) NOT NULL,
      stock INT DEFAULT 0,
      created_at TIMESTAMP DEFAULT NOW()
    )
  `
})
```

**Error Tracking Setup** (sentry MCP):
```javascript
// Verify Sentry integration
mcp__sentry__query_issues({
  project: "ecommerce-backend",
  status: "unresolved",
  limit: 10
})

// Create issue for tracking
mcp__sentry__create_issue({
  title: "Monitor payment processing errors",
  description: "Track all payment gateway failures"
})
```

**Container Management** (docker MCP):
```javascript
// Check database container health
mcp__docker__inspect_container({
  containerId: "postgres-db"
})

// View API logs
mcp__docker__logs({
  containerId: "api-server",
  tail: 100
})
```

##### Common Backend Tasks:
- API endpoint implementation
- Database migrations
- Authentication middleware
- Business logic services
- Caching strategies
- Error handling
- Unit & integration tests

---

#### B. Frontend Development

**Duration**: Variable per task (4-12 hours typical)
**MCPs Used**: playwright, git, memory, sequential-thinking

##### Workflow:
```
1. Wait for backend API completion
2. Read sprint task → sprint-reader skill
3. Mark in-progress → task-tracker skill
4. Create TodoWrite items → todo-sync skill
5. Implement UI components
6. E2E tests with Playwright
7. Mark completed → task-tracker skill
```

##### Key Activities:

**E2E Testing** (playwright MCP):
```javascript
// Test user registration flow
mcp__playwright__navigate({
  url: "http://localhost:3000/register"
})

mcp__playwright__fill({
  selector: "input[name='email']",
  value: "test@example.com"
})

mcp__playwright__fill({
  selector: "input[name='password']",
  value: "SecurePass123!"
})

mcp__playwright__click({
  selector: "button[type='submit']"
})

// Take screenshot for visual regression
mcp__playwright__screenshot({
  path: "tests/screenshots/registration-success.png",
  fullPage: true
})
```

**Component Validation**:
```javascript
// Verify element exists
mcp__playwright__wait_for_selector({
  selector: "[data-testid='success-message']",
  state: "visible"
})

// Extract text content
mcp__playwright__evaluate({
  expression: "document.querySelector('.welcome-message').textContent"
})
```

##### Common Frontend Tasks:
- React component creation
- Form validation
- State management (Context/Redux)
- API integration
- Responsive design
- Accessibility (WCAG)
- Component tests

---

### Stage 4: Quality Assurance (qa-software-tester)

**Duration**: Variable per sprint (8-24 hours typical)
**MCPs Used**: playwright, sentry, sequential-thinking, memory

#### Responsibilities:

1. **Functional Testing**
   - Verify all acceptance criteria
   - Test happy paths
   - Test error scenarios

2. **Integration Testing**
   - Test API integrations
   - Database consistency
   - Third-party services

3. **E2E Testing** (Playwright)
   - Complete user workflows
   - Multi-page flows
   - Form submissions
   - Authentication flows

4. **Security Testing**
   - SQL injection prevention
   - XSS protection
   - CSRF tokens
   - Authentication bypass attempts

5. **Performance Testing**
   - Page load times
   - API response times
   - Database query optimization

6. **Production Monitoring** (Sentry)
   - Check for errors
   - Performance metrics
   - User impact analysis

#### Test Report Format:
```markdown
# QA Test Report - Sprint 1

## Test Summary
- **Sprint**: SPRINT-1
- **Date**: 2025-01-20
- **Tester**: qa-software-tester
- **Status**: ✅ PASSED

## Test Coverage

### Unit Tests
- Total: 156 tests
- Passed: 156 ✅
- Failed: 0
- Coverage: 94.2%

### Integration Tests
- Total: 48 tests
- Passed: 48 ✅
- Failed: 0

### E2E Tests (Playwright)
| Test Case | Status | Duration | Screenshot |
|-----------|--------|----------|------------|
| User Registration Flow | ✅ PASS | 2.3s | [link] |
| User Login Flow | ✅ PASS | 1.8s | [link] |
| Product Browse & Search | ✅ PASS | 3.1s | [link] |
| Add to Cart | ✅ PASS | 2.0s | [link] |

### Security Tests
- [✅] SQL Injection Prevention
- [✅] XSS Protection
- [✅] CSRF Token Validation
- [✅] Password Strength Requirements
- [✅] Rate Limiting

### Performance Metrics
- API Response Time (avg): 87ms ✅
- Page Load Time: 1.2s ✅
- Database Query Time (avg): 12ms ✅

### Production Monitoring (Sentry)
- Errors (24h): 0 ✅
- Performance Score: 98/100 ✅
- User Sessions: 1,234
- Crash Free Rate: 100% ✅

## Acceptance Criteria Validation
✅ All 24 acceptance criteria met

## Blockers & Issues
None

## Recommendation
**APPROVED FOR DEPLOYMENT** 🚀
```

#### MCP Usage Examples:
```javascript
// Comprehensive E2E test
mcp__playwright__navigate({ url: "http://localhost:3000" })
mcp__playwright__click({ selector: "[data-testid='login-button']" })
mcp__playwright__fill({ selector: "#email", value: "admin@test.com" })
mcp__playwright__fill({ selector: "#password", value: "admin123" })
mcp__playwright__click({ selector: "[type='submit']" })
mcp__playwright__wait_for_selector({ selector: ".dashboard", state: "visible" })
mcp__playwright__screenshot({ path: "e2e/dashboard.png" })

// Monitor production errors
mcp__sentry__query_issues({
  project: "ecommerce-frontend",
  status: "unresolved",
  query: "level:error",
  statsPeriod: "24h"
})

// Store test patterns
mcp__memory__create_entities({
  entities: [{
    name: "E-commerce Test Pattern",
    entityType: "test-strategy",
    observations: [
      "Always test authentication flows first",
      "Validate cart persistence across sessions",
      "Test payment gateway in sandbox mode",
      "Screenshot all critical user paths"
    ]
  }]
})
```

---

### Stage 5: Deployment & Monitoring (team-coordinator)

**Duration**: 30-60 minutes
**MCPs Used**: memory, git, sequential-thinking

#### Responsibilities:

1. **Pre-Deployment Checks**
   - ✅ All tests passing
   - ✅ Code review completed
   - ✅ Environment variables set
   - ✅ Database migrations ready
   - ✅ Rollback plan documented

2. **Deployment**
   - Build production artifacts
   - Run database migrations
   - Deploy to production
   - Verify health checks

3. **Post-Deployment**
   - Monitor Sentry for errors
   - Check performance metrics
   - Validate user flows
   - Update PROGRESS.md

4. **Sprint Completion**
   - Mark sprint as completed
   - Generate sprint report
   - Archive completed tasks
   - Plan next sprint

#### PROGRESS.md Update:
```markdown
# Sprint Progress Dashboard

## Overall Progress
- Total Sprints: 4
- Completed Sprints: 1 ✅
- Active Sprint: 2 🔄
- Total Tasks: 96
- Completed Tasks: 24 (25%)
- In Progress: 6
- Blocked: 0

## Sprint 1: E-commerce Foundation ✅
**Status**: Completed
**Progress**: 24/24 tasks (100%)
**Completed**: 2025-01-20

### Highlights:
- ✅ User authentication system
- ✅ Product catalog with search
- ✅ Shopping cart functionality
- ✅ Admin panel foundation

### Metrics:
- Development Time: 80 hours
- Test Coverage: 94.2%
- Production Errors: 0
- Performance Score: 98/100

## Sprint 2: Core E-commerce Features 🔄
**Status**: In Progress
**Progress**: 6/24 tasks (25%)
**Started**: 2025-01-21

### In Progress:
- 🔄 SPRINT-2-003: Payment gateway integration
- 🔄 SPRINT-2-005: Order management system
- 🔄 SPRINT-2-008: Email notification service
```

---

## 🏗️ Large Project Use Case: Enterprise E-commerce Platform

### Project Overview

**Name**: ShopFlow - Enterprise E-commerce Platform
**Duration**: 8 weeks (4 sprints × 2 weeks)
**Team**: 3 AI agents (backend-developer, frontend-developer, qa-software-tester)
**Goal**: Build a complete, production-ready e-commerce platform with admin panel, payment processing, inventory management, and analytics

---

### Sprint Breakdown

#### **Sprint 1: Foundation & User Management** (Weeks 1-2)

**Sprint Goal**: Establish core infrastructure, authentication, and user management

**Backend Tasks** (backend-developer):
1. **SPRINT-1-001**: Database schema design
   - Users, roles, permissions tables
   - Products, categories, attributes tables
   - Orders, order_items, payments tables
   - **MCPs Used**: postgres (schema design), sequential-thinking (complex relationships)
   - **Duration**: 6 hours

2. **SPRINT-1-002**: User authentication API
   - POST /api/auth/register
   - POST /api/auth/login
   - POST /api/auth/logout
   - POST /api/auth/refresh
   - **MCPs Used**: postgres (queries), sentry (error tracking), docker (testing)
   - **Duration**: 8 hours

3. **SPRINT-1-003**: User profile API
   - GET /api/users/profile
   - PUT /api/users/profile
   - PUT /api/users/password
   - **MCPs Used**: postgres, sentry, git (version control)
   - **Duration**: 6 hours

4. **SPRINT-1-004**: Product catalog API
   - GET /api/products (list with pagination)
   - GET /api/products/:id
   - POST /api/products (admin only)
   - PUT /api/products/:id (admin only)
   - DELETE /api/products/:id (admin only)
   - **MCPs Used**: postgres (complex queries), memory (store API patterns)
   - **Duration**: 10 hours

5. **SPRINT-1-005**: Category & attribute system
   - GET /api/categories
   - GET /api/products/search (with filters)
   - **MCPs Used**: postgres (full-text search), sequential-thinking (search algorithm)
   - **Duration**: 8 hours

**Frontend Tasks** (frontend-developer):
6. **SPRINT-1-006**: Authentication UI
   - Login page component
   - Register page component
   - Password reset flow
   - Auth context provider
   - Protected route wrapper
   - **MCPs Used**: playwright (E2E tests), memory (store UI patterns)
   - **Duration**: 10 hours

7. **SPRINT-1-007**: User profile page
   - Profile view component
   - Edit profile form
   - Password change form
   - **MCPs Used**: playwright (form testing), git
   - **Duration**: 6 hours

8. **SPRINT-1-008**: Product listing page
   - Product grid component
   - Pagination component
   - Product card component
   - Loading & error states
   - **MCPs Used**: playwright (visual testing), sequential-thinking (responsive design)
   - **Duration**: 8 hours

9. **SPRINT-1-009**: Product detail page
   - Product details component
   - Image gallery
   - Add to cart button
   - Product reviews section
   - **MCPs Used**: playwright (interaction testing)
   - **Duration**: 8 hours

10. **SPRINT-1-010**: Search & filter UI
    - Search bar component
    - Filter sidebar
    - Category navigation
    - Sort dropdown
    - **MCPs Used**: playwright, memory
    - **Duration**: 8 hours

**QA Tasks** (qa-software-tester):
11. **SPRINT-1-011**: Authentication testing
    - Unit tests for auth endpoints
    - E2E tests for login/register flows
    - Security testing (SQL injection, XSS)
    - **MCPs Used**: playwright (E2E), sentry (monitor errors)
    - **Duration**: 8 hours

12. **SPRINT-1-012**: Product catalog testing
    - API endpoint tests
    - Search functionality tests
    - Filter & pagination tests
    - Performance testing
    - **MCPs Used**: playwright (automated tests), sequential-thinking (test strategy)
    - **Duration**: 8 hours

**Sprint 1 Metrics**:
- Total Tasks: 12
- Backend: 5 tasks (38 hours)
- Frontend: 5 tasks (40 hours)
- QA: 2 tasks (16 hours)
- **Total Estimated Time**: 94 hours
- **MCP Operations**: ~450 calls
  - postgres: ~120 calls
  - playwright: ~150 calls
  - sentry: ~30 calls
  - git: ~80 calls
  - memory: ~40 calls
  - sequential-thinking: ~30 calls

---

#### **Sprint 2: Shopping Cart & Checkout** (Weeks 3-4)

**Sprint Goal**: Implement shopping cart, checkout flow, and payment processing

**Backend Tasks**:
1. **SPRINT-2-001**: Shopping cart API
   - POST /api/cart/items (add to cart)
   - GET /api/cart (view cart)
   - PUT /api/cart/items/:id (update quantity)
   - DELETE /api/cart/items/:id (remove item)
   - **MCPs Used**: postgres (cart persistence), redis via docker (session management)
   - **Duration**: 8 hours

2. **SPRINT-2-002**: Order management API
   - POST /api/orders (create order)
   - GET /api/orders/:id (order details)
   - GET /api/orders (user order history)
   - PUT /api/orders/:id/status (admin only)
   - **MCPs Used**: postgres (transactions), sentry (track order failures)
   - **Duration**: 10 hours

3. **SPRINT-2-003**: Payment gateway integration
   - Stripe API integration
   - POST /api/payments/create-intent
   - POST /api/payments/confirm
   - Webhook handler for payment events
   - **MCPs Used**: sequential-thinking (payment flow logic), sentry (payment errors), memory (store integration patterns)
   - **Duration**: 12 hours

4. **SPRINT-2-004**: Inventory management
   - Stock level tracking
   - Automatic reservation on order
   - Stock release on order cancellation
   - Low stock alerts
   - **MCPs Used**: postgres (atomic operations), docker (background jobs)
   - **Duration**: 10 hours

5. **SPRINT-2-005**: Shipping calculation API
   - GET /api/shipping/rates
   - Integration with shipping provider API
   - **MCPs Used**: sequential-thinking (rate calculation), memory
   - **Duration**: 6 hours

**Frontend Tasks**:
6. **SPRINT-2-006**: Shopping cart UI
   - Cart page component
   - Cart item component
   - Quantity selector
   - Cart summary widget
   - Mini cart dropdown
   - **MCPs Used**: playwright (cart interactions), memory
   - **Duration**: 10 hours

7. **SPRINT-2-007**: Checkout flow UI
   - Multi-step checkout form
   - Shipping address form
   - Payment method selection
   - Order review page
   - **MCPs Used**: playwright (form validation), sequential-thinking (UX flow)
   - **Duration**: 12 hours

8. **SPRINT-2-008**: Payment integration UI
   - Stripe Elements integration
   - Card input component
   - Payment confirmation page
   - Error handling
   - **MCPs Used**: playwright (payment testing in sandbox), git
   - **Duration**: 10 hours

9. **SPRINT-2-009**: Order confirmation & history
   - Order confirmation page
   - Order history page
   - Order tracking component
   - **MCPs Used**: playwright (order flow testing)
   - **Duration**: 8 hours

**QA Tasks**:
10. **SPRINT-2-010**: Cart & checkout testing
    - E2E cart functionality tests
    - Checkout flow tests
    - Payment sandbox testing
    - Stock management tests
    - **MCPs Used**: playwright (complex E2E flows), sentry (monitor test environment)
    - **Duration**: 12 hours

11. **SPRINT-2-011**: Payment security testing
    - PCI compliance validation
    - Payment error scenarios
    - Webhook verification tests
    - **MCPs Used**: sequential-thinking (security analysis), memory (store security patterns)
    - **Duration**: 8 hours

**Sprint 2 Metrics**:
- Total Tasks: 11
- Backend: 5 tasks (46 hours)
- Frontend: 4 tasks (40 hours)
- QA: 2 tasks (20 hours)
- **Total Estimated Time**: 106 hours
- **MCP Operations**: ~520 calls

---

#### **Sprint 3: Admin Panel & Advanced Features** (Weeks 5-6)

**Sprint Goal**: Build admin panel, analytics, and advanced customer features

**Backend Tasks**:
1. **SPRINT-3-001**: Admin dashboard API
   - GET /api/admin/stats (sales, orders, users)
   - GET /api/admin/analytics (charts data)
   - Revenue calculations
   - **MCPs Used**: postgres (complex aggregations), sequential-thinking (analytics logic)
   - **Duration**: 10 hours

2. **SPRINT-3-002**: Product management API
   - Bulk product operations
   - Image upload handling
   - CSV import/export
   - **MCPs Used**: postgres, docker (file storage), memory
   - **Duration**: 10 hours

3. **SPRINT-3-003**: Order fulfillment API
   - Order status transitions
   - Shipping label generation
   - Refund processing
   - **MCPs Used**: postgres (state management), sentry (track fulfillment issues)
   - **Duration**: 8 hours

4. **SPRINT-3-004**: Customer communication
   - Email notification system
   - Order status emails
   - Marketing email campaigns
   - **MCPs Used**: docker (email service), memory (email templates)
   - **Duration**: 8 hours

5. **SPRINT-3-005**: Reviews & ratings API
   - POST /api/products/:id/reviews
   - GET /api/products/:id/reviews
   - PUT /api/reviews/:id (user can edit)
   - DELETE /api/reviews/:id (admin/user)
   - **MCPs Used**: postgres (review moderation), sequential-thinking
   - **Duration**: 6 hours

6. **SPRINT-3-006**: Wishlist & favorites
   - POST /api/wishlist/items
   - GET /api/wishlist
   - DELETE /api/wishlist/items/:id
   - **MCPs Used**: postgres, memory
   - **Duration**: 4 hours

**Frontend Tasks**:
7. **SPRINT-3-007**: Admin dashboard UI
   - Dashboard overview page
   - Sales charts (Chart.js)
   - Recent orders widget
   - User statistics
   - **MCPs Used**: playwright (dashboard tests), git
   - **Duration**: 12 hours

8. **SPRINT-3-008**: Product management UI
   - Product list (admin)
   - Product edit form
   - Image upload component
   - Bulk actions
   - **MCPs Used**: playwright (admin workflows), sequential-thinking
   - **Duration**: 10 hours

9. **SPRINT-3-009**: Order management UI
   - Order list with filters
   - Order detail view (admin)
   - Status update controls
   - Refund interface
   - **MCPs Used**: playwright (admin tests), memory
   - **Duration**: 10 hours

10. **SPRINT-3-010**: Reviews & ratings UI
    - Review form component
    - Star rating component
    - Review list with moderation
    - **MCPs Used**: playwright (review submission tests)
    - **Duration**: 6 hours

11. **SPRINT-3-011**: Wishlist UI
    - Wishlist page
    - Add to wishlist button
    - Wishlist widget
    - **MCPs Used**: playwright
    - **Duration**: 4 hours

**QA Tasks**:
12. **SPRINT-3-012**: Admin panel testing
    - Admin authentication & authorization
    - Dashboard functionality
    - Product management tests
    - Order fulfillment tests
    - **MCPs Used**: playwright (admin E2E), sentry (admin error tracking)
    - **Duration**: 12 hours

13. **SPRINT-3-013**: Advanced feature testing
    - Review system tests
    - Email notification tests
    - Wishlist functionality
    - **MCPs Used**: playwright, sequential-thinking
    - **Duration**: 8 hours

**Sprint 3 Metrics**:
- Total Tasks: 13
- Backend: 6 tasks (46 hours)
- Frontend: 5 tasks (42 hours)
- QA: 2 tasks (20 hours)
- **Total Estimated Time**: 108 hours
- **MCP Operations**: ~550 calls

---

#### **Sprint 4: Optimization & Production Readiness** (Weeks 7-8)

**Sprint Goal**: Performance optimization, security hardening, and production deployment

**Backend Tasks**:
1. **SPRINT-4-001**: Database optimization
   - Index creation & optimization
   - Query performance tuning
   - Connection pooling
   - **MCPs Used**: postgres (EXPLAIN ANALYZE), sequential-thinking (optimization strategy)
   - **Duration**: 8 hours

2. **SPRINT-4-002**: Caching implementation
   - Redis caching layer
   - Product catalog caching
   - Session management
   - **MCPs Used**: docker (Redis), memory (caching patterns)
   - **Duration**: 8 hours

3. **SPRINT-4-003**: API rate limiting
   - Rate limiter middleware
   - Per-user limits
   - Admin exemptions
   - **MCPs Used**: sequential-thinking, sentry (monitor rate limit hits)
   - **Duration**: 6 hours

4. **SPRINT-4-004**: Security hardening
   - OWASP top 10 validation
   - SQL injection prevention
   - XSS protection
   - CSRF tokens
   - Input sanitization
   - **MCPs Used**: sequential-thinking (security analysis), memory (security checklist)
   - **Duration**: 10 hours

5. **SPRINT-4-005**: Logging & monitoring
   - Structured logging
   - Performance metrics
   - Error tracking setup
   - **MCPs Used**: sentry (production monitoring), docker (log aggregation)
   - **Duration**: 6 hours

6. **SPRINT-4-006**: Backup & disaster recovery
   - Database backup automation
   - Recovery procedures
   - Data export tools
   - **MCPs Used**: postgres (backup scripts), docker
   - **Duration**: 6 hours

**Frontend Tasks**:
7. **SPRINT-4-007**: Performance optimization
   - Code splitting
   - Lazy loading components
   - Image optimization
   - Bundle size reduction
   - **MCPs Used**: playwright (performance tests), sequential-thinking
   - **Duration**: 10 hours

8. **SPRINT-4-008**: SEO optimization
   - Meta tags
   - Structured data (JSON-LD)
   - Sitemap generation
   - robots.txt
   - **MCPs Used**: memory (SEO patterns), git
   - **Duration**: 6 hours

9. **SPRINT-4-009**: Accessibility improvements
   - WCAG 2.1 AA compliance
   - Keyboard navigation
   - Screen reader support
   - Color contrast fixes
   - **MCPs Used**: playwright (accessibility tests), sequential-thinking
   - **Duration**: 8 hours

10. **SPRINT-4-010**: Error handling & UX
    - Global error boundary
    - Retry mechanisms
    - Offline mode
    - Loading states
    - **MCPs Used**: playwright (error scenarios), memory
    - **Duration**: 6 hours

**QA Tasks**:
11. **SPRINT-4-011**: Performance testing
    - Load testing (1000+ concurrent users)
    - Stress testing
    - API response time validation
    - Database query optimization verification
    - **MCPs Used**: sequential-thinking (test scenarios), sentry (monitor performance)
    - **Duration**: 10 hours

12. **SPRINT-4-012**: Security audit
    - Penetration testing
    - Vulnerability scanning
    - Authentication bypass attempts
    - Authorization checks
    - **MCPs Used**: sequential-thinking (security analysis), memory (vulnerability database)
    - **Duration**: 12 hours

13. **SPRINT-4-013**: Full regression testing
    - Complete E2E test suite
    - Cross-browser testing
    - Mobile responsiveness
    - Accessibility validation
    - **MCPs Used**: playwright (comprehensive E2E), sentry
    - **Duration**: 14 hours

14. **SPRINT-4-014**: Production deployment validation
    - Smoke tests in production
    - Monitor error rates
    - Performance metrics validation
    - User acceptance testing
    - **MCPs Used**: sentry (production monitoring), playwright (smoke tests)
    - **Duration**: 8 hours

**Sprint 4 Metrics**:
- Total Tasks: 14
- Backend: 6 tasks (44 hours)
- Frontend: 4 tasks (30 hours)
- QA: 4 tasks (44 hours)
- **Total Estimated Time**: 118 hours
- **MCP Operations**: ~600 calls

---

### Project Summary

#### Total Project Metrics

| Metric | Value |
|--------|-------|
| **Total Sprints** | 4 |
| **Total Duration** | 8 weeks |
| **Total Tasks** | 50 |
| **Backend Tasks** | 22 (174 hours) |
| **Frontend Tasks** | 18 (152 hours) |
| **QA Tasks** | 10 (100 hours) |
| **Total Estimated Hours** | 426 hours |
| **Total MCP Operations** | ~2,120 calls |
| **Test Coverage** | 92%+ |
| **Production Errors** | < 0.1% |

#### MCP Usage Breakdown

| MCP Server | Total Calls | Primary Users |
|------------|-------------|---------------|
| **postgres** | ~480 | backend-developer, qa-software-tester |
| **playwright** | ~550 | frontend-developer, qa-software-tester |
| **sentry** | ~180 | backend-developer, qa-software-tester |
| **git** | ~320 | All agents |
| **memory** | ~240 | All agents |
| **sequential-thinking** | ~200 | All agents |
| **docker** | ~150 | backend-developer |

#### Key Features Delivered

✅ **User Management**
- Registration, login, profile management
- Role-based access control (Customer, Admin, Seller)

✅ **Product Catalog**
- Product listing with search & filters
- Category navigation
- Product details with images
- Reviews & ratings

✅ **Shopping Experience**
- Shopping cart with persistence
- Wishlist functionality
- Multi-step checkout
- Payment processing (Stripe)

✅ **Order Management**
- Order creation & tracking
- Order history
- Admin fulfillment tools
- Email notifications

✅ **Admin Panel**
- Sales dashboard with analytics
- Product management
- Order management
- User management

✅ **Production Ready**
- Performance optimized
- Security hardened
- Fully tested (92% coverage)
- Monitoring & logging

---

### Detailed Flow Example: Sprint 2, Task SPRINT-2-003

**Task**: Payment Gateway Integration
**Agent**: backend-developer
**Duration**: 12 hours
**MCPs Used**: sequential-thinking, sentry, memory, git

#### Minute-by-Minute Flow:

**[00:00] Task Initiation**
```
backend-developer receives: "Work on SPRINT-2-003"
→ Activates sprint-reader skill
→ Reads .claude/sprints/sprint-2.json
→ Extracts task details and acceptance criteria
```

**[00:05] Mark Task In Progress**
```
→ Activates task-tracker skill
→ Updates task status to "in-progress"
→ Moves task to .claude/TODO/sprint-2.json
→ Updates PROGRESS.md
```

**[00:10] Create Todo Items**
```
→ Activates todo-sync skill
→ Creates TodoWrite items from acceptance criteria:
  1. Research Stripe API documentation
  2. Setup Stripe SDK
  3. Create payment intent endpoint
  4. Implement payment confirmation
  5. Setup webhook handler
  6. Add error handling
  7. Write unit tests
  8. Test in Stripe sandbox
```

**[00:15] Complex Planning**
```
→ Uses sequential-thinking MCP
mcp__sequential-thinking__create_session({
  title: "Payment Gateway Integration Architecture"
})

Agent thinks through:
- Stripe API flow (client-side vs server-side)
- Security considerations (API keys, PCI compliance)
- Error handling strategies
- Webhook verification
- Idempotency
```

**[01:00] Implementation Starts**
```javascript
// Create payment intent endpoint
// File: src/routes/payments.js

router.post('/create-intent', async (req, res) => {
  try {
    const { amount, currency = 'usd' } = req.body;

    // Use sequential-thinking for complex validation
    // Create Stripe payment intent
    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount * 100, // Convert to cents
      currency,
      metadata: {
        userId: req.user.id,
        orderId: req.body.orderId
      }
    });

    // Store payment intent in database
    // Uses postgres MCP
    await db.query(`
      INSERT INTO payment_intents (id, user_id, order_id, amount, status)
      VALUES ($1, $2, $3, $4, $5)
    `, [
      paymentIntent.id,
      req.user.id,
      req.body.orderId,
      amount,
      'pending'
    ]);

    res.json({
      clientSecret: paymentIntent.client_secret
    });
  } catch (error) {
    // Setup Sentry error tracking
    Sentry.captureException(error);
    res.status(500).json({ error: 'Payment intent creation failed' });
  }
});
```

**[02:30] Database Operations**
```
→ Uses postgres MCP to verify schema

mcp__postgres__query({
  query: `
    SELECT column_name, data_type
    FROM information_schema.columns
    WHERE table_name = 'payment_intents'
  `
})

→ Creates migration if needed
```

**[04:00] Webhook Implementation**
```javascript
// Implement Stripe webhook handler
router.post('/webhook', async (req, res) => {
  const sig = req.headers['stripe-signature'];

  try {
    const event = stripe.webhooks.constructEvent(
      req.body,
      sig,
      process.env.STRIPE_WEBHOOK_SECRET
    );

    switch (event.type) {
      case 'payment_intent.succeeded':
        // Update order status
        await updateOrderStatus(event.data.object.metadata.orderId, 'paid');
        break;
      case 'payment_intent.payment_failed':
        // Log failure to Sentry
        Sentry.captureMessage('Payment failed', {
          extra: { paymentIntent: event.data.object }
        });
        break;
    }

    res.json({ received: true });
  } catch (error) {
    Sentry.captureException(error);
    res.status(400).send(`Webhook Error: ${error.message}`);
  }
});
```

**[06:00] Error Handling & Sentry Setup**
```
→ Uses sentry MCP to verify error tracking

mcp__sentry__query_issues({
  project: "ecommerce-backend",
  query: "payment",
  statsPeriod: "1h"
})

→ Tests error scenarios
→ Verifies Sentry captures errors correctly
```

**[08:00] Testing**
```javascript
// Write comprehensive tests
describe('Payment Gateway', () => {
  it('creates payment intent successfully', async () => {
    const response = await request(app)
      .post('/api/payments/create-intent')
      .send({ amount: 50.00, orderId: 'order-123' })
      .set('Authorization', `Bearer ${testToken}`);

    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty('clientSecret');
  });

  it('handles webhook events', async () => {
    // Test webhook with mock Stripe event
  });

  it('handles payment failures', async () => {
    // Test error scenarios
  });
});
```

**[10:00] Store Integration Pattern**
```
→ Uses memory MCP to store pattern

mcp__memory__create_entities({
  entities: [{
    name: "Stripe Payment Integration Pattern",
    entityType: "integration-pattern",
    observations: [
      "Always use payment intents (not charges)",
      "Store webhook signature secret securely",
      "Implement idempotency keys for retries",
      "Use metadata to link payments to orders",
      "Capture all payment errors to Sentry",
      "Test with Stripe test cards in sandbox"
    ]
  }]
})
```

**[11:30] Git Commit**
```
→ Uses git MCP

mcp__git__commit({
  message: "Implement Stripe payment gateway integration\n\n- Add payment intent creation endpoint\n- Implement webhook handler for payment events\n- Setup Sentry error tracking\n- Add comprehensive tests\n- Document integration pattern",
  files: [
    "src/routes/payments.js",
    "src/services/stripe.js",
    "tests/payments.test.js"
  ]
})
```

**[12:00] Mark Task Complete**
```
→ Uses task-tracker skill
→ Updates task status to "completed"
→ Moves task to .claude/DONE/sprint-2.json
→ Updates PROGRESS.md
→ Logs completion time and notes
```

---

## 🔄 Communication Flow Between Agents

### Agent Handoffs

```
project-architect (Planning Complete)
    ↓
    [Creates /projectdoc/]
    ↓
sprint-orchestrator (Reads /projectdoc/, Creates sprints)
    ↓
    [Creates .claude/sprints/sprint-N.json]
    ↓
    ├──→ backend-developer (Reads SPRINT-X-YYY tasks)
    │        ↓
    │        [Implements backend, commits to git]
    │        ↓
    │        [Notifies via task status update]
    │        ↓
    ├──→ frontend-developer (Waits for backend, reads SPRINT-X-YYY)
    │        ↓
    │        [Implements frontend, commits to git]
    │        ↓
    │        [Notifies via task status update]
    │        ↓
    └──→ qa-software-tester (Waits for backend + frontend)
             ↓
             [Runs comprehensive tests]
             ↓
             [Creates test report]
             ↓
             [Updates task status]
             ↓
sprint-orchestrator (Verifies all tasks complete)
    ↓
    [Updates PROGRESS.md]
    ↓
team-coordinator (Deploys to production)
    ↓
    [Monitors with Sentry]
    ↓
    [Reports success to user]
```

### Parallel Execution Example

**Sprint 2, Tasks 1-5 (Backend)**
```
Time 00:00 - All tasks start in parallel if no dependencies

backend-developer instance 1: SPRINT-2-001 (Cart API)
  └─ MCPs: postgres, docker (Redis)

backend-developer instance 2: SPRINT-2-005 (Shipping API)
  └─ MCPs: sequential-thinking, memory

backend-developer instance 3: SPRINT-2-004 (Inventory)
  └─ MCPs: postgres (atomic ops), docker

Time 02:30 - SPRINT-2-001 complete ✅

backend-developer instance 1: SPRINT-2-002 (Order API)
  └─ MCPs: postgres (transactions), sentry
  └─ Dependency on SPRINT-2-001 satisfied

Time 04:00 - SPRINT-2-005 complete ✅
Time 05:00 - SPRINT-2-004 complete ✅
Time 06:00 - SPRINT-2-002 complete ✅

backend-developer: SPRINT-2-003 (Payment Gateway)
  └─ MCPs: sequential-thinking, sentry, memory
  └─ Dependency on SPRINT-2-002 satisfied

Time 12:00 - All backend tasks complete ✅
```

---

## 🎯 Best Practices & Patterns

### 1. MCP Usage Patterns

**Sequential Thinking** - Use for:
- Complex architectural decisions
- Multi-step algorithm planning
- Security analysis
- Performance optimization strategies

**Memory** - Use for:
- Storing reusable patterns
- Recording architectural decisions
- Keeping integration notes
- Building knowledge base

**Git** - Use for:
- Every code change (commit frequently)
- Analyzing project history
- Code review preparation
- Branch management

**Postgres** - Use for:
- Schema validation before migrations
- Query performance analysis (EXPLAIN)
- Test data setup
- Data integrity checks

**Playwright** - Use for:
- E2E test automation
- Visual regression testing
- Screenshot capture for documentation
- Accessibility testing

**Sentry** - Use for:
- Production error monitoring
- Performance tracking
- User impact analysis
- Alert configuration

**Docker** - Use for:
- Service health checks
- Log monitoring
- Container orchestration
- Environment consistency

---

### 2. Task Dependencies

**Always Check Dependencies Before Starting**:
```javascript
// Example: Frontend task waiting for backend
if (task.dependencies.includes('SPRINT-2-002')) {
  // Check if SPRINT-2-002 is completed
  const dependencyStatus = await checkTaskStatus('SPRINT-2-002');

  if (dependencyStatus !== 'completed') {
    console.log('Waiting for backend API to complete...');
    markTaskAsBlocked(task.taskId, 'Waiting for SPRINT-2-002');
    return;
  }
}

// Proceed with task
```

---

### 3. Error Handling

**All Agents Must**:
- Capture errors to Sentry
- Log structured error information
- Update task status to "blocked" if critical error
- Store error patterns in memory for future prevention

```javascript
try {
  // Implementation
} catch (error) {
  // Capture to Sentry with context
  Sentry.captureException(error, {
    tags: {
      taskId: 'SPRINT-2-003',
      agent: 'backend-developer',
      stage: 'development'
    },
    extra: {
      input: req.body,
      timestamp: new Date().toISOString()
    }
  });

  // Update task status
  markTaskAsBlocked('SPRINT-2-003', error.message);

  // Store pattern to prevent future occurrence
  mcp__memory__create_entities({
    entities: [{
      name: `Error Pattern: ${error.name}`,
      entityType: "error-pattern",
      observations: [
        `Context: ${error.context}`,
        `Solution: ${error.solution}`
      ]
    }]
  });

  throw error;
}
```

---

### 4. Testing Strategy

**Unit Tests** (Backend):
- Test individual functions
- Mock external dependencies
- 90%+ coverage target

**Integration Tests** (Backend + Frontend):
- Test API endpoints
- Test database operations
- Test service integrations

**E2E Tests** (QA):
- Test complete user workflows
- Use Playwright for automation
- Visual regression testing
- Cross-browser validation

**Security Tests** (QA):
- OWASP Top 10 validation
- Penetration testing
- Vulnerability scanning

---

## 📈 Progress Monitoring

### Real-Time Dashboard (PROGRESS.md)

Updated automatically by task-tracker skill:

```markdown
# Sprint Progress Dashboard
Last Updated: 2025-01-15 14:30:00

## Overall Progress
- Total Sprints: 4
- Completed: 2 ✅
- In Progress: 1 🔄
- Pending: 1 ⏳

## Sprint 2: Shopping Cart & Checkout 🔄
Progress: 8/11 tasks (73%)

### Backend (5 tasks)
✅ SPRINT-2-001: Shopping cart API (8h)
✅ SPRINT-2-002: Order management API (10h)
🔄 SPRINT-2-003: Payment gateway integration (6h / 12h)
✅ SPRINT-2-004: Inventory management (10h)
✅ SPRINT-2-005: Shipping calculation (6h)

### Frontend (4 tasks)
⏳ SPRINT-2-006: Shopping cart UI (waiting for SPRINT-2-001)
⏳ SPRINT-2-007: Checkout flow UI
⏳ SPRINT-2-008: Payment integration UI
⏳ SPRINT-2-009: Order confirmation

### QA (2 tasks)
⏳ SPRINT-2-010: Cart & checkout testing
⏳ SPRINT-2-011: Payment security testing

## Velocity Metrics
- Average task completion time: 8.2 hours
- Tasks completed today: 3
- Estimated sprint completion: 2025-01-18

## Blockers
None currently

## Next Priorities
1. Complete SPRINT-2-003 (Payment gateway)
2. Start frontend tasks (SPRINT-2-006, 2-007)
3. Begin QA preparation
```

---

## 🚀 Deployment Checklist

Before deploying to production:

### Pre-Deployment
- [ ] All tests passing (unit, integration, E2E)
- [ ] Code review completed
- [ ] Database migrations tested
- [ ] Environment variables configured
- [ ] Sentry error tracking enabled
- [ ] Performance benchmarks met
- [ ] Security audit completed
- [ ] Backup procedures verified
- [ ] Rollback plan documented

### Deployment
- [ ] Build production artifacts
- [ ] Run database migrations
- [ ] Deploy to staging
- [ ] Smoke tests in staging
- [ ] Deploy to production
- [ ] Verify health checks

### Post-Deployment
- [ ] Monitor Sentry for errors (first 30 minutes critical)
- [ ] Check performance metrics
- [ ] Validate critical user flows
- [ ] Update PROGRESS.md
- [ ] Notify stakeholders

---

## 📚 Conclusion

Dit Agenticcode systeem biedt een complete, gestructureerde aanpak voor het bouwen van complexe software projecten met AI agents. Door:

1. **Duidelijke flow**: project-architect → sprint-orchestrator → developers → QA → deployment
2. **Directe MCP toegang**: Elke agent heeft de juiste tools voor zijn taak
3. **Parallel execution**: Onafhankelijke taken worden gelijktijdig uitgevoerd
4. **Automatische tracking**: Real-time inzicht in voortgang
5. **Quality gates**: Elke fase heeft verificatie voordat verder gegaan wordt

Het systeem schaalt van kleine features tot enterprise applicaties, zoals gedemonstreerd in de ShopFlow e-commerce use case.

---

**Document versie**: 1.0
**Laatst bijgewerkt**: 2025-01-03
**Auteur**: Agenticcode Documentation Team
