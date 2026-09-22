# Resume After Context Reset (heart.md cheat sheet + §22, condensed)

> Sessions run long when following the blueprint. When context fills, start a fresh session and resume seamlessly.

## At project start / after every milestone
Persist state to a memory tool (OpenCode Memory MCP, Claude memory, or a checked-in state file):

- **Key:** `Project-<Name>`
- **Save at every milestone:**
  - Phase/step completed
  - Decisions made (and why)
  - Files created/changed
  - Commands run (dev server, migrations, deploys)
  - Live URLs (staging/production)
  - Remaining TODOs

## Resume protocol (fresh session)
1. Read `~/blueprints/heart.md` and `~/blueprints/quick-start.md` (or load this skill).
2. Read the memory state: search for `Project-<Name>`.
3. Re-orient: check git status/branch, local dev server state, env vars, DB migrations.
4. Continue with the next phase-gate deliverable.
5. Do NOT re-ask intake questionnaires already answered — use saved answers.

## Token efficiency (heart.md §22)
- Don't re-read full files you already know; diff/grep for what changed.
- Use memory + references instead of carrying huge context.
- Batch operations where possible (parallel agent calls, group file edits).
- Save context to memory BEFORE it runs out — never after.
- Keep the SKILL.md references (this folder) as the always-fresh distilled source; read heart.md sections on demand for depth, not all 8,700 lines every session.

## What to save verbatim (template)

```
PROJECT: <name>
STAGE:   <Phase 0/1/2/3/4/5 + step> | Gate status: <approved/pending>
VISION:  <one-liner from intake>
DECISIONS:
  - <decision> → <why>
FILES:   <key paths>
URLS:    staging: <url> | prod: <url>
NEXT:    <exact next action>
```