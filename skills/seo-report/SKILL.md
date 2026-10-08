---
name: seo-report
description: Write a plain-English SEO report for a website in AutomatedSEO, covering search clicks and impressions, what changed, site health, content shipped and planned, and what to do next. Use when the user asks how their site or SEO is doing, wants a weekly or monthly report, or needs a summary for a client, boss or business partner.
---

# SEO report

Write a report that someone who doesn't do SEO can read in two minutes and act on.

## Gather the data

1. Call `list_websites`. Use the website the user named, or the only one. If there are several and none was named, ask which.
2. Call these together:
   - `get_search_performance` for the period. Default to the last 28 days ending today; use the user's period if they gave one.
   - `get_site_health`
   - `get_site_overview`
   - `get_content_calendar` for the next 30 days
   - `list_articles` with status `published`, to find what went live in the period
   - `get_backlinks`
3. If `get_search_performance` has no daily rows, Search Console isn't connected or has no data yet. Say so in one line, point them to Integrations in AutomatedSEO, and report the rest.

## Write the report

In this order:

1. **Headline.** One or two sentences: clicks, impressions and average position for the period, and the one thing that matters most.
2. **Search results.** The totals and the trend across the daily rows. Every open anomaly with its numbers (current value against its baseline) and its recommendation in plain words.
3. **Site health.** The score, then only the issues that cost traffic or sales: pages kept out of Google (noindex, wrong canonical), broken pages and links, slow pages that sell or rank. Group an issue that repeats across many pages into one line ("31 pages have images without alt text") instead of listing pages.
4. **Content.** What was published in the period, what's scheduled next with dates, and anything waiting in review.
5. **Links.** Verified and pending backlinks.
6. **Next steps.** Three to five actions, most valuable first.

Use only the numbers the tools return. The data has no previous-period totals, so don't claim month-over-month changes; anomalies carry their own baseline. Explain terms as you go: an average position of 18.6 is page two of Google, and CTR is a percentage of impressions that became clicks. Write numbers with thousands separators.
