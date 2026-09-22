# Tooling, MCPs & Skills (heart.md §21, condensed)

> Before starting ANY project, verify the toolchain. If something is missing, inform the user and provide the install/auth command — never silently skip.

## Preflight CLI check (run at project start; heart.md 21.1)

```bash
node --version        # 20.x+
pnpm --version        # 9.x+ (npm install -g pnpm if missing)
git --version         # 2.x+
gh auth status        # must be authenticated
vercel whoami         # must be authenticated
railway whoami        # must be authenticated (or railway status)
npx playwright --version  # install with npx playwright install
```

If any tool is missing/unauthenticated: inform the user, give the install/auth command, ask them to run it (some auth needs interactive browser login), verify again after.

## Core MCP servers (heart.md 21.2 — use when present)

| Server | Purpose |
|--------|---------|
| Filesystem | read/write/edit files, list/search |
| Git | status, add, commit, diff, log, branch management |
| **Playwright / Browser** | CRITICAL for E2E: navigate, click, fill, screenshot, console/network checks |
| Railway | deploy to Railway, environments, variables, domains, logs |
| Memory | persist project context (keyed `Project-<Name>`), CRITICAL for resume |
| Fetch / Web | verify live URLs, fetch docs/APIs |
| Code Runner | quick validation scripts |
| Context7 | latest library docs |

## Skills to load when relevant (heart.md 21.3)
- **use-railway** — before any Railway deployment
- **blueprints** (this skill) — the product system itself
- Any framework-specific skills for the chosen stack

## API tokens & auth checklist (21.4)
- GitHub (gh), Vercel, Railway, and any third-party (OpenAI/Anthropic/Google, Stripe/Razorpay, Resend, Sentry, PostHog) tokens available in env — never hardcoded.

## Browser MCP for testing (21.6)
- Navigate, snapshot, click, type, fill forms, screenshot; check console messages and network requests; evaluate JS when needed — the E2E backbone.

## Memory/context tools (21.7)
- Persist project state at every milestone; search by `Project-<Name>` on resume.

## Token & context efficiency (heart.md §22)
- Save to memory BEFORE context runs out, never after.
- Use references/greps instead of re-reading full files.
- Avoid repeating large context; store decisions in memory/files instead.

## Recommended automation
- GitHub Actions CI: lint → type-check → test → build → E2E (heart.md §14)
- Husky + lint-staged + commitlint for git hygiene (heart.md 19.5)
- Sentry + structured logging (Pino) + health checks for monitoring (heart.md §12)