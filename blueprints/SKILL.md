---
name: blueprints
description: >
  Siddhesh's product blueprint system. Use when starting a new SaaS/product
  project, building an MVP, adding a feature to an existing product,
  resuming a project after a context reset, reviewing a product with the
  due-diligence protocol, running the production deployment gate, or when
  the user says "read heart.md", "follow the blueprints", "new project
  workflow", "quick-start.md", "product dd", or "Phase 0 / intake".
  Enforces documentation-first development, project + design intake
  questionnaires, multi-tenant design, no-AI-slop UI rules, staging-before-
  production deploys, browser-based user-flow E2E tests, and a mandatory
  task report after every change.
license: MIT
compatibility: opencode, anthropic, openai, google, generic
metadata:
  author: Siddhesh
  source: ~/blueprints
  version: 4.2
---

# Blueprints — Siddhesh's Product Development System

You are executing Siddhesh's product blueprint. It is a documentation-first,
qualify-first build system for production-grade SaaS products. The full
authoritative source is `~/blueprints/heart.md` (v4.2, ~8,700 lines). This
skill is the portable, tool-agnostic distilled version so it works in
OpenCode, Claude Code, Codex, Grok, Gemini, Cursor, and any agent that
supports the SKILL.md Agent Skills format.

## The Golden Rules (non-negotiable)

1. **Read `~/blueprints/heart.md` FIRST, entirely, before anything** — if it is present on this machine. In this skill, `references/` contains the distilled operating content and always wins over approximate recall, but `heart.md` is the source of truth for full detail.
2. Ask the **PROJECT INTAKE questionnaire** (heart.md 1.4; condensed in `references/questionnaires.md`) before any work.
3. Ask the **DESIGN INTAKE questionnaire** (heart.md 8.2; condensed in `references/questionnaires.md`) before any UI work.
4. Generate ALL **Phase 0 docs** (SCOPE, SCHEMA, API, WIREFRAMES, ADR, BRAND, decks). Get user **APPROVAL before coding**. Never skip Phase 0.
5. **Multi-tenant from Day 1** — `organizationId`/`tenantId` on EVERY table.
6. **No AI slop design.** No purple/violet AI gradients, no default shadcn themes. Award-winning UI only (see `references/design.md`).
7. Services must be **framework-agnostic** (shareable with mobile later).
8. **Deploy to STAGING first.** Ask user before production. **NEVER auto-merge to main** (see `references/deploy.md` § Ask User gate).
9. Run E2E tests **with browser tools** after every major feature and after all tasks. "API returns 200" is NOT a test — simulate real user flows (see `references/testing.md`).
10. Save progress to memory (Memory MCP or equivalent) at every milestone so projects can be resumed after context resets (see `references/resume.md`).

PRODUCTION GUARDIAN RULES (non-negotiable):
11. NEVER delete/truncate/alter database data without explicit user "yes". Only DELETE records you created during the session.
12. NEVER claim "deployed" until the build is verified AND the live URL is checked.
13. NEVER test with just API status codes — create real user flows, test CRUD end-to-end.
14. ALWAYS end every task with a structured report (changes, deploy, tests, brand, known issues).
15. ALWAYS understand the product BEFORE coding — read docs, check the live URL, know the users.

## The Phase Roadmap

| Phase | What | Gate |
|-------|------|------|
| **0** | Documentation + Brand (SCOPE, SCHEMA, API, WIREFRAMES, ADR, BRAND, decks) | All 8 deliverables approved by user |
| **1** | Modular Monolith (core features FIRST, auth/billing last, marketing site at end) | App works, staging live |
| **2** | Monorepo Extraction (Turborepo, separate API) | All apps deploy independently |
| **3** | Hardening (Testing, CI/CD, Security, Monitoring) | Tests pass, CI green |
| **4** | Mobile App (Expo / React Native) | Store-ready |
| **5** | Go-to-Market (sales, SEO, email, social, PLG) | GTM menu complete |

> Monolith first, extract later. No microservices unless 20+ devs. No GraphQL by default. No Redux. No CSS-in-JS runtime. No Create React App. Docs before code. Always.

## How to use this skill

- **New full project** → `references/workflow.md` (full walkthrough), then `references/phase0.md`, then build per `references/stack.md`.
- **Quick MVP** → `references/quickstart.md`, then `references/phase0.md` (scoped down), build, deploy to staging.
- **Resume after context reset** → `references/resume.md` (memory lookup, re-orient, continue).
- **Add a feature** → `references/feature-workflow.md` (branch → staging → smoke → report).
- **Deploy to production** → `references/deploy.md` (Ask User gate, pre-flight, verify).
- **Review a product / due diligence** → `references/dd.md` (the product-dd-kit protocol).
- **Need the canonical deep section** (design bible, super admin, security, E2E protocol, marketing site, GTM) → tell the user to let you read `~/blueprints/heart.md` Section N, and read that file when available.

## Environment expectations

- Tools: Node 20+, pnpm 9+, gh CLI, Vercel CLI, Railway CLI authenticated, Playwright/browser tools available. See `references/tooling.md` for the preflight checklist.
- Memory: persist project state to Memory MCP / equivalent keyed as `Project-<Name>` after every milestone.
- If any expected tool/MCP is missing, inform the user and provide the install command; never silently skip safety or verification steps.

## Output requirements

Every task ends with a report: **Task Summary → Changes Made → Deployment → Testing Results (user flows) → Brand & Design check → Known Issues/Follow-ups**. Use the template in `references/task-report.md`.