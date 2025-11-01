# Multi-Agent Workflow: Praktisch Voorbeeld

## Scenario: Blog Platform met Authenticatie

Hier is een compleet voorbeeld van hoe de `/project-workflow` command werkt.

---

## Start van Workflow

**Gebruiker:**
```
/project-workflow

Ik wil een blog platform bouwen met:
- User authenticatie (register, login, logout)
- Blog posts (create, edit, delete, publish)
- Comments op posts
- Admin dashboard voor moderatie
- Rich text editor
- Image uploads
```

---

## PHASE 1: Architecture Design

**Claude (als project-architect):**

```
🏗️ Adopting project-architect role...

Analyzing requirements for blog platform...

📐 ARCHITECTURE DESIGN
====================

Creating technical documentation...

✅ Created /projectdoc/01-PROJECT-BRIEF.md
   - Project overview: Blog Platform met authenticatie
   - Target users: Content creators, readers, admins
   - Key features: Auth, posts, comments, moderation, media

✅ Created /projectdoc/02-FOLDER-STRUCTURE.md
   - Monorepo structure:
     - /backend (Node.js/Express/TypeScript)
     - /frontend (React/TypeScript/Vite)
     - /shared (shared types)

✅ Created /projectdoc/03-DATABASE-SCHEMA.md
   - PostgreSQL schema:
     - users (id, email, password_hash, role, created_at)
     - posts (id, author_id, title, content, status, published_at)
     - comments (id, post_id, user_id, content, created_at)
     - media (id, user_id, url, type, created_at)

✅ Created /projectdoc/04-API-ENDPOINTS.md
   - Auth: POST /api/auth/register, /login, /logout
   - Posts: GET/POST/PUT/DELETE /api/posts
   - Comments: GET/POST/DELETE /api/comments
   - Media: POST /api/media/upload
   - Admin: GET/POST /api/admin/moderate

✅ Created /projectdoc/05-TECH-STACK.md
   - Backend: Node.js, Express, TypeScript, Prisma, PostgreSQL
   - Frontend: React, TypeScript, Vite, TanStack Router, MUI v7
   - Auth: JWT cookies, bcrypt
   - Media: Multer, Sharp (image processing)
   - Testing: Jest, Playwright

✅ Created /projectdoc/06-WORKFLOWS.md
   - User registration flow
   - Post creation flow
   - Comment moderation flow
   - Image upload flow

✅ Created /projectdoc/07-IMPLEMENTATIE-ROADMAP.md
   - Phase 1: Auth infrastructure
   - Phase 2: Core blog features
   - Phase 3: Comments & moderation
   - Phase 4: Media & rich editor

Used skills:
- deep-thinker: Analyzed architecture tradeoffs
- memory-keeper: Stored decision to use JWT cookies over sessions

📋 ARCHITECTURE SUMMARY
======================

Database: 4 tables, properly normalized
API Endpoints: 15 routes across 5 resource groups
Tech Stack: Modern, scalable, well-documented
Estimated Development: 4-6 weeks across 4 phases

✅ Architecture design complete. Review the /projectdoc/ files.

Ready for sprint planning?
- Reply 'yes' to proceed to Phase 2
- Reply 'changes needed' to revise the architecture
- Tell me what to adjust
```

**⏸️ WORKFLOW PAUSED - WAITING FOR USER APPROVAL**

---

**Gebruiker:**
```
yes
```

---

## PHASE 2: Sprint Planning

**Claude (als sprint-orchestrator):**

```
📋 Adopting sprint-orchestrator role...

Reading architecture from /projectdoc/...

Breaking down project into sprints...

✅ Created .claude/sprints/sprint-1.json
   Sprint 1: Authentication Foundation (2 weeks)
   Tasks: 8 (4 backend, 2 frontend, 2 qa)

✅ Created .claude/sprints/sprint-2.json
   Sprint 2: Blog Post Core Features (2 weeks)
   Tasks: 10 (4 backend, 4 frontend, 2 qa)

✅ Created .claude/sprints/sprint-3.json
   Sprint 3: Comments & Moderation (1 week)
   Tasks: 7 (3 backend, 2 frontend, 2 qa)

✅ Created .claude/sprints/sprint-4.json
   Sprint 4: Media & Rich Editor (1 week)
   Tasks: 6 (2 backend, 3 frontend, 1 qa)

✅ Created .claude/TODO/ directory structure
✅ Initialized .claude/PROGRESS.md

📊 SPRINT BREAKDOWN
==================

Sprint 1: Authentication Foundation (8 tasks)
├─ Backend (4 tasks):
│  ├─ SPRINT-1-001: Database schema & migrations (4h)
│  ├─ SPRINT-1-002: User registration API (6h)
│  ├─ SPRINT-1-003: Login/logout API with JWT (6h)
│  └─ SPRINT-1-004: Auth middleware (3h)
├─ Frontend (2 tasks):
│  ├─ SPRINT-1-005: Login/Register pages (8h)
│  └─ SPRINT-1-006: Auth context & protected routes (4h)
└─ QA (2 tasks):
   ├─ SPRINT-1-007: Auth API testing (4h)
   └─ SPRINT-1-008: E2E auth flow testing (4h)

Sprint 2: Blog Post Core Features (10 tasks)
├─ Backend (4 tasks):
│  ├─ SPRINT-2-001: Posts database & API (8h)
│  ├─ SPRINT-2-002: Draft/publish logic (4h)
│  ├─ SPRINT-2-003: Post filtering & pagination (5h)
│  └─ SPRINT-2-004: Author authorization (3h)
├─ Frontend (4 tasks):
│  ├─ SPRINT-2-005: Post list view (6h)
│  ├─ SPRINT-2-006: Post detail view (4h)
│  ├─ SPRINT-2-007: Post editor UI (10h)
│  └─ SPRINT-2-008: Draft/publish UI (4h)
└─ QA (2 tasks):
   ├─ SPRINT-2-009: Posts API testing (5h)
   └─ SPRINT-2-010: E2E post CRUD testing (6h)

Sprint 3: Comments & Moderation (7 tasks)
Sprint 4: Media & Rich Editor (6 tasks)

Total: 31 tasks across 4 sprints (6 weeks estimated)

✅ Sprint planning complete. Created:
- Sprint 1: 8 tasks - Authentication Foundation
- Sprint 2: 10 tasks - Blog Post Core Features
- Sprint 3: 7 tasks - Comments & Moderation
- Sprint 4: 6 tasks - Media & Rich Editor

Ready to start autonomous implementation?
- Reply 'yes' to begin Phase 3 (autonomous backend → frontend → QA)
- Reply 'adjust sprints' to modify the sprint breakdown
- Tell me what to change
```

**⏸️ WORKFLOW PAUSED - WAITING FOR USER APPROVAL**

---

**Gebruiker:**
```
yes
```

---

## PHASE 3: Autonomous Implementation

**Claude:**

```
🚀 Starting autonomous implementation of Sprint 1...

═══════════════════════════════════════════
PHASE 3A: BACKEND DEVELOPMENT
═══════════════════════════════════════════

📦 Invoking skills...
✅ sprint-reader: Read SPRINT-1-001 details
✅ task-tracker: Marked SPRINT-1-001 as in-progress
✅ todo-sync: Created 4 todo items for subtasks

🔧 Adopting backend-developer role...

[SPRINT-1-001] Database schema & migrations
-------------------------------------------
Creating Prisma schema...
✅ Created prisma/schema.prisma
   - User model with email, password_hash, role
   - Indexes on email (unique)
   - Created_at, updated_at timestamps

✅ Created migration: 20250101_init_users_table
✅ Ran migration: npx prisma migrate dev
✅ Database schema applied successfully

Skills used:
- postgres-manager: Validated schema design
- docker-manager: Ensured PostgreSQL container running

✅ task-tracker: Marked SPRINT-1-001 as completed (4.2h actual)
✅ Updated .claude/PROGRESS.md

---

[SPRINT-1-002] User registration API
-------------------------------------
Invoking skills:
✅ sprint-reader: Read task
✅ task-tracker: Marked in-progress
✅ todo-sync: Created todos

Creating backend structure...
✅ Created src/modules/auth/auth.routes.ts
✅ Created src/modules/auth/auth.controller.ts
✅ Created src/modules/auth/auth.service.ts
✅ Created src/modules/auth/auth.repository.ts

Implementing registration endpoint:
✅ POST /api/auth/register
   - Zod validation (email, password strength)
   - bcrypt password hashing (10 rounds)
   - Duplicate email check
   - Prisma user creation
   - Returns sanitized user (no password)

✅ Created unit tests: auth.service.test.ts
   - Test password hashing
   - Test duplicate email handling
   - Test validation errors
   - All 8 tests passing ✅

Skills used:
- backend-dev-guidelines: Followed layered architecture
- error-tracking: Added Sentry error capture
- postgres-manager: Tested database queries

✅ task-tracker: Marked SPRINT-1-002 as completed (5.8h actual)

---

[SPRINT-1-003] Login/logout API with JWT
-----------------------------------------
[Implementation details...]
✅ POST /api/auth/login (JWT token in httpOnly cookie)
✅ POST /api/auth/logout (clear cookie)
✅ 12 tests passing
✅ task-tracker: Marked SPRINT-1-003 as completed (6.1h actual)

---

[SPRINT-1-004] Auth middleware
-------------------------------
[Implementation details...]
✅ requireAuth middleware
✅ optionalAuth middleware
✅ 6 tests passing
✅ task-tracker: Marked SPRINT-1-004 as completed (2.9h actual)

Backend Phase Complete! Summary:
✅ SPRINT-1-001: Database schema (4.2h)
✅ SPRINT-1-002: Registration API (5.8h)
✅ SPRINT-1-003: Login/logout API (6.1h)
✅ SPRINT-1-004: Auth middleware (2.9h)

Total: 4/4 backend tasks completed (19h actual vs 19h estimated)
All unit tests passing: 26/26 ✅

═══════════════════════════════════════════
PHASE 3B: FRONTEND DEVELOPMENT
═══════════════════════════════════════════

🎨 Adopting frontend-developer role...

[SPRINT-1-005] Login/Register pages
------------------------------------
Invoking skills:
✅ sprint-reader: Read task
✅ task-tracker: Marked in-progress
✅ todo-sync: Created todos

Creating frontend structure...
✅ Created src/features/auth/
   - components/LoginForm.tsx
   - components/RegisterForm.tsx
   - pages/LoginPage.tsx
   - pages/RegisterPage.tsx

Implementing pages:
✅ LoginForm: Email/password with MUI v7 components
   - TextField with validation
   - LoadingButton with Suspense
   - Error boundary
   - Form submission with useMutation

✅ RegisterForm: Similar structure
   - Password strength indicator
   - Confirm password validation
   - Terms acceptance checkbox

✅ Routing: Added to TanStack Router
   - /login route
   - /register route
   - Redirect if authenticated

Skills used:
- frontend-dev-guidelines: MUI v7 patterns, Suspense
- e2e-tester: Manual test in browser
- docker-manager: Started backend for testing

✅ task-tracker: Marked SPRINT-1-005 as completed (7.5h actual)

---

[SPRINT-1-006] Auth context & protected routes
-----------------------------------------------
[Implementation details...]
✅ Created AuthContext with Suspense
✅ ProtectedRoute component
✅ Integration complete
✅ task-tracker: Marked SPRINT-1-006 as completed (4.2h actual)

Frontend Phase Complete! Summary:
✅ SPRINT-1-005: Login/Register pages (7.5h)
✅ SPRINT-1-006: Auth context & routes (4.2h)

Total: 2/2 frontend tasks completed (11.7h actual vs 12h estimated)

═══════════════════════════════════════════
PHASE 3C: QUALITY ASSURANCE
═══════════════════════════════════════════

🧪 Adopting qa-software-tester role...

[SPRINT-1-007] Auth API testing
--------------------------------
Invoking skills:
✅ sprint-reader: Read task
✅ task-tracker: Marked in-progress
✅ test-validator: Running all tests

Backend API Testing:
✅ Unit tests: 26/26 passing
✅ Integration tests:
   - Registration flow: ✅
   - Login flow: ✅
   - Logout flow: ✅
   - Invalid credentials: ✅
   - Duplicate email: ✅
   - Password validation: ✅
   - JWT token validation: ✅
   - Cookie security (httpOnly, secure): ✅

✅ 8/8 integration tests passing

Skills used:
- test-validator: Comprehensive test suite
- route-tester: API endpoint validation
- sentry-monitor: Checked error tracking works

✅ task-tracker: Marked SPRINT-1-007 as completed (3.8h actual)

---

[SPRINT-1-008] E2E auth flow testing
-------------------------------------
Invoking skills:
✅ e2e-tester: Playwright testing

E2E Tests (Playwright):
✅ User registration happy path
   - Navigate to /register
   - Fill form with valid data
   - Submit and verify redirect
   - Verify user logged in

✅ Login happy path
   - Navigate to /login
   - Fill credentials
   - Submit and verify redirect
   - Verify auth cookie set

✅ Logout flow
   - Click logout button
   - Verify redirect to login
   - Verify auth cookie cleared

✅ Protected route access
   - Try to access /dashboard without auth
   - Verify redirect to login
   - Login and verify access granted

✅ Error handling
   - Invalid credentials show error
   - Duplicate email shows error
   - Weak password shows error

E2E Results: 5/5 test suites passing ✅
Total E2E tests: 15/15 passing ✅

Skills used:
- e2e-tester: Playwright automation
- spec-guardian: Verified acceptance criteria
- sentry-monitor: No errors in Sentry

✅ task-tracker: Marked SPRINT-1-008 as completed (4.5h actual)

QA Phase Complete! Summary:
✅ SPRINT-1-007: Auth API testing (3.8h)
✅ SPRINT-1-008: E2E auth flow testing (4.5h)

Total: 2/2 QA tasks completed (8.3h actual vs 8h estimated)

═══════════════════════════════════════════
SPRINT 1 COMPLETE! 🎉
═══════════════════════════════════════════

📊 FINAL SPRINT SUMMARY
=======================

Sprint 1: Authentication Foundation

Backend Development:
✅ SPRINT-1-001: Database schema (4.2h)
✅ SPRINT-1-002: Registration API (5.8h)
✅ SPRINT-1-003: Login/logout API (6.1h)
✅ SPRINT-1-004: Auth middleware (2.9h)
Subtotal: 4/4 tasks (19h)

Frontend Development:
✅ SPRINT-1-005: Login/Register pages (7.5h)
✅ SPRINT-1-006: Auth context & routes (4.2h)
Subtotal: 2/2 tasks (11.7h)

Quality Assurance:
✅ SPRINT-1-007: Auth API testing (3.8h)
✅ SPRINT-1-008: E2E auth flow testing (4.5h)
Subtotal: 2/2 tasks (8.3h)

TOTAL: 8/8 tasks completed (39h actual vs 39h estimated)

Test Results:
- Unit tests: 26/26 passing ✅
- Integration tests: 8/8 passing ✅
- E2E tests: 15/15 passing ✅
- Spec compliance: 100% ✅

✅ Moved sprint-1.json to .claude/DONE/
✅ Updated .claude/PROGRESS.md

Next steps:
- 'next sprint' - Continue to Sprint 2 (Blog Post Core Features)
- 'deploy' - Deploy authentication system
- 'review' - Review implementation
- 'stop' - Stop workflow
```

**⏸️ WORKFLOW PAUSED - WAITING FOR USER DECISION**

---

## Workflow Characteristics

**✅ Voordelen:**
1. **Duidelijke fases** met goedkeuringsmomenten
2. **Autonome implementatie** na goedkeuring
3. **Skill integratie** voor expertise gebieden
4. **Progress tracking** via JSON en PROGRESS.md
5. **Quality gates** door QA fase
6. **Flexibel** - stop op elk checkpoint

**🔄 Rol-switching:**
- Claude neemt verschillende persona's aan
- Elke rol gebruikt relevante skills
- Context blijft bewaard tussen rollen

**📊 Tracking:**
- Sprint JSON files (status, tijd, dependencies)
- PROGRESS.md (real-time dashboard)
- TodoWrite sync voor zichtbaarheid
- Git commits per milestone

**🎯 Checkpoints:**
1. Na architectuur → gebruiker review
2. Na sprint planning → gebruiker review
3. Na elke sprint → gebruiker beslist volgende stap
4. Bij blockers → gebruiker input gevraagd
