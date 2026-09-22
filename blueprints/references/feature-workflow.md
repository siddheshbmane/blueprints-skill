# Feature Workflow (add to an existing blueprint project)

> For adding a feature to a project already built with the blueprint.

## Steps

1. **Understand first (Golden Rule 15).** Read the project docs (SCOPE/README/CLAUDE.md), check the live URL if one exists, know the users before touching code.

2. **Scope check.** Is this in SCOPE.md? Update the docs if the feature is new — docs stay in sync with code (Phase 0 discipline applies to features too: brief schema/API impact before coding).

3. **Branch.** Create `feature/<kebab-name>` from `staging`:
   ```
   git checkout staging && git pull
   git checkout -b feature/<name>
   ```

4. **Implement.** Follow project conventions (TypeScript strict, Zod validation, multi-tenant `organizationId`, design system tokens — no slop). Type-safe, tested, no console errors.

5. **Test like a user.** Build the feature, run the user-flow test (see `references/testing.md`): primary action as a real user, verify data in UI + DB, edge cases.

6. **Commit conventionally**: `feat(scope): summary` (see heart.md 19.9). Commit at logical checkpoints.

7. **PR to staging.** Push branch → open PR to `staging` (squash merge) → CI passes → merge → auto-deploys staging.

8. **Verify live.** Smoke test on the staging URL (build logs clean, changes visible, brand consistent, functional test, console errors none).

9. **Report.** Structured task report (see `references/task-report.md`): changes, deployment, test results, brand check, known issues.

10. **Production?** NEVER auto-merge to main. Offer the Ask-User gate (see `references/deploy.md` §19.8) when the user is ready.

## Git commit standards (heart.md 19.9)
- Conventional Commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:` + scope when helpful.
- One logical change per commit. Complete each phase before moving on.