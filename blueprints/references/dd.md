# Product Due Diligence (product-dd-kit)

> Condensed from `~/blueprints/product-dd-kit/` — a portable, tool-agnostic product due-diligence kit
> (works in OpenCode, Claude Code, Codex, Gemini, ChatGPT, or manually).
> Full protocol: `~/blueprints/product-dd-kit/PRODUCT_DUE_DILIGENCE_PROTOCOL.md`
> Report template: `~/blueprints/product-dd-kit/PRODUCT_DUE_DILIGENCE_REPORT_TEMPLATE.md`

## Purpose
Evaluate one product, multiple products, multiple versions, codebase quality, runtime quality, market readiness, founder fit, investor readiness.

## Principles
- Evidence over opinion.
- Claims separated from verified reality: **Claimed** (docs/marketing) vs **Implemented** (code/config) vs **Verified** (tested/observed) vs **Inferred**.
- Untested is not the same as broken. States: Verified Working · Verified Broken · Partially Working · Claimed Only · Not Tested · Unknown · Blocked.
- Breadth is not depth. Stage-aware judgment (concept → prototype → internal tool → MVP → beta → live → growth SaaS).

## Review phases (11)
1. **Framing** — review mode (single/multi/version/product+market), product stage, intended customer/buyer, what decision this review supports.
2. **Product understanding** — README, docs, scope, pitches, manifest, deploy config, brand copy. Write: thesis, target user, target buyer, primary workflow, differentiation claim.
3. **Codebase & architecture** — structure, API, schema, auth model, integrations, jobs, env config, feature flags, mock data, storage/export. Classify: concept demo / UI prototype / internal ops tool / technical MVP / real SaaS MVP / mature foundation.
4. **Feature inventory** — table: Feature | Claimed | Code Exists | Runtime Seen | Fully Verified | Notes.
5. **Runtime validation** — install/boot/build, env requirements, missing secrets, port conflicts, migration failures. Final states: runs cleanly / with warnings / partially / fails / not attempted / blocked.
6. **User-flow testing** — landing → login/signup → create main object → dashboard → primary workflow → inspect output → supporting modules → reporting/settings. Record: Flow | Steps | Expected | Actual | Status (PASS/FAIL/PARTIAL/BLOCKED/NOT TESTED).
7. **API & data validation** — is data realistic? core counts populated? UI/API mismatch? Output: real-data driven / mixed / mostly mock / mostly fake.
8. **UX & execution quality** — layout consistency, copy, nav, loading/empty states, responsiveness, polish, trust signals, error handling, performance feel.
9. **Security, reliability, ops risk** — hardcoded credentials, dev-only auth bypass, weak authz, insecure sessions, destructive actions unguarded, GET side effects, missing audit trail, missing tenancy isolation, silent failures.
10. **Market & competitor review** — direct/adjacent competitors, substitutes, incumbent strengths, buyer objections, switching difficulty, table stakes vs differentiated. Is the wedge strong enough? Category fundable?
11. **Business & fundraising readiness** — venture/bootstrap/internal scale? willingness to pay? too broad? narrower wedge? Output: Raise now / Build more / Bootstrap / Internal first / Pivot wedge / Stop.

## Required outputs
1. Executive verdict
2. What the product claims to be
3. What is actually implemented
4. What was verified
5. What is broken
6. What appears mocked/simulated/incomplete
7. Technical risks
8. Business risks
9. Market/competitor summary
10. Recommendation: pursue / pursue narrowly / pivot / internal-only / merge / skip
11. Next steps: next 7 / 30 / 90 days

For multi-product: best product to continue, products to stop/merge, reason for winner.

## Scoring rubric (1-5 per category)
Product clarity · Execution depth · Runtime quality · Data realism · UX trust · Technical quality · Security/ops hygiene · Market wedge · Monetization logic · Investor readiness.
- 40-50 strong candidate · 30-39 promising, needs focus · 20-29 early/internal-tool · 10-19 exploratory/demo · <10 not worth continuing.

## Decision rules
- **pursue** — core workflow real, users can finish the job, value believable, wedge clear.
- **pursue narrowly** — real problem + substance, but too broad, needs focus.
- **internal only** — useful but not yet strong as public product / better as internal leverage.
- **pivot** — real problem, wrong packaging/user/wedge.
- **skip** — weak implementation, weak value prop, weak market, no differentiation, unrealistic scope.

## Review discipline
Do not confuse polished UI with depth · ambitious docs with working implementation · one healthy endpoint with a usable product. Never mark untested as broken. Never give "go" without evidence. Always state what was NOT tested. Separate product judgment from optimism.

## Report naming
`REPORT_<product-name>_<yyyy-mm-dd>.md` or `REPORT_<a>_vs_<b>_<yyyy-mm-dd>.md`