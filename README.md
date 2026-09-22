# Blueprints — Cross-Tool Product Development Skill

[![skills.sh](https://skills.sh/b/siddheshbmane/blueprints-skill)](https://skills.sh/siddheshbmane/blueprints-skill)

> **A portable Agent Skill that turns any AI coding tool into a documentation-first, qualify-first SaaS product builder.**

Built from a real-world SaaS playbook (~8,700 lines) and distilled into a lean
`SKILL.md` + deep references that work in **OpenCode, Claude Code, Codex, Grok,
Gemini CLI, Cursor**, and any agent that supports the
[Agent Skills](https://agentskills.io) `SKILL.md` standard.

It enforces Siddhesh's blueprint: documentation before code, intake
questionnaires, multi-tenant design from day 1, no-AI-slop UI, staging-before-
production deploys, browser-based user-flow E2E tests, and a mandatory task
report after every change.

---

## What it does

When you load this skill, your agent follows a proven product-development
system:

1. **Ask** the Project Intake questionnaire (12 topics) + Design Intake questionnaire (8 questions).
2. **Generate Phase 0 docs** — SCOPE, SCHEMA, API, WIREFRAMES, ADR, BRAND (no code until you approve).
3. **Build** a modular monolith → monorepo → hardening → mobile → GTM.
4. **Deploy** to staging first, verify the live URL, run real-user E2E tests.
5. **Gate** production behind an explicit "Ask User" gate — never auto-merges to main.
6. **Report** after every task (changes, deploy, tests, brand check, known issues).

Plus an optional **product due-diligence protocol** (`references/dd.md`) to
evaluate competitors, acquisitions, or your own roadmap bets.

## The 15 Golden Rules

1. Read `heart.md` (the full blueprint) FIRST, entirely, before anything.
2. Ask the PROJECT INTAKE questionnaire before any work.
3. Ask the DESIGN INTAKE questionnaire before any UI work.
4. Generate ALL Phase 0 docs. Get user approval before coding.
5. Multi-tenant from Day 1 — `organizationId` on EVERY table.
6. No AI slop design. No purple gradients. Award-winning UI only.
7. Services framework-agnostic (shareable with mobile later).
8. Deploy to STAGING first. Ask user before production. NEVER auto-merge to main.
9. Run E2E tests with browser tools after every major feature + all tasks.
10. Save progress to memory at every milestone (resume after context resets).

**Production Guardian:**
11. NEVER delete/truncate DB data without explicit user "yes".
12. NEVER claim "deployed" until the build is verified AND the live URL is checked.
13. NEVER test with API status codes only — simulate real user flows, test CRUD.
14. ALWAYS end every task with a structured report.
15. ALWAYS understand the product BEFORE coding.

---

## Install

### One command (any tool that reads `~/.agents/skills`, `~/.claude/skills`, or `~/.config/opencode/skills`)

```bash
# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/siddheshbmane/blueprints-skill/main/install.sh | bash
```

### Manual (recommended for full control)

```bash
git clone https://github.com/siddheshbmane/blueprints-skill.git
```

Then symlink (keeps it in sync with the repo — best option):

```bash
# Cross-tool global (OpenCode, Codex, Gemini, newer Claude Code, Cursor)
ln -s "$PWD/blueprints-skill/blueprints" ~/.agents/skills/blueprints

# Claude Code native
ln -s "$PWD/blueprints-skill/blueprints" ~/.claude/skills/blueprints

# OpenCode native
mkdir -p ~/.config/opencode/skills
ln -s "$PWD/blueprints-skill/blueprints" ~/.config/opencode/skills/blueprints
```

Or copy instead of symlink if you prefer a fixed snapshot:

```bash
cp -R blueprints-skill/blueprints ~/.agents/skills/blueprints
```

### Windows

1. Clone the repo: `git clone https://github.com/siddheshbmane/blueprints-skill.git`
2. Copy the `blueprints/` folder into one of:
   - `%USERPROFILE%\.agents\skills\blueprints`
   - `%USERPROFILE%\.claude\skills\blueprints`
   - `%USERPROFILE%\.config\opencode\skills\blueprints`

### Verify

Run the preflight tool check:

```bash
bash ~/.agents/skills/blueprints/scripts/preflight.sh
```

Or just open your AI tool and say: **"Follow the blueprints. Build: [your idea]"**

---

## Usage

| Situation | How to trigger |
|-----------|----------------|
| New full product | "Follow the blueprints. Build: *one-line idea*" |
| Quick MVP | "Follow the blueprints quick-start. MVP of: *idea*" |
| Add a feature | "Follow the blueprints. Add feature X." |
| Resume after context reset | "Resume *Project-Name* per the blueprints." |
| Deploy to production | "Run the Ask-User gate per the blueprints." |
| Evaluate a product/competitor | "Run product DD on *repo-or-url* per the blueprints." |

The agent will ask you the intake questionnaires (10–15 minutes once), generate
Phase 0 docs for your approval, then build, deploy to staging, and test —
stopping to ask you only at the gates: **doc approval**, **production**, and
**data destruction**.

---

## Repository structure

```
blueprints-skill/
├── blueprints/                  ← the skill (one folder per skill name, SKILL.md inside)
│   ├── SKILL.md                 ← lean router: golden rules, phase roadmap, how-to-use map
│   ├── references/              ← deep reference modules (loaded on demand)
│   │   ├── quickstart.md        ← condensed cheat sheet
│   │   ├── workflow.md          ← full new-project walkthrough
│   │   ├── questionnaires.md    ← project + design intake (verbatim)
│   │   ├── phase0.md            ← Phase 0 doc specs + gate
│   │   ├── design.md            ← design bible + super-admin panel
│   │   ├── stack.md             ← stack paths A/B/C + shared stack
│   │   ├── deploy.md            ← build-deploy-verify + Ask-User gate
│   │   ├── testing.md           ← user-flow E2E standard
│   │   ├── feature-workflow.md  ← add-a-feature flow
│   │   ├── resume.md            ← context-reset resume protocol
│   │   ├── dd.md                ← product due-diligence protocol
│   │   ├── tooling.md           ← MCP/tools preflight checklist
│   │   └── task-report.md       ← mandatory report template
│   └── scripts/
│       └── preflight.sh         ← tool availability check
├── install.sh                   ← one-command installer
├── LICENSE                      ← MIT
└── README.md
```

---

## Why the skill format?

- **Works everywhere.** `SKILL.md` is the cross-tool Agent Skills standard —
  OpenCode, Claude Code, Codex, Gemini CLI, and more all read it natively. No
  per-tool config.
- **Lean, not bloated.** The router `SKILL.md` is ~80 lines; depth lives in
  `references/` loaded on demand. That keeps context tiny for long build
  sessions (the #1 problem the source blueprint was designed to solve).
- **Vendor-agnostic.** No hard dependency on any MCP, plugin, or tool. It works
  with browser tools, memory tools, or plain old discipline.

---

## Roadmap / Ideas welcome

- [ ] Publish to skills.sh (Vercel registry)
- [ ] Add per-stack starter templates (Next.js, FastAPI, Expo)
- [ ] Add a `blueprint-bootstrap` companion skill for generating initial docs
- [ ] Include the super-admin panel generator prompt

Open issues / PRs: <https://github.com/siddheshbmane/blueprints-skill/issues>

---

## License

MIT — see [LICENSE](LICENSE). Free to use, fork, and remix.