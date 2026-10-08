---
name: prospect-audit
description: Audit any website's SEO with AutomatedSEO for a sales call, pitch or competitor check, covering authority and backlinks, a technical audit of its key page, and where it ranks for the searches that matter, then write it up with a short outreach email. Use when the user mentions a prospect, lead, client pitch, sales call or proposal, or wants to size up a competitor's or any other domain's SEO.
---

# Prospect audit

These tools work on any public website, not only the user's own.

## Plan the checks

1. Call `list_websites` for the `workspaceId`. These tools draw on the workspace's weekly allowance.
2. Settle the inputs from what the user said:
   - **Domain** and **page**: the homepage, unless they named a service or product page.
   - **Keywords**: two to four searches a customer of that business would type. For a local business, add the city, as in "dentist denver" or "emergency dentist denver". If you can't tell what the business does or where it is, ask.
   - **Country**: where the business sells. Default `us`.

## Run them

Call these together:

- `analyze_domain` with `includeBacklinks: true`
- `audit_page` on the page. Add `includePageSpeed: true` when the user cares about speed or mobile; it takes longer.
- `check_rankings` once per keyword

Each fresh result uses the weekly allowance (per website: 100 domain ratings, 25 backlink profiles, 100 audits, 50 speed tests, 50 rank checks) and reports `remainingThisWeek`. Mention it when it runs low. Results from the last 24 hours (rankings) or 7 days (domain ratings) are reused at no cost.

If the comparison makes the story clearer, rate the business that ranks first for their main keyword with `analyze_domain` too.

## Write the audit

For someone who isn't technical:

1. **Snapshot.** Domain rating out of 100 and referring domains, in one plain sentence of meaning.
2. **Visibility.** For each keyword, their position or "not in the top 50", and who holds the top three.
3. **Biggest problems.** Three to five from the audit (failures first, then important warnings). Each one gets what's wrong, the fix, and why it costs them customers.
4. **Quick wins and bigger projects.**
5. **Source line.** "Data from AutomatedSEO, {date}".

Use only the numbers the tools return. They don't measure traffic, leads or revenue, so don't estimate them.

## Write the email

150 words or fewer, from the user to the prospect. Open with one specific finding, keep it free of jargon, and end with one call to action, such as the call they've booked. Don't paste the whole audit into it.

## Competitor checks

When the user is sizing up a competitor of their own site, run the same checks on both domains with the same keywords and present them side by side.
