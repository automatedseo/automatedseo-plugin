---
name: connect-custom-site
description: Connect a custom-built website (Next.js, Astro, Remix, Rails, Django, Laravel, a static site generator or any other codebase) to AutomatedSEO publishing. Claude builds the article webhook in the user's code, deploys it and then connects it. Use when the user wants AutomatedSEO to publish into their own site or repository, has no WordPress or other supported CMS, or asks to set up the AutomatedSEO webhook.
---

# Connect a custom site

## Get the spec

1. Call `list_websites`. Use the website whose domain matches this codebase (check its config, README or sitemap). If none matches, ask which.
2. Call `get_webhook_setup`. Its `setupBrief` is the spec for the endpoint path, the token check, both events, idempotency, replace-by-slug, page head tags, the blog index and sitemap, and the tests. Follow it exactly. `connections` lists webhooks this website already has. If one is active, update that endpoint instead of adding a second, and pass its `connectionId` when connecting.

If you aren't working in the site's codebase (for example in a chat without file access), give the user the `setupBrief` to hand to their coding agent and explain the steps below.

## Build it

- Read the codebase first and follow its routing, data and deployment conventions.
- Store articles somewhere that survives in production. On serverless hosts, files written at runtime don't persist, so a blog that reads Markdown from the repository needs another write path: a database or key-value store the blog also reads, or a commit through the Git host's API. Choose what fits the stack and say why.
- Generate the webhook token with a secure random generator, such as `openssl rand -hex 32`. Never commit or log it. The site stores only its SHA-256 digest, as `AUTOMATEDSEO_WEBHOOK_TOKEN_SHA256`.
- Write the tests the brief lists and run them.

## Deploy and check

Deploy only when you can do it from here and the user agrees. Then run the brief's live checks: an authorised connection test returns 200, and the same request without the token returns 401.

If you can't deploy or set the secret, stop there. List exactly what's left (set the secret, deploy, run the two checks) and end with the brief's three lines: webhook URL, webhook token and public URL template.

## Connect

Only after the live checks pass, call `connect_custom_webhook` with:

- `endpointUrl`
- `webhookToken`, the token you generated (the one secret this tool takes)
- `publicUrlTemplate` containing `{slug}`
- a `name`

AutomatedSEO sends a connection test first and saves nothing unless the endpoint accepts it. Once connected, approved articles waiting for a destination are queued to publish there. A website publishes to one CMS at a time; if another CMS is connected, the user disconnects it in AutomatedSEO's Integrations first.

Don't call `connect_custom_webhook` before the endpoint is live, because the connection test would fail.
