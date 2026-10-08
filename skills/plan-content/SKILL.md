---
name: plan-content
description: Choose what a website should publish next from AutomatedSEO's keyword data, then create the article plans and put them on the content calendar. It filters out irrelevant keywords and skips topics already covered. Use when the user asks what to write next, wants blog post ideas, wants to plan or fill their content calendar, or wants to target a keyword or a competitor's gap.
---

# Plan content

## Gather

1. Call `list_websites`. Use the website the user named, or the only one. If there are several and none was named, ask which.
2. Call these together:
   - `get_keyword_opportunities` with `limit: 100`. It returns `ideas`, `gaps` (keywords a competitor ranks for) and `ranked` (keywords the site already ranks for).
   - `get_content_settings` for the business description, products and services, audiences, topics to prioritise and avoid
   - `get_content_calendar`
   - `list_articles` with `limit: 100`

## Choose

Filter first:

- **Drop keywords that aren't about this business.** The keyword data is broad, so it includes other brands, unrelated products and words that only share a term with the business. Check each keyword against the business description and products and services.
- **Drop topics** in `topicsToAvoid`.
- **Drop keywords an article already targets.** Compare against `target_query` in the calendar and the article list, including close variants. `create_article_plan` rejects an exact duplicate anyway.
- **Keywords the site already ranks 4 to 20 for** (in `ranked`) are usually better served by improving the ranking page than by a new article. Mention them instead of planning them.

Then rank what's left: relevance first, then monthly search volume against difficulty (for a young or small site, prefer difficulty of 40 or less). Rank commercial intent, competitor gaps where the competitor is in the top 10, and topics in `topicsToPrioritize` higher.

Plan as many articles as the user asked for. If they only asked what to write, recommend five and offer to plan them.

## Create and schedule

1. Call `create_article_plan` once per pick, with the keyword exactly as `targetQuery`, a working title, and `searchIntent`.
2. If the user gave an angle or points to cover, add them with `set_article_instructions`.
3. New plans have no date. Call `reschedule_article` for each one, on the next free days: one article per day, skipping days that already have an article in the calendar. Use the user's IANA time zone if you know it; otherwise use UTC and say so. If a day is unavailable, try the next.

## Reply

A table with keyword, monthly searches, difficulty, why it fits, and the scheduled day. Then one line on anything notable you skipped, such as a keyword that's already planned or one where improving an existing page is the better move.
