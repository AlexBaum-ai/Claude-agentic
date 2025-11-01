# 📖 Hoe Werkt Het AI Software Team?

---

## ⚠️ BELANGRIJKE CORRECTIE

**Dit document bevat verouderde MCP claims. De realiteit:**

```
❌ Agents hebben GEEN MCP toegang
✅ Agents gebruiken Bash CLI tools
✅ Voor MCP's: Gebruik skills in main conversation
```

**Voor Accurate Informatie:**
- `MCP_REALITY.md` - Hoe MCP's ECHT werken
- `ARCHITECTURE_V2.md` - Skills-first aanpak
- `AI_SOFTWARE_TEAM.md` - Gecorrigeerde agent docs

**TL;DR**: Agents werken met CLI tools (sentry-cli, psql, npx playwright), niet met MCP's. Het systeem werkt nog steeds, maar anders dan hieronder beschreven.

---

## 🎯 Kort Overzicht

Dit project bevat een **compleet AI software team** dat autonome SaaS ontwikkeling mogelijk maakt. In plaats van één super-agent, werk je met een team van gespecialiseerde agents die samenwerken zoals een echt software team.

**Let op**: Agents gebruiken CLI tools via Bash, niet directe MCP toegang zoals hieronder gesuggereerd.

## 🏗️ De Team Structuur

```
┌─────────────────────────────────────────┐
│         TEAM COORDINATOR                │
│    (Orchestreert het hele team)         │
└─────────────────────────────────────────┘
                   │
    ┌──────────────┼──────────────┐
    ↓              ↓              ↓
┌─────────┐  ┌─────────┐  ┌─────────┐
│ BACKEND │  │FRONTEND │  │   QA    │
│   DEV   │  │   DEV   │  │  TESTER │
└─────────┘  └─────────┘  └─────────┘
    ↓              ↓              ↓
┌─────────┐  ┌─────────┐
│ SPRINT  │  │ PROJECT │
│  ORCH.  │  │  ARCH.  │
└─────────┘  └─────────┘
```

## 👥 De Team Members

### 1. **Team Coordinator** (De Leider)
- **Rol**: Verdeelt taken over het team
- **Wanneer gebruiken**: Als startpunt voor grote projecten
- **MCPs**: Sequential Thinking, Memory, Git, Docker
- **Skills**: Alle skills (via delegation)

### 2. **Backend Developer**
- **Rol**: APIs, databases, server-side logic
- **Wanneer gebruiken**: Voor backend features
- **MCPs**: Sequential Thinking, Memory, Sentry, PostgreSQL, Git
- **Skills**: backend-dev-guidelines, error-tracking, sprint-reader, task-tracker

### 3. **Frontend Developer**
- **Rol**: React UI/UX, user interfaces
- **Wanneer gebruiken**: Voor frontend features
- **MCPs**: Sequential Thinking, Memory, Playwright, Git
- **Skills**: frontend-dev-guidelines, e2e-tester, sprint-reader, task-tracker

### 4. **QA Software Tester**
- **Rol**: Testing, validatie, monitoring
- **Wanneer gebruiken**: Voor testen en quality assurance
- **MCPs**: Sequential Thinking, Memory, Playwright, Sentry
- **Skills**: test-validator, spec-guardian, e2e-tester, sentry-monitor

### 5. **Sprint Orchestrator**
- **Rol**: Sprint management, task tracking
- **Wanneer gebruiken**: Voor sprint planning en tracking
- **MCPs**: Sequential Thinking, Memory
- **Skills**: sprint-reader, task-tracker, todo-sync

### 6. **Project Architect**
- **Rol**: Architecture, specificaties, design
- **Wanneer gebruiken**: Voor architecture beslissingen
- **MCPs**: Sequential Thinking, Memory, Web Search
- **Skills**: spec-guardian, sprint-reader

## 🚀 Grote Project Voorbeelden

## Voorbeeld 1: E-Commerce Platform Bouwen

**Project**: Volledige webshop met producten, winkelwagen, checkout, en betalingen

### Fase 1: Project Setup (30 minuten)

```
User: "Ik wil een e-commerce platform bouwen met producten,
       winkelwagen, checkout en Stripe betalingen"

→ Team Coordinator wordt geactiveerd

  [PLANNING]
  ├─ project-architect: Ontwerp architectuur
  │  ├─ Database schema: users, products, cart_items, orders, payments
  │  ├─ API endpoints: 25 endpoints
  │  └─ Tech stack: Node.js + Express + React + PostgreSQL
  │
  ├─ sprint-orchestrator: Maak sprint taken
  │  ├─ Sprint 1: Core Setup (5 taken)
  │  ├─ Sprint 2: Product Catalog (8 taken)
  │  ├─ Sprint 3: Winkelwagen (6 taken)
  │  ├─ Sprint 4: Checkout (7 taken)
  │  └─ Sprint 5: Betalingen (5 taken)
  │
  └─ Memory MCP: Sla project context op
     └─ "E-commerce platform, Stripe payments, 5 sprints"
```

### Fase 2: Sprint 1 - Core Setup (2 uur)

```
Team Coordinator: "Start Sprint 1: Core Setup"

TAAK 1.1: Database Schema Setup
→ backend-developer
  ├─ Uses PostgreSQL MCP
  │  └─ Creates tables: users, products, categories
  ├─ Uses backend-dev-guidelines
  │  └─ Creates Prisma schema
  └─ Result: ✅ Database schema ready

TAAK 1.2: Authentication System
→ backend-developer
  ├─ Implements JWT authentication
  ├─ Creates: POST /auth/register, POST /auth/login
  ├─ Adds Sentry error tracking
  └─ Result: ✅ Auth API ready

TAAK 1.3: Frontend Setup
→ frontend-developer
  ├─ Creates React app structure
  ├─ Sets up MUI v7 theme
  ├─ Creates routing
  └─ Result: ✅ Frontend scaffolding ready

TAAK 1.4: Login/Register UI
→ frontend-developer
  ├─ Creates LoginPage.tsx
  ├─ Creates RegisterPage.tsx
  ├─ Implements auth forms
  └─ Result: ✅ Auth UI ready

TAAK 1.5: End-to-End Test
→ qa-software-tester
  ├─ Uses e2e-tester skill (Playwright MCP)
  ├─ Tests registration flow
  ├─ Tests login flow
  └─ Result: ✅ All tests passing

Sprint 1 Complete: 2 uur
Status: ✅ Core setup klaar voor development
```

### Fase 3: Sprint 2 - Product Catalog (3 uur)

```
Team Coordinator: "Start Sprint 2: Product Catalog"

TAAK 2.1: Product API
→ backend-developer (30 min)
  ├─ GET /api/products (lijst met filters)
  ├─ GET /api/products/:id (detail)
  ├─ POST /api/products (admin)
  ├─ PUT /api/products/:id (admin)
  ├─ DELETE /api/products/:id (admin)
  └─ Result: ✅ Product CRUD API ready

TAAK 2.2: Category API
→ backend-developer (20 min)
  ├─ GET /api/categories
  ├─ POST /api/categories (admin)
  └─ Result: ✅ Category API ready

TAAK 2.3: Product Search
→ backend-developer (40 min)
  ├─ GET /api/products/search?q=...
  ├─ Full-text search in PostgreSQL
  ├─ Filter by category, price range
  └─ Result: ✅ Search API ready

TAAK 2.4: Product List UI
→ frontend-developer (45 min)
  ├─ Creates ProductListPage.tsx
  ├─ Creates ProductCard component
  ├─ Implements pagination
  ├─ Adds filters (category, price)
  └─ Result: ✅ Product list UI ready

TAAK 2.5: Product Detail UI
→ frontend-developer (30 min)
  ├─ Creates ProductDetailPage.tsx
  ├─ Shows images, description, price
  ├─ Add to cart button
  └─ Result: ✅ Product detail UI ready

TAAK 2.6: Admin Product Management
→ frontend-developer (35 min)
  ├─ Creates AdminProductPage.tsx
  ├─ CRUD interface voor producten
  └─ Result: ✅ Admin UI ready

TAAK 2.7: Test Product Flows
→ qa-software-tester (30 min)
  ├─ E2E: Browse products
  ├─ E2E: Search products
  ├─ E2E: View product detail
  ├─ E2E: Admin CRUD
  └─ Result: ✅ All tests passing

Sprint 2 Complete: 3 uur 10 min
Status: ✅ Product catalog volledig werkend
```

### Fase 4: Sprint 3 - Winkelwagen (2.5 uur)

```
Team Coordinator: "Start Sprint 3: Winkelwagen"

TAAK 3.1: Cart API
→ backend-developer (40 min)
  ├─ POST /api/cart/items (add to cart)
  ├─ GET /api/cart (get cart)
  ├─ PUT /api/cart/items/:id (update quantity)
  ├─ DELETE /api/cart/items/:id (remove)
  └─ Result: ✅ Cart API ready

TAAK 3.2: Cart State Management
→ frontend-developer (30 min)
  ├─ Creates CartContext
  ├─ Persistent cart in localStorage
  └─ Result: ✅ Cart state ready

TAAK 3.3: Cart UI
→ frontend-developer (45 min)
  ├─ Creates CartPage.tsx
  ├─ Shows cart items
  ├─ Update quantity
  ├─ Remove items
  ├─ Shows total
  └─ Result: ✅ Cart UI ready

TAAK 3.4: Cart Badge
→ frontend-developer (20 min)
  ├─ Cart icon in navbar
  ├─ Badge showing item count
  └─ Result: ✅ Cart badge ready

TAAK 3.5: Test Cart Flows
→ qa-software-tester (35 min)
  ├─ E2E: Add to cart
  ├─ E2E: Update quantity
  ├─ E2E: Remove items
  ├─ E2E: Cart persistence
  └─ Result: ✅ All tests passing

Sprint 3 Complete: 2 uur 30 min
Status: ✅ Winkelwagen volledig werkend
```

### Fase 5: Sprint 4 - Checkout (3 uur)

```
Team Coordinator: "Start Sprint 4: Checkout"

TAAK 4.1: Order API
→ backend-developer (45 min)
  ├─ POST /api/orders (create order)
  ├─ GET /api/orders (user orders)
  ├─ GET /api/orders/:id (order detail)
  └─ Result: ✅ Order API ready

TAAK 4.2: Shipping Address
→ backend-developer (30 min)
  ├─ POST /api/addresses
  ├─ GET /api/addresses
  └─ Result: ✅ Address API ready

TAAK 4.3: Checkout Flow UI
→ frontend-developer (60 min)
  ├─ Creates CheckoutPage.tsx
  ├─ Step 1: Shipping address
  ├─ Step 2: Review order
  ├─ Step 3: Payment (placeholder)
  └─ Result: ✅ Checkout UI ready

TAAK 4.4: Order Confirmation
→ frontend-developer (30 min)
  ├─ Creates OrderConfirmationPage.tsx
  ├─ Shows order details
  ├─ Shows tracking info
  └─ Result: ✅ Confirmation UI ready

TAAK 4.5: Test Checkout Flow
→ qa-software-tester (35 min)
  ├─ E2E: Complete checkout
  ├─ E2E: Shipping address
  ├─ E2E: Order confirmation
  └─ Result: ✅ All tests passing

Sprint 4 Complete: 3 uur
Status: ✅ Checkout flow werkend (zonder betaling)
```

### Fase 6: Sprint 5 - Stripe Betalingen (3.5 uur)

```
Team Coordinator: "Start Sprint 5: Stripe Betalingen"

TAAK 5.1: Stripe Integration Backend
→ backend-developer (90 min)
  ├─ Uses Web Search MCP
  │  └─ "Stripe payment intent best practices 2025"
  ├─ POST /api/payments/create-intent
  ├─ POST /api/payments/confirm
  ├─ Webhook: /api/webhooks/stripe
  ├─ Error handling met Sentry
  └─ Result: ✅ Stripe backend ready

TAAK 5.2: Stripe Checkout UI
→ frontend-developer (60 min)
  ├─ Integrates Stripe Elements
  ├─ Creates PaymentForm component
  ├─ Handles payment errors
  └─ Result: ✅ Payment UI ready

TAAK 5.3: Payment Success/Failure
→ frontend-developer (30 min)
  ├─ Success page
  ├─ Failure handling
  └─ Result: ✅ Payment flows complete

TAAK 5.4: Test Payments
→ qa-software-tester (45 min)
  ├─ E2E: Successful payment (test card)
  ├─ E2E: Failed payment
  ├─ E2E: Webhook handling
  └─ Result: ✅ All tests passing

TAAK 5.5: Production Monitoring
→ qa-software-tester (30 min)
  ├─ Uses sentry-monitor skill
  ├─ Monitors for payment errors
  ├─ Sets up alerts
  └─ Result: ✅ Monitoring active

Sprint 5 Complete: 3 uur 45 min
Status: ✅ Betalingen volledig geïntegreerd
```

### Totaal Project Resultaat

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 E-COMMERCE PLATFORM - COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Database: 8 tabellen
✅ Backend: 25+ API endpoints
✅ Frontend: 15+ paginas en componenten
✅ Tests: 45+ E2E tests
✅ Monitoring: Sentry geïntegreerd
✅ Betalingen: Stripe volledig werkend

⏱️  Totale Tijd: 14 uur 55 minuten
💰 Kosten: ~$30-40 in API calls
📈 Kwaliteit: Production-ready

Vergelijk met traditioneel development:
- Traditioneel: 2-3 maanden (1 developer)
- AI Team: ~15 uur (volledig autonoom)
- Tijdwinst: 95%+
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Voorbeeld 2: SaaS Analytics Platform

**Project**: Analytics dashboard met real-time data, grafieken, en rapportage

### Project Structuur

```
Analytics Platform (4 sprints, ~18 uur totaal)

Sprint 1: Core Infrastructure (3 uur)
├─ Database setup (events tracking)
├─ Authentication
├─ API foundation
└─ Dashboard layout

Sprint 2: Data Collection (4 uur)
├─ Event tracking API
├─ Real-time data pipeline
├─ Data aggregation
└─ Storage optimization

Sprint 3: Visualizations (5 uur)
├─ Chart components (Chart.js)
├─ Dashboard widgets
├─ Custom reports
└─ Export functionality

Sprint 4: Advanced Features (6 uur)
├─ Filters en segments
├─ Scheduled reports
├─ Team collaboration
└─ API voor third-party integration
```

### Hoe het Team Werkt

```
User: "Bouw een analytics platform met real-time dashboards"

→ team-coordinator
  ↓
  PLANNING PHASE (team-coordinator + project-architect)
  ├─ Analyzes requirements
  ├─ Creates architecture document
  ├─ Designs database schema
  └─ Creates 4 sprints met 23 taken

  ↓

  SPRINT 1 EXECUTION
  ├─ backend-developer (6 taken - 90 min)
  │  └─ Database + Auth + Core API
  ├─ frontend-developer (4 taken - 70 min)
  │  └─ Dashboard layout + Auth UI
  └─ qa-software-tester (2 taken - 30 min)
     └─ E2E tests voor auth flow

  ↓

  SPRINT 2 EXECUTION
  ├─ backend-developer (5 taken - 120 min)
  │  └─ Event tracking + Data pipeline
  ├─ frontend-developer (3 taken - 90 min)
  │  └─ Real-time data display
  └─ qa-software-tester (2 taken - 30 min)
     └─ Performance tests

  ↓

  SPRINT 3 EXECUTION
  ├─ frontend-developer (7 taken - 180 min)
  │  └─ Charts, widgets, export
  ├─ backend-developer (2 taken - 60 min)
  │  └─ Export API
  └─ qa-software-tester (3 taken - 60 min)
     └─ Visual regression tests

  ↓

  SPRINT 4 EXECUTION
  ├─ backend-developer (4 taken - 140 min)
  │  └─ Advanced features API
  ├─ frontend-developer (5 taken - 160 min)
  │  └─ Filters, segments, collaboration UI
  └─ qa-software-tester (3 taken - 80 min)
     └─ Complete integration tests

  ↓

  DEPLOYMENT & MONITORING
  ├─ team-coordinator: Uses Git MCP
  │  └─ Commits, PR, deploy
  ├─ qa-software-tester: Uses sentry-monitor
  │  └─ Monitors for 48 uur
  └─ Result: ✅ Platform live in production
```

---

## Voorbeeld 3: Multi-Tenant SaaS CRM

**Project**: CRM systeem met klanten, deals, taken, en email integratie

### Complexiteit

- **Database**: 15+ tabellen met tenant isolation
- **Backend**: 40+ API endpoints
- **Frontend**: 25+ paginas en componenten
- **Integraties**: Email (SendGrid), Calendar (Google)
- **Features**: Role-based access, team collaboration, reporting

### Project Timeline

```
CRM Platform Development
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Week 1: Foundation (20 uur)
├─ Sprint 1: Multi-tenant setup
├─ Sprint 2: Authentication & Authorization
└─ Sprint 3: Core data models

Week 2: Core Features (22 uur)
├─ Sprint 4: Contact Management
├─ Sprint 5: Deal Pipeline
└─ Sprint 6: Task Management

Week 3: Advanced Features (24 uur)
├─ Sprint 7: Email Integration
├─ Sprint 8: Calendar Sync
└─ Sprint 9: Reporting & Analytics

Week 4: Polish & Deploy (18 uur)
├─ Sprint 10: UI/UX refinement
├─ Sprint 11: Performance optimization
└─ Sprint 12: Production deployment

TOTAAL: 84 uur (2 weken met AI team)
TRADITIONEEL: 6-9 maanden (team van 3-4 developers)
```

### Hoe Start Je Dit Project?

```
User: "Ik wil een multi-tenant CRM bouwen met contacten,
       deals, taken, en email integratie"

→ team-coordinator activates

Step 1: HIGH-LEVEL PLANNING (30 min)
→ project-architect
  ├─ Uses Sequential Thinking MCP
  │  └─ Analyzes: Multi-tenancy, RBAC, data isolation
  ├─ Uses Web Search MCP
  │  └─ Research: Best practices voor multi-tenant SaaS
  ├─ Creates architecture document
  └─ Designs database schema (15 tabellen)

Step 2: SPRINT BREAKDOWN (20 min)
→ sprint-orchestrator
  ├─ Creates 12 sprints
  ├─ 48 taken totaal
  ├─ Dependencies mapped
  └─ Estimates added

Step 3: CONTEXT STORAGE (5 min)
→ team-coordinator uses Memory MCP
  └─ Stores: "CRM, multi-tenant, email integration, 12 sprints"

Step 4: START DEVELOPMENT
→ team-coordinator
  ├─ "Execute Sprint 1: Multi-tenant setup"
  ├─ Delegates to backend-developer, frontend-developer, qa-tester
  └─ Monitors progress via todo-sync

⏱️  Setup Complete: 55 minuten
🚀 Ready to execute Sprint 1
```

---

## 🎯 Praktische Tips

### 1. Hoe Start Je Een Groot Project?

```
// STAP 1: Activeer team-coordinator
"Gebruik team-coordinator agent om [project beschrijving] te bouwen"

// STAP 2: Team-coordinator doet planning
Team-coordinator activeert automatisch:
- project-architect → Architectuur
- sprint-orchestrator → Sprint planning
- Memory MCP → Context opslaan

// STAP 3: Start development
"Start Sprint 1"

// STAP 4: Monitor progress
Team-coordinator houdt je up-to-date via TodoWrite
```

### 2. Best Practices voor Grote Projecten

**✅ DO:**
- Start met team-coordinator voor grote projecten
- Laat project-architect architectuur maken VOOR development
- Gebruik sprint-orchestrator voor task management
- Monitor met sentry-monitor na elke deployment
- Run E2E tests met qa-software-tester voor elke sprint

**❌ DON'T:**
- Niet direct backend-developer aanroepen voor grote projecten
- Niet beginnen zonder architecture plan
- Niet skippen van tests
- Niet zonder monitoring deployen

### 3. Wanneer Gebruik Je Welke Agent?

| Situatie | Gebruik |
|----------|---------|
| Nieuw groot project | `team-coordinator` |
| Alleen backend feature | `backend-developer` |
| Alleen frontend feature | `frontend-developer` |
| Bug fix | Juiste specialist (backend/frontend) |
| Test een feature | `qa-software-tester` |
| Plan een sprint | `sprint-orchestrator` |
| Architecture vraag | `project-architect` |

### 4. Hoe Communiceer Je Met Het Team?

```
// ✅ GOOD: Duidelijk en specifiek
"Gebruik team-coordinator om een e-commerce platform te bouwen
met Stripe betalingen, product catalog en winkelwagen"

// ✅ GOOD: Specifieke agent voor specifieke taak
"Gebruik backend-developer om een authentication API te bouwen
met JWT tokens en refresh token rotation"

// ❌ BAD: Te vaag
"Maak een website"

// ❌ BAD: Verkeerde agent
"Gebruik frontend-developer om een database schema te maken"
```

---

## 🔥 Geavanceerde Scenarios

### Scenario 1: Bestaand Project Uitbreiden

```
Situatie: Je hebt al een app, wil een nieuwe feature toevoegen

Step 1: Context geven aan team-coordinator
"Ik heb een bestaande app. Ik wil graag een notification
systeem toevoegen met real-time updates"

Step 2: Team-coordinator analyzes
→ project-architect: Analyzes existing codebase
→ Uses Sequential Thinking: WebSocket vs SSE vs Polling
→ Creates architecture plan

Step 3: Implementation
→ backend-developer: WebSocket server + API
→ frontend-developer: Real-time UI updates
→ qa-software-tester: E2E tests voor notifications

Tijd: 4-6 uur
Result: Feature toegevoegd, getest, deployed
```

### Scenario 2: Bug in Production

```
Situatie: Sentry alert - 500 error in checkout

Step 1: Automatic detection
→ qa-software-tester: sentry-monitor skill detecteert error

Step 2: Analysis
→ backend-developer
  ├─ Uses Sentry MCP
  │  └─ Gets error details, stack trace
  ├─ Uses Sequential Thinking MCP
  │  └─ Analyzes root cause
  └─ Identifies: Null pointer in payment service

Step 3: Fix
→ backend-developer
  ├─ Adds null check
  ├─ Adds unit test voor edge case
  └─ Commits fix

Step 4: Deploy & Verify
→ team-coordinator: Deploys hotfix
→ qa-software-tester: Monitors Sentry for 1 uur
→ Result: ✅ 0 errors, bug resolved

Tijd: 20-30 minuten
Result: Bug fixed, tested, deployed, verified
```

### Scenario 3: Performance Optimalisatie

```
Situatie: Dashboard laadt langzaam (3+ seconden)

Step 1: Analysis
→ qa-software-tester
  ├─ Uses e2e-tester (Playwright MCP)
  │  └─ Measures load time: 3.2 seconds
  ├─ Identifies bottleneck: N+1 query probleem

Step 2: Backend Optimization
→ backend-developer
  ├─ Uses Sequential Thinking MCP
  │  └─ Plans: Query optimization, caching
  ├─ Uses PostgreSQL MCP
  │  └─ Tests queries with EXPLAIN ANALYZE
  ├─ Implements: Eager loading, Redis caching
  └─ Result: API response 80% sneller

Step 3: Frontend Optimization
→ frontend-developer
  ├─ Implements: React.memo, useMemo
  ├─ Adds: Suspense + lazy loading
  ├─ Optimizes: Bundle size (code splitting)
  └─ Result: Initial load 60% sneller

Step 4: Verify
→ qa-software-tester
  ├─ E2E test: Load time now 0.8 seconds
  └─ Result: ✅ 75% improvement

Tijd: 3-4 uur
Result: Dashboard 75% sneller
```

---

## 📊 Wat Kan Het Team Zelfstandig?

### ✅ Volledig Autonoom (Geen Menselijke Input Nodig)

- Architecture design (met project-architect)
- Database schema design (met PostgreSQL MCP)
- API implementation (backend-developer)
- UI implementation (frontend-developer)
- Unit + Integration + E2E tests (qa-software-tester)
- Bug detection en fixes (sentry-monitor)
- Performance optimization
- Code refactoring
- Documentation updates
- Git commits + PRs (Git MCP)
- Deployment verification

### ⚠️ Vereist Goedkeuring

- Major architectural changes (bijv. microservices → monolith)
- Breaking API changes
- Database migrations in production
- Security model changes
- Budget-impacting beslissingen (externe services)
- UX/design choices (als niet gespecificeerd)

---

## 🎓 Quick Start Voorbeelden

### Klein Project (3-5 uur)
```
"Gebruik team-coordinator om een todo app te bouwen
met authentication en real-time sync"
```

### Medium Project (10-20 uur)
```
"Gebruik team-coordinator om een blog platform te bouwen
met markdown editor, comments, en analytics"
```

### Groot Project (40-80 uur)
```
"Gebruik team-coordinator om een project management tool
te bouwen zoals Asana, met boards, tasks, teams, en time tracking"
```

### Enterprise Project (100+ uur)
```
"Gebruik team-coordinator om een volledig ERP systeem te bouwen
met inventory, orders, invoicing, en multi-company support"
```

---

## 💡 Pro Tips

1. **Start altijd met team-coordinator voor projecten > 3 uur**
2. **Laat project-architect architectuur maken VOOR je start**
3. **Gebruik Memory MCP om context te bewaren tussen sessies**
4. **Monitor ALTIJD met Sentry na deployment**
5. **Run E2E tests voor ELKE belangrijke feature**
6. **Gebruik Sequential Thinking voor complexe beslissingen**

---

## 🎯 Volgende Stappen

1. **Setup MCPs**: Zie `.claude/MCP_SETUP.md`
2. **Lees Team Guide**: Zie `.claude/AI_SOFTWARE_TEAM.md`
3. **Start Klein**: Begin met een simpel project
4. **Scale Up**: Ga naar grotere projecten als je vertrouwd bent

**Ready to build?**

Start met: `"Gebruik team-coordinator om [jouw project] te bouwen"`
