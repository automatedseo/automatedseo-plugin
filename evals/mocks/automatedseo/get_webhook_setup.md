---
expect:
  workspaceId: "ws-northpeak"
  websiteId: "site-northpeak"
---

{
 "setupBrief": "Connect this website to AutomatedSEO, so it can publish blog articles here automatically.\n\nWebsite: https://northpeakcoffee.example\n\nBuild one webhook that receives finished articles and publishes them on this site's blog. If an AutomatedSEO endpoint already exists from an earlier attempt, update it to match everything below instead of adding a second one. Read the codebase first and follow its existing routing, storage, blog and deployment conventions.\n\n1. The endpoint\n- A public HTTPS POST endpoint at exactly https://northpeakcoffee.example/api/automatedseo/articles, with no redirects (www, trailing slash or language prefix).\n- No login, CSRF, origin or bot checks on this path: a server calls it, and the bearer token is its only protection.\n- Respond within 20 seconds, always with JSON. Never answer this path with an HTML page.\n\n2. Authentication\n- Generate a random token of at least 32 bytes, written as hex.\n- Store only its lowercase SHA-256 hex digest, in the server-side secret AUTOMATEDSEO_WEBHOOK_TOKEN_SHA256. Never commit, log or expose the token itself; show it once at the end of your reply.\n- Hash the token from \"Authorization: Bearer <token>\" and compare the digests in constant time. A missing or wrong token gets 401 {\"error\": \"...\"}.\n\n3. Events\n- Accept exactly the two events in the contract below, read from the body's \"event\" field (the X-AutomatedSEO-Event header carries the same value), with their fields exactly as written. Don't rename them or require fields the contract doesn't send.\n- automatedseo.connection.test: change nothing and respond 200 {\"ok\": true}.\n- automatedseo.article.published: publish the article, then respond 200 {\"id\": \"<slug>\", \"url\": \"<the live article URL>\"}.\n- Any other event gets 400 {\"error\": \"Unsupported event\"}.\n\n4. Publishing an article\n- The article must be live at article.publishedUrl as soon as you respond 2xx.\n- Use slug as the article's id. When an article arrives with a slug the site already has, replace that article in place and keep its original publish date. AutomatedSEO sends improved versions of its articles this way, so never create a duplicate.\n- bodyHtml is ready, safe HTML of the whole article (headings, lists, tables, images, links, videos): render it as-is inside the site's article layout. bodyMarkdown is the same article in Markdown, for a site that renders Markdown itself.\n- In the page head: the title from metaTitle (else title), the meta description from metaDescription (else excerpt), a canonical link to publishedUrl, the page language from language, and schemaMarkup (a JSON-LD script tag) when it isn't null.\n- When featuredImage isn't null, show it as the article's cover image, with its altText. Every image URL is public and permanent: use it directly or copy it into the site's own storage.\n- List the article on the blog index and in sitemap.xml, in the site's existing blog design.\n\n5. Reliability\n- Validate the payload against the contract. Invalid input gets 400 with a message naming the field.\n- Store or queue each event durably before responding 2xx. Process each idempotencyKey once: a repeat gets the same 2xx again without publishing twice.\n- Add focused tests for both events, a wrong token, a repeated delivery and a replaced slug, plus a short setup note in the docs. Don't change unrelated code or ask for AutomatedSEO credentials.\n\n6. Go live\n- Commit, apply any database migrations to production, set the AUTOMATEDSEO_WEBHOOK_TOKEN_SHA256 secret in production, and deploy.\n- Then check the live endpoint. This must return 200, and the same request without the Authorization header must return 401:\n```sh\ncurl -sS -X POST https://northpeakcoffee.example/api/automatedseo/articles -H \"Authorization: Bearer <token>\" -H \"Content-Type: application/json\" -H \"X-AutomatedSEO-Event: automatedseo.connection.test\" -d '{\"event\":\"automatedseo.connection.test\",\"idempotencyKey\":\"connection-test:setup-check\",\"version\":1}'\n```\n- Fix and redeploy until both checks pass. If you can't deploy or set the secret yourself, say exactly which step is left and stop there.\n\nThe contract:\n```json\n{\n  \"method\": \"POST\",\n  \"headers\": {\n    \"Authorization\": \"Bearer <webhook token>\",\n    \"Content-Type\": \"application/json\",\n    \"User-Agent\": \"AutomatedSEO/1.0\",\n    \"X-AutomatedSEO-Delivery\": \"<unique delivery id>\",\n    \"X-AutomatedSEO-Event\": \"automatedseo.connection.test | automatedseo.article.published\"\n  },\n  \"events\": {\n    \"connectionTest\": {\n      \"event\": \"automatedseo.connection.test\",\n      \"idempotencyKey\": \"connection-test:<uuid>\",\n      \"version\": 1\n    },\n    \"articlePublished\": {\n      \"event\": \"automatedseo.article.published\",\n      \"idempotencyKey\": \"<unique per delivery>\",\n      \"version\": 1,\n      \"article\": {\n        \"title\": \"How to plan content\",\n        \"slug\": \"how-to-plan-content\",\n        \"metaTitle\": \"How to Plan Content That Ranks\",\n        \"metaDescription\": \"A practical way to plan content.\",\n        \"excerpt\": \"A practical way to plan content.\",\n        \"language\": \"en\",\n        \"bodyHtml\": \"<h2 id=\\\"start-with-questions\\\">Start with questions</h2>\\n<p><img src=\\\"https://...\\\" alt=\\\"Planning board\\\"></p>\",\n        \"bodyMarkdown\": \"## Start with questions\\n\\n![Planning board](https://...)\",\n        \"featuredImage\": {\n          \"url\": \"https://...\",\n          \"altText\": \"A content plan on a desk\"\n        },\n        \"images\": [\n          {\n            \"sourceUrl\": \"https://...\",\n            \"altText\": \"Planning board\",\n            \"fileName\": \"planning-board.webp\",\n            \"mimeType\": \"image/webp\"\n          }\n        ],\n        \"publishedUrl\": \"https://northpeakcoffee.example/blog/how-to-plan-content\",\n        \"schemaMarkup\": \"<script type=\\\"application/ld+json\\\">{\\\"@context\\\":\\\"https://schema.org\\\",\\\"@type\\\":\\\"BlogPosting\\\"}</script>\"\n      }\n    }\n  },\n  \"nullable\": {\n    \"featuredImage\": \"null when the article has no cover image.\",\n    \"schemaMarkup\": \"null when the article has no JSON-LD.\",\n    \"metaTitle\": \"null: use title.\",\n    \"metaDescription\": \"null: use excerpt.\",\n    \"language\": \"null when unknown: use the site's default language.\"\n  },\n  \"images\": \"Every image in the article, the cover included, at a public HTTPS URL.\",\n  \"updates\": \"A later automatedseo.article.published with the same article.slug replaces that article in place (keep its original publish date). Improved versions are sent this way, never as a new article.\",\n  \"response\": {\n    \"success\": \"Any 2xx status once the event is stored or queued.\",\n    \"optionalBody\": {\n      \"id\": \"Your id for the article, used to match later deliveries.\",\n      \"url\": \"The article's public HTTPS URL, when it differs from publishedUrl.\"\n    },\n    \"retries\": \"Any other status fails the delivery. A retry reuses idempotencyKey, so process each key once.\"\n  }\n}\n```\n\nOnce the live check passes, end your reply with one code block holding exactly these three lines, filled in, so they can be copied in one click:\n```\nWebhook URL: https://...\nWebhook token: ...\nPublic URL template: https://.../blog/{slug}\n```",
 "contract": {
  "method": "POST",
  "headers": {
   "Authorization": "Bearer <webhook token>",
   "Content-Type": "application/json",
   "User-Agent": "AutomatedSEO/1.0",
   "X-AutomatedSEO-Delivery": "<unique delivery id>",
   "X-AutomatedSEO-Event": "automatedseo.connection.test | automatedseo.article.published"
  },
  "events": {
   "connectionTest": {
    "event": "automatedseo.connection.test",
    "idempotencyKey": "connection-test:<uuid>",
    "version": 1
   },
   "articlePublished": {
    "event": "automatedseo.article.published",
    "idempotencyKey": "<unique per delivery>",
    "version": 1,
    "article": {
     "title": "How to plan content",
     "slug": "how-to-plan-content",
     "metaTitle": "How to Plan Content That Ranks",
     "metaDescription": "A practical way to plan content.",
     "excerpt": "A practical way to plan content.",
     "language": "en",
     "bodyHtml": "<h2 id=\"start-with-questions\">Start with questions</h2>\n<p><img src=\"https://...\" alt=\"Planning board\"></p>",
     "bodyMarkdown": "## Start with questions\n\n![Planning board](https://...)",
     "featuredImage": {
      "url": "https://...",
      "altText": "A content plan on a desk"
     },
     "images": [
      {
       "sourceUrl": "https://...",
       "altText": "Planning board",
       "fileName": "planning-board.webp",
       "mimeType": "image/webp"
      }
     ],
     "publishedUrl": "https://northpeakcoffee.example/blog/how-to-plan-content",
     "schemaMarkup": "<script type=\"application/ld+json\">{\"@context\":\"https://schema.org\",\"@type\":\"BlogPosting\"}</script>"
    }
   }
  },
  "nullable": {
   "featuredImage": "null when the article has no cover image.",
   "schemaMarkup": "null when the article has no JSON-LD.",
   "metaTitle": "null: use title.",
   "metaDescription": "null: use excerpt.",
   "language": "null when unknown: use the site's default language."
  },
  "images": "Every image in the article, the cover included, at a public HTTPS URL.",
  "updates": "A later automatedseo.article.published with the same article.slug replaces that article in place (keep its original publish date). Improved versions are sent this way, never as a new article.",
  "response": {
   "success": "Any 2xx status once the event is stored or queued.",
   "optionalBody": {
    "id": "Your id for the article, used to match later deliveries.",
    "url": "The article's public HTTPS URL, when it differs from publishedUrl."
   },
   "retries": "Any other status fails the delivery. A retry reuses idempotencyKey, so process each key once."
  }
 },
 "connections": []
}
