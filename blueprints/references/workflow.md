# New Project Workflow (Full)

> Condensed from `~/blueprints/Your New Project Workflow.md`.

## Step 0 — Start
The AI agent (any tool: OpenCode, Claude Code, Cursor, Codex, Gemini, Grok):
reads `~/blueprints/heart.md` completely (the project bible), follows every
instruction, then builds the user's one-line idea.

## What happens next (the AI does this)
1. **Min 1-5:** Read heart.md; run preflight check (Node, pnpm, gh, vercel, railway CLIs); load relevant skills (use-railway, etc.).
2. **Min 5-15:** Ask the PROJECT INTAKE questionnaire (10 topics) → product name, features, audience, integrations, AI needs, etc.
3. **Min 15-25:** Ask the DESIGN INTAKE questionnaire (8 questions) → aesthetic, colors, fonts, component strategy, etc.
4. **Min 25-60:** Generate Phase 0 docs (SCOPE, SCHEMA, API, WIREFRAMES, ADR, BRAND, decks). Present to user for review.
5. **YOU REVIEW:** User reads docs, requests changes, says "approved".
6. **Hours 2-20:** Build Phase 1 modular monolith — git repo with main + staging branches; **deploy to staging after each major feature**; give live staging link; run smoke tests with browser MCP.
7. **After all features:** Full E2E test on staging; show test report; ask user "Ready for production? Want me to create PR to main?"
8. **User decides:** "Yes, push to production" / "Fix X first" / "I'll do it later".

## Roles
| User does | AI does |
|-----------|---------|
| Describe the product idea | Read heart.md, follow the blueprint |
| Answer questionnaires (~10 min) | Generate all documentation |
| Review and approve docs | Build the entire application |
| Verify staging live link | Deploy to staging automatically |
| Say "push to production" | Create PR, merge, deploy to production |
| Use the product, give feedback | Fix issues, re-deploy, re-test |
| Say "yes" for any data deletion | NEVER delete/truncate DB without explicit approval |
| Review task reports | Structured report after every task |

## If a session runs out of context
Start a new session and say: "Read ~/blueprints/heart.md and ~/blueprints/quick-start.md. Check Memory MCP for project state (search `Project-[Name]`). Continue where you left off." The agent saved progress to Memory MCP at every milestone so it picks up seamlessly.

## Quick MVP
"Read ~/blueprints/quick-start.md. Build me an MVP of [idea]. Skip Phases 2-4, just do Phase 0 + Phase 1. Deploy to staging when done."

## Cheat sheet (trigger phrases)
| Situation | Say |
|-----------|-----|
| New full project | "Read ~/blueprints/heart.md. Build: idea" |
| Quick MVP | "Read ~/blueprints/quick-start.md. MVP of: idea" |
| Resume after reset | "Read quick-start.md + check Memory MCP for Project-Name" |
| Add mobile app | "Read heart.md Section 7. Add Expo mobile app." |
| Redesign UI | "Read heart.md Section 8. Redesign following the design bible." |
| Add a feature | "Read quick-start.md. Add feature following the git workflow." |
| Deploy to production | "Follow heart.md Section 19.8 — run the Ask User gate." |

The heart.md file does the heavy lifting — the user just steers.