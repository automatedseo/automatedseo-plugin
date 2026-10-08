---
name: fix-site-issues
description: Turn AutomatedSEO's latest crawl of a website into a ranked fix list naming what's broken, which pages, exactly what to change and in what order, and fix it in the site's code when Claude has the codebase. Use when the user asks what's wrong with their site, what to fix first, why pages aren't indexed or ranking, for a technical SEO check of their own site, or to fix SEO issues.
---

# Fix site issues

## Read the crawl

1. Call `list_websites`. Use the website the user named, or the only one. If there are several and none was named, ask which.
2. Call `get_site_health`. Check `report.checkedAt`: if the crawl is more than 14 days old, or the user says they've just changed the site, call `run_site_check` and follow it with `get_job_status`. If the job is still running after a few checks, work from the current crawl and say a fresh one is on its way.

## Rank the issues

Order by what each issue costs the business, not by how many pages it touches:

1. **Pages kept out of Google**: noindex, a canonical pointing elsewhere, pages that fail to load. Worst on pages that sell (products, collections, pricing, subscriptions, sign-up) or already rank. A noindex on login, sign-up, cart or account pages is usually deliberate: mention it, don't list it as a fix.
2. **Broken internal links and slow first responses** on pages that sell or rank.
3. **Missing, duplicate or over-long titles and meta descriptions** on pages that sell or rank.
4. **Missing structured data** on product, article and local-business pages.
5. **Everything else**: image alt text, llms.txt, title length on minor pages.

When one issue hits many pages of the same type, such as every product page, it's one template fix. Report it once with the page count.

For the top one to three pages, call `audit_page` to get exact evidence, such as the canonical target, the current title text or the response time, so each fix can be precise. Each audit uses one of the website's 100 weekly audits.

## Report

A numbered list, most important first. Each item gives:

- the problem in plain words
- the pages (paths, then "+N more")
- the exact change, for example "remove `<meta name="robots" content="noindex">` from /collections/subscriptions"
- why it matters, in one line

Then a short "Can wait" list for the rest.

## Fix it

If you're working in the site's codebase and the user wants the fixes made, find the templates and files that render those pages and make the changes. After they deploy, call `run_site_check` to confirm the fixes. If you aren't in the codebase, offer the exact changes for their developer or CMS.
