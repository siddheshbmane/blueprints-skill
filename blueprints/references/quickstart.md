# Quick-Start Reference (MVP)

> Condensed from `~/blueprints/quick-start.md`. This is a cheat sheet, NOT the full blueprint.
> For full detail read `~/blueprints/heart.md`.

## What heart.md is
A universal SaaS project bible (v4.2, 39 sections, ~8,700 lines) that tells an AI coding agent exactly how to build a production-grade SaaS — documentation through deployment, with award-winning design, enterprise architecture, mobile apps, marketing website, brand identity, investor decks, and go-to-market strategy.

## Phase Summary

| Phase | What | Duration | Gate |
|-------|------|----------|------|
| 0 | Documentation + Brand (Scope, Schema, API, Wireframes, ADR, Brand, Investor Deck) | Week 1 | All 8 deliverables approved |
| 1 | Modular Monolith (core features FIRST, auth/billing LAST, marketing site at end) | Weeks 2-6 | App works, marketing live |
| 2 | Monorepo Extraction (Turborepo, separate API) | Weeks 7-8 | All apps deploy independently |
| 3 | Hardening (Testing, CI/CD, Security, Monitoring) | Weeks 9-10 | Tests pass, CI green, Sentry active |
| 4 | Mobile App (Expo / React Native) | Weeks 11-14 | Store-ready |
| 5 | Go-to-Market | Weeks 15-17 | GTM menu complete |

## Tech Stack Decision (heart.md 10.1) — ASK during intake, don't default

| Path | When | Backend | Frontend |
|------|------|---------|----------|
| A: TypeScript Full-Stack | Standard SaaS (dashboards, CRUD, B2B) | Node.js/Bun + Next.js | Next.js 15 |
| B: Python + FastAPI | AI-native / agentic apps (50%+ AI logic) | Python + FastAPI | Next.js 15 |
| C: Hybrid | SaaS with significant AI (20-50%) | Next.js + FastAPI | Next.js 15 |

Shared: Next.js 15 App Router + TS strict, Tailwind + shadcn/ui (heavily customized), PostgreSQL (+PGVector), Prisma (TS)/SQLAlchemy (Python), Zod/Pydantic, Better Auth/Auth.js v5, TanStack Query, Zustand, Framer Motion, Lucide, React Email + Resend, Stripe/Razorpay/LemonSqueezy, Vercel AI SDK/LangChain/LangGraph, Vitest + Playwright, Expo, Turborepo + pnpm, GitHub Actions.

## Git Branch Model
```
main (production) ← PR from staging (merge commit)
staging           ← PR from feature/* (squash merge)
feature/*         ← Development happens here
```
Workflow: feature → PR to staging → CI passes → merge → auto-deploy staging → smoke test → report → after all features: full E2E → ask user → PR to main → production.

## Design Quick Rules
```
BANNED: Purple/violet AI gradients, default shadcn themes, loading spinners
USE:    Variable fonts (Satoshi, Geist, Plus Jakarta Sans), skeleton screens
MODE:   Light-first, dark mode available, both equally polished
LAYOUT: Mobile-first, 4px grid, 375/768/1280px breakpoints
A11Y:   WCAG 2.2 AA, min 4.5:1 contrast, keyboard nav, screen readers
MOTION: Subtle (<350ms), purposeful, respect prefers-reduced-motion
```

## Deployment (Dual-Instance)
```
STAGING: staging branch → staging.yourapp.com + api-staging.yourapp.com
PROD:    main branch    → yourapp.com + api.yourapp.com
Vercel:  Next.js frontends (web, admin, landing)
Railway: API server + PostgreSQL + Redis
Each environment: own DB, Redis, env vars, domain. NEVER share DBs staging/prod.
```

## Preflight (run at project start)
```
[ ] Node.js 20+ (or Bun 1.x)     [ ] pnpm 9+
[ ] Python 3.12+ & uv (Path B/C) [ ] gh CLI authenticated
[ ] Vercel CLI authenticated      [ ] Railway CLI authenticated
[ ] Browser MCP available         [ ] Memory MCP available
```

## Phase 0 Docs (generate ALL before coding)
SCOPE.md, SCHEMA.md, API.md, WIREFRAMES.md, ADR.md, BRAND.md, INVESTOR-DECK.pptx (if fundraising), PRODUCT-DECK.pptx (deferred past Phase 1 for real screenshots).

## Key checklists
**Before staging:** P0 features functional; auth works; multi-tenant isolation verified; UI on design system; light+dark polished; mobile responsive; no type errors; no console errors.
**Before production:** tests passing (>80% unit, integration, E2E); CI green; security headers; rate limiting; Sentry; Lighthouse > 90; E2E report PASSED; user approved via Ask-User gate.

## Section Reference (heart.md) — read the real file for depth
1 AI Agent Instructions · 2 Philosophy · 3 Phase 0 Docs+Brand · 4 Phase 1 Monolith · 5 Phase 2 Monorepo · 6 Phase 3 Hardening · 7 Phase 4 Mobile · 8 Design System · 9 Multi-Tenancy (9.6 Super Admin) · 10 Tech Stack · 11 Security · 12 Monitoring · 13 Deployment · 14 CI/CD · 15 API Style · 16 State Mgmt · 17 Timeline · 18 Pre-Flight · 19 Git Strategy (19.8 Ask-User gate) · 20 Deploy Pipeline · 21 MCP & Tools · 22 Token Efficiency · 23 E2E Testing · 24 Email · 25 Onboarding · 26 SEO · 27 Caching · 28 Feature Flags · 29 Analytics · 30 Background Jobs · 31 Legal · 32 Changelog · 33 Advanced Patterns · 34 Starter Template · 35 Brand Foundation · 36 Marketing Website · 37 Feature Landing Pages · 38 Sales & Investor · 39 Phase 5 GTM.