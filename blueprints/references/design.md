# Design System & UI/UX Rules (heart.md §8, condensed)

> No AI slop. No purple gradients. Every project must look top-tier-agency designed.

## Design philosophy (8.1)
- Design is the differentiator. Custom design systems, never default themes.
- Light-first, dark mode available, both equally polished.
- Mobile-first, 4px grid, breakpoints 375 / 768 / 1280.

## BANNED
- Purple/violet AI gradients
- Default shadcn themes without heavy customization
- Loading spinners (use skeleton screens)
- Generic template UI

## Typography system (8.3)
- Standard: **variable fonts** — Satoshi, Geist, Plus Jakarta Sans (or similar)
- Establish type scale + roles (display, heading, body, caption, mono) with tokens, not ad-hoc classes

## Color system (8.4)
- Define semantic tokens: background, foreground, primary, secondary, accent, success, warning, danger
- Ensure WCAG 2.2 AA contrast: min 4.5:1 for body text
- Ban purple/violet gradients in the palette

## Spacing & layout (8.5)
- 4px spacing grid; consistent rhythm
- Mobile-first; 375/768/1280 breakpoints

## Motion (8.6)
- Subtle, <350ms, purposeful
- Respect `prefers-reduced-motion`

## Component standards (8.7)
- shadcn/ui + Radix primitives + **heavy custom visual layer** (recommended path)
- Or fully custom components for maximum distinctiveness
- Skeleton screens over spinners; every state designed (empty, loading, error, success)

## Responsive (8.8) & Dark mode (8.9)
- Responsive on 375px, 768px, 1280px
- Dark mode first-class citizen, equally polished

## Accessibility (8.11) — WCAG 2.2 AA
- Semantic HTML, keyboard navigation, screen-reader support, focus states, min 4.5:1 contrast, form labels

## Reference designs
Encourage the user to share 3-5 reference products (from Design Intake §3) — mimic the *quality*, never copy.

## Super Admin Panel (heart.md 9.6, "God Mode")
Required for the platform owner; separate from tenant admin:
- `/super-admin/dashboard` — global KPIs, health, alerts
- `/super-admin/tenants` — tenants, plans, usage, status
- `/super-admin/users` — all users, reset password, impersonate
- `/super-admin/subscriptions` — plans, revenue
- `/super-admin/llm-costs` — CRITICAL: per-tenant, per-user, per-model cost
- `/super-admin/usage` — API calls, storage, tokens, quotas
- `/super-admin/analytics` — signups, DAU/MAU, retention, churn
- `/super-admin/audit-log` — who did what, when, everywhere
- `/super-admin/settings` — own password, manage other super admins
- LLM cost views: global | by-tenant | by-user | by-model | by-feature | trends | alerts
- Access: `isSuperAdmin:true` only, dedicated login, 2FA mandatory. Core built in Phase 1, deep analytics in Phase 3.