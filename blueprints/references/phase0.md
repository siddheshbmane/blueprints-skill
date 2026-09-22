# Phase 0 — Documentation-First (MANDATORY)

> Condensed from `~/blueprints/heart.md` §3. Gate: Phase 0 is complete when ALL
> deliverables are generated AND APPROVED. **No code is written until this phase is done.**

## The 8 deliverables

| # | Doc | Content |
|---|-----|---------|
| 1 | **SCOPE.md** | Product vision, features, user stories, personas, sitemap, acceptance criteria |
| 2 | **SCHEMA.md** | ERD, table definitions, Prisma schema, **multi-tenant model** (organizationId on every table) |
| 3 | **API.md** | All endpoints, request/response types, auth, errors, pagination, rate limits |
| 4 | **WIREFRAMES.md** | Text-based screen descriptions, every state, navigation, responsive behavior |
| 5 | **ADR.md** | Architecture decisions with alternatives, trade-offs, and chosen rationale |
| 6 | **BRAND.md** | Logo (3-5 options), colors, typography, tone of voice, positioning, brand story |
| 7 | **INVESTOR-DECK.pptx** | 12-15 slide fundraising deck (python-pptx) — only if fundraising |
| 8 | **PRODUCT-DECK.pptx** | Sales + product demo deck — deferred post-Phase 1 for real screenshots |

## Order of writing
SCOPE → SCHEMA → API → WIREFRAMES → ADR → BRAND → decks. Present the full set to the user for review. Iterate on feedback. **Wait for explicit approval before writing any code.**

## ADR format (heart.md 3.5)
```
# ADR-001: [Title of Decision]
Status: [Proposed / Accepted / Superseded]
Context: Why this decision matters
Decision: What we chose
Alternatives considered: [options + why rejected]
Consequences: [positive + negative]
```

## Phase 0 Gate Checklist (heart.md 3.9)
- [ ] All 8 deliverables generated (decks only if applicable)
- [ ] User has reviewed and approved
- [ ] Multi-tenancy designed in from the start
- [ ] Design direction established (no default themes)
- [ ] Brand foundation set (colors, fonts, tone)
- [ ] Deployment strategy agreed (Railway/Vercel, staging first)

## Quality bar
- Docs are product-grade, not filler. Every feature has acceptance criteria.
- Schema fully models the product, with tenant isolation from day 1.
- API contract is complete enough that FE and BE can build in parallel.
- Wireframes describe every state (empty, loading, error, success) and responsive breakpoints (375/768/1280).