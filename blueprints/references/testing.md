# Testing Standards (heart.md §1.3.3/§23 + quick-start, condensed)

> **"API returns 200" is NOT a test.** Every test must simulate a REAL user doing a REAL thing.

## User-flow testing standard (1.3.3)

1. IDENTIFY the user action — what will a real user do? (e.g., "Create a new lead")
2. DEFINE the flow steps — what they click, type, and see
3. EXECUTE the flow — browser automation / API calls with real data / manual verification through the ENTIRE flow
4. VERIFY the outcome — did the expected result happen? data in DB? UI update? notification/email send?
5. TEST edge cases — invalid data, empty fields, duplicates, rapid clicks
6. DOCUMENT per test:

```
TEST FORMAT:
─────────────
Test: [User Flow Name]
Scenario: [What the user is trying to do]
Steps: 1. ... 2. ... 3. ...
Expected Result: [What should happen]
Actual Result: [What actually happened]
Status: PASS / FAIL
Evidence: [Screenshot, API response, DB query, or live URL confirmation]
Notes: [Observations or follow-ups]
```

## CRUD verification standard
When testing data operations, test ALL relevant operations:
- CREATE → record created? shows in UI? in database?
- READ → data displays? pagination? filtering?
- UPDATE → modified? persists? UI reflects?
- DELETE → works? UI updates? **(ONLY on test data YOU created — never delete the user's existing data)**

## Smoke test (per feature)
`navigate → snapshot → test primary action AS A USER → verify data in UI + database → check console errors → report`

## Full E2E (after all tasks)
Auth → Dashboard → CRUD per feature (Create/Read/Update/Delete) → Settings → Admin → Responsive (375/768/1280) → Dark mode → Error states → Console errors → Network errors → Generate report.

Each test must include: Scenario → Steps → Expected → Actual → PASS/FAIL.

## Deploy verification (after every deployment)
Build logs clean → Live URL loads → Changes visible → Brand/design consistent → Functional test on live → Report.

## Database safety
- NEVER delete/truncate existing data without user permission.
- Only DELETE records YOU created during the test session.

## Priority
- Always run the full E2E before a production PR. NEVER skip.