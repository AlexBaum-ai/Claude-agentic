# Multi-Agent Project Workflow

You are orchestrating a complete project development workflow with user approval checkpoints.

## User Input Required

The user should provide a project description. If they haven't, ask:
"Please describe the project or feature you want to build."

## Workflow Phases

### Phase 1: Architecture Design (project-architect role)

**Adopt the project-architect persona:**
- Analyze the project requirements thoroughly
- Design system architecture
- Create technical documentation:
  - `/projectdoc/01-PROJECT-BRIEF.md`
  - `/projectdoc/02-FOLDER-STRUCTURE.md`
  - `/projectdoc/03-DATABASE-SCHEMA.md`
  - `/projectdoc/04-API-ENDPOINTS.md`
  - `/projectdoc/05-TECH-STACK.md`
  - `/projectdoc/06-WORKFLOWS.md`
  - `/projectdoc/07-IMPLEMENTATIE-ROADMAP.md`
  - `/projectdoc/README.md`

**Skills to use:**
- `memory-keeper` - Store architectural decisions
- `web-researcher` - Research technologies if needed
- `deep-thinker` - Complex design decisions

**After completion:**
Present a summary of the architecture and ask:
"✅ Architecture design complete. Review the `/projectdoc/` files.

**Ready for sprint planning?**
- Reply 'yes' to proceed to Phase 2
- Reply 'changes needed' to revise the architecture
- Tell me what to adjust"

**STOP AND WAIT FOR USER APPROVAL**

---

### Phase 2: Sprint Planning (sprint-orchestrator role)

**Only proceed if user approved Phase 1.**

**Adopt the sprint-orchestrator persona:**
- Read the architecture documentation from Phase 1
- Break the project into logical sprints (1-2 weeks each)
- Categorize tasks by role (backend/frontend/qa)
- Create sprint JSON files in `.claude/sprints/`
- Create TODO tracking in `.claude/TODO/`
- Initialize `.claude/PROGRESS.md`

**Directory structure to create:**
```
.claude/
├── sprints/
│   ├── sprint-1.json
│   ├── sprint-2.json
│   └── sprint-N.json
├── TODO/
│   └── (copies of sprint files for active work)
├── DONE/
│   └── (completed tasks archive)
└── PROGRESS.md (real-time dashboard)
```

**After completion:**
Present sprint summary and ask:
"✅ Sprint planning complete. Created:
- Sprint 1: [X tasks] - [Focus area]
- Sprint 2: [X tasks] - [Focus area]
- Sprint N: [X tasks] - [Focus area]

**Ready to start autonomous implementation?**
- Reply 'yes' to begin Phase 3 (autonomous backend → frontend → QA)
- Reply 'adjust sprints' to modify the sprint breakdown
- Tell me what to change"

**STOP AND WAIT FOR USER APPROVAL**

---

### Phase 3: Autonomous Implementation

**Only proceed if user approved Phase 2.**

**Now work through sprints autonomously with these sub-phases:**

#### Sub-Phase 3A: Backend Development (backend-developer role)

**For each backend task in sprint:**

1. **Invoke skills:**
   - Use Skill tool: `sprint-reader` - Read task details
   - Use Skill tool: `task-tracker` - Mark task in-progress
   - Use Skill tool: `todo-sync` - Create todo items

2. **Adopt backend-developer persona:**
   - Implement APIs following `backend-dev-guidelines` skill
   - Use Skill tool: `postgres-manager` if database work needed
   - Use Skill tool: `docker-manager` if containers needed
   - Use Skill tool: `error-tracking` for Sentry integration
   - Write unit tests
   - Follow layered architecture (routes → controllers → services → repositories)

3. **Complete task:**
   - Use Skill tool: `task-tracker` - Mark completed
   - Use Skill tool: `todo-sync` - Sync completion
   - Update PROGRESS.md

**After all backend tasks:**
"✅ Backend implementation complete:
- [List completed tasks]
- API endpoints ready
- Database migrations applied
- Tests passing

Proceeding to frontend development..."

---

#### Sub-Phase 3B: Frontend Development (frontend-developer role)

**For each frontend task in sprint:**

1. **Invoke skills:**
   - Use Skill tool: `sprint-reader` - Read task details
   - Use Skill tool: `task-tracker` - Mark task in-progress
   - Use Skill tool: `todo-sync` - Create todo items

2. **Adopt frontend-developer persona:**
   - Build React components following `frontend-dev-guidelines` skill
   - Use backend APIs from Phase 3A
   - Use Skill tool: `e2e-tester` for Playwright testing
   - Follow MUI v7 patterns, modern React patterns (Suspense, lazy loading)
   - Implement proper loading states, error boundaries

3. **Complete task:**
   - Use Skill tool: `task-tracker` - Mark completed
   - Use Skill tool: `todo-sync` - Sync completion
   - Update PROGRESS.md

**After all frontend tasks:**
"✅ Frontend implementation complete:
- [List completed tasks]
- UI components ready
- Integration with backend verified
- E2E tests passing

Proceeding to QA testing..."

---

#### Sub-Phase 3C: Quality Assurance (qa-software-tester role)

**For each QA task in sprint:**

1. **Invoke skills:**
   - Use Skill tool: `sprint-reader` - Read task details
   - Use Skill tool: `task-tracker` - Mark task in-progress
   - Use Skill tool: `todo-sync` - Create todo items

2. **Adopt qa-software-tester persona:**
   - Use Skill tool: `test-validator` - Run all tests
   - Use Skill tool: `e2e-tester` - Comprehensive E2E testing
   - Use Skill tool: `spec-guardian` - Verify spec compliance
   - Use Skill tool: `sentry-monitor` - Check error tracking
   - Test all acceptance criteria from sprint tasks
   - Security testing, performance testing, edge cases

3. **Complete task:**
   - Use Skill tool: `task-tracker` - Mark completed
   - Use Skill tool: `todo-sync` - Sync completion
   - Update PROGRESS.md
   - Create test report

**After all QA tasks:**
"✅ QA testing complete:
- Unit tests: [X/X] passing
- Integration tests: [X/X] passing
- E2E tests: [X/X] passing
- Spec compliance: ✅ 100%
- Security: ✅ Verified
- Performance: ✅ Acceptable

Sprint [N] complete and ready for deployment."

---

### Phase 4: Sprint Completion

**Mark sprint as complete:**
- Move tasks from `.claude/TODO/sprint-N.json` to `.claude/DONE/`
- Update `.claude/PROGRESS.md` with completion status
- Create sprint summary report

**Ask user:**
"✅ Sprint [N] Complete!

**Next steps:**
- 'next sprint' - Continue to Sprint [N+1]
- 'deploy' - Deploy current work
- 'review' - Review implementation
- 'stop' - Stop workflow"

**WAIT FOR USER INPUT**

---

## Checkpoint Rules

1. **ALWAYS STOP after Phase 1** - User must approve architecture
2. **ALWAYS STOP after Phase 2** - User must approve sprints
3. **Phase 3 runs autonomously** - No stops unless errors occur
4. **STOP after each sprint** - User decides to continue or stop

## Error Handling

If errors occur during Phase 3:
1. Document the error clearly
2. Use Skill tool: `task-tracker` to mark task as blocked
3. Stop and ask user for guidance
4. Do not proceed until blocker is resolved

## Skills Available Throughout

- `sprint-reader` - Read sprint task details
- `task-tracker` - Update task status
- `todo-sync` - Sync with TodoWrite tool
- `backend-dev-guidelines` - Backend patterns
- `frontend-dev-guidelines` - Frontend patterns
- `test-validator` - Test validation
- `spec-guardian` - Spec compliance
- `e2e-tester` - E2E testing
- `postgres-manager` - Database management
- `docker-manager` - Container management
- `git-operations` - Git operations
- `sentry-monitor` - Error monitoring
- `memory-keeper` - Persistent memory
- `web-researcher` - Technical research
- `deep-thinker` - Complex reasoning
- `error-tracking` - Error handling patterns

## Important Notes

- This workflow uses **role-switching**, not actual separate agents
- All work happens in the main Claude conversation
- Skills provide guidance and functionality
- User approval required at key checkpoints
- Progress tracked in `.claude/PROGRESS.md` and sprint JSON files
