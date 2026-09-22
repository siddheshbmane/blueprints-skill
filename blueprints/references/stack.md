# Tech Stack Reference (heart.md §10, condensed)

> Choose per project during intake. Do NOT default to one stack.

## Stack Decision Framework (10.1)

| Path | When | Backend | Frontend |
|------|------|---------|----------|
| **A: TypeScript Full-Stack** | Standard SaaS (dashboards, CRUD, B2B) | Node.js/Bun + Next.js | Next.js 15 |
| **B: Python + FastAPI** | AI-native / agentic apps (50%+ AI logic) | Python + FastAPI | Next.js 15 |
| **C: Hybrid** | SaaS with significant AI (20-50%) | Next.js + FastAPI | Next.js 15 |

## Shared stack (all paths)

| Layer | Technology |
|-------|-----------|
| Frontend | Next.js 15 (App Router) + TypeScript (strict) |
| Styling | Tailwind CSS + shadcn/ui (heavily customized) |
| Database | PostgreSQL (+ PGVector if AI/RAG) |
| ORM | Prisma (TS) / SQLAlchemy (Python) |
| Validation | Zod (TS) / Pydantic (Python) |
| Auth | Better Auth / Auth.js v5 |
| Server state | TanStack Query |
| Client state | Zustand (or Jotai) |
| Animations | Framer Motion (web) / Reanimated (mobile) |
| Icons | Lucide React |
| Email | React Email + Resend |
| Payments | Stripe / Razorpay / LemonSqueezy |
| AI | Vercel AI SDK / LangChain / LangGraph |
| Testing | Vitest + Playwright |
| Mobile | Expo (React Native) |
| Monorepo | Turborepo + pnpm |
| CI/CD | GitHub Actions |

## API style (heart.md §15)
- Decision matrix: tRPC vs REST vs GraphQL.
- Default: REST (or tRPC in full-TS monoliths). No GraphQL unless deeply relational needs flexible queries.

## State management (heart.md §16)
- Separate server state (TanStack Query) from client state (Zustand). Never mix.

## Architecture principles
- Modular monolith first (Phase 1), monorepo extraction later (Phase 2). No microservices unless 20+ devs / millions of users.
- Services framework-agnostic (shareable with mobile later). Mobile is inevitable (Phase 4).
- TypeScript strict; no loose `any`. Python: type hints + Pydantic.
- Multi-tenant from day 1 — `organizationId` on every table (heart.md §9).

## Deployment targets (heart.md §13/20)
- Vercel: Next.js frontends (web, admin, landing)
- Railway: API server + PostgreSQL + Redis
- Dual-instance: staging + production, each with own DB/Redis/env/domain. NEVER share DBs between staging and production.
- Always staging first; Ask-User gate before production (see deploy.md).

## Security baseline (heart.md §11)
- OWASP Top 10, security headers/CSP, rate limiting, input validation, secrets via env vars (never hardcode).

## Monitoring (heart.md §12)
- Sentry error tracking, structured logging (Pino), health check endpoint, uptime monitoring.