# Deployment & Production Gate (heart.md §13/18/19.8/20, condensed)

> Deployment is NOT complete until all 5 steps are done. Do NOT say "deployed successfully" until Step 5.

## Build-Deploy-Verify workflow (heart.md 1.3.2)

```
STEP 1: PRE-DEPLOY
  → Run build locally (npm run build / pnpm build)
  → Fix ALL build, type, lint errors
  → Verify environment variables set correctly
  → Check the correct branch is being deployed

STEP 2: DEPLOY
  → Push to correct branch / run deploy command
  → Wait for deployment to fully complete

STEP 3: BUILD VERIFICATION
  → Check Vercel/Railway build logs for errors/warnings
  → If build failed: read full error → diagnose → FIX → redeploy
  → Do NOT just paste the error to the user — fix it

STEP 4: LIVE URL VERIFICATION (MANDATORY)
  → Using browser tools or HTTP fetch, verify on the LIVE URL:
    • Page loads (not 404, 500, or blank)
    • The specific changes are actually visible
    • UI not broken (layouts, missing styles, console errors)
    • Brand/design alignment (colors, fonts, spacing)
    • Functional test — does the feature actually WORK?

STEP 5: REPORT
  → Deployment URL, build status, what changed,
    what was verified live, issues found & how resolved
```

## Pre-Flight checks (heart.md §18)

**Before staging:** P0 features functional · auth works (register, login, logout, reset) · multi-tenant isolation verified · UI on design system · light+dark polished · mobile responsive · no type errors · no console errors.

**Before production:** all tests passing (>80% unit, integration, E2E) · CI green · security headers configured · rate limiting active · Sentry configured · Lighthouse > 90 · E2E report PASSED · user approved via Ask-User gate.

## The "Ask User" Gate (heart.md 19.8 — CRITICAL, before ANY production deploy)

After ALL features are complete and deployed to staging:

1. Run full E2E test suite on staging
2. Generate test report
3. Present to the user (staging URL + E2E results + options):
   - a) "I'll create a PR from staging → main for production deploy. Proceed?"
   - b) "You can create the PR manually when ready."
   - c) "There are issues — let me fix them first."
4. **WAIT for user response. NEVER auto-merge to main.**
5. If user says proceed: create PR staging→main with full test report in body → merge → verify production deployment → report production URL.
6. If manual: acknowledge + provide instructions.
7. If issues: new feature/* branch → fix → re-deploy staging → re-test → return to step 3.

## Dual-instance architecture (20.1)

```
STAGING: staging branch → staging.yourapp.com + api-staging.yourapp.com
PROD:    main branch    → yourapp.com + api.yourapp.com

Vercel:  Next.js frontends (web, admin, landing)
Railway: API server + PostgreSQL + Redis
Each environment has its own DB, Redis, env vars, domain.
NEVER share databases between staging and production.
```

## Git model (heart.md §19)

```
main (production) ← PR from staging (merge commit)
staging           ← PR from feature/* (squash merge)
feature/*         ← development happens here
```

- Protect main AND staging with branch protection rules (19.3)
- Conventional commits (19.9); Husky + lint-staged + commitlint (19.5)
- PR templates: staging PR and production release templates (19.7)
- Feature → PR to staging → CI passes → merge → auto-deploy staging → smoke test → report → after all features: full E2E → Ask-User gate → PR to main → production.

## Error recovery (heart.md 1.3.5)
1. Don't retry blindly — if it failed twice with the same error, DIAGNOSE first.
2. Don't rollback/revert without asking — user may prefer to fix forward.
3. Don't panic-fix — read the full error, find root cause, fix systematically.
4. Document what went wrong (error, cause, fix) in the report.
5. Don't use destructive shortcuts (--no-verify, --force) to "just make it work".