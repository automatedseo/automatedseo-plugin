---
expect:
  workspaceId: "ws-northpeak"
  url: "string"
---

{
 "audit": {
  "url": "{{input.url}}",
  "finalUrl": "{{input.url}}",
  "status": 200,
  "score": 54,
  "grade": "Needs work",
  "groups": [
   {
    "name": "Crawling & indexing",
    "score": 100,
    "passed": 4,
    "total": 4
   },
   {
    "name": "On-page",
    "score": 22,
    "passed": 0,
    "total": 5
   },
   {
    "name": "Structured data & social",
    "score": 25,
    "passed": 0,
    "total": 2
   },
   {
    "name": "Technical",
    "score": 67,
    "passed": 2,
    "total": 3
   }
  ],
  "checks": [
   {
    "id": "status",
    "group": "Crawling & indexing",
    "severity": "critical",
    "status": "pass",
    "title": "Returns HTTP 200",
    "detail": "The page loads for crawlers."
   },
   {
    "id": "noindex",
    "group": "Crawling & indexing",
    "severity": "critical",
    "status": "pass",
    "title": "Indexable",
    "detail": "No noindex in a robots meta tag or X-Robots-Tag header."
   },
   {
    "id": "canonical",
    "group": "Crawling & indexing",
    "severity": "important",
    "status": "pass",
    "title": "Canonical tag present",
    "detail": "The page declares its preferred URL."
   },
   {
    "id": "sitemap",
    "group": "Crawling & indexing",
    "severity": "important",
    "status": "pass",
    "title": "Sitemap found",
    "detail": "robots.txt declares /sitemap.xml."
   },
   {
    "id": "title",
    "group": "On-page",
    "severity": "critical",
    "status": "warn",
    "title": "Title is 9 characters",
    "detail": "Short titles waste the most visible line of your search result.",
    "evidence": "Home Page"
   },
   {
    "id": "description",
    "group": "On-page",
    "severity": "important",
    "status": "fail",
    "title": "Missing meta description",
    "detail": "Google writes its own snippet from the page, often a poor one.",
    "fix": "Add a 120 to 160 character description that says what the reader gets."
   },
   {
    "id": "h1",
    "group": "On-page",
    "severity": "important",
    "status": "fail",
    "title": "No H1",
    "detail": "No main heading in the server-rendered HTML. It may be added by JavaScript, or styled text instead of a heading."
   },
   {
    "id": "content",
    "group": "On-page",
    "severity": "important",
    "status": "warn",
    "title": "180 words in the HTML",
    "detail": "Thin pages rarely rank. Explain the topic fully in the page's own words."
   },
   {
    "id": "alt",
    "group": "On-page",
    "severity": "minor",
    "status": "fail",
    "title": "7 of 9 images have no alt text",
    "detail": "Alt text describes images to Google and screen readers."
   },
   {
    "id": "schema",
    "group": "Structured data & social",
    "severity": "important",
    "status": "warn",
    "title": "No structured data",
    "detail": "Schema markup makes the page eligible for rich results and helps assistants identify it.",
    "fix": "Add Dentist (LocalBusiness) JSON-LD with name, address, phone and opening hours."
   },
   {
    "id": "open-graph",
    "group": "Structured data & social",
    "severity": "minor",
    "status": "fail",
    "title": "Missing og:title, og:description, og:image",
    "detail": "Without them, links shared in Slack, LinkedIn and chat apps show a bare URL or a random image."
   },
   {
    "id": "viewport",
    "group": "Technical",
    "severity": "important",
    "status": "pass",
    "title": "Mobile viewport set",
    "detail": "The page scales to the screen. Google indexes the mobile version first."
   },
   {
    "id": "mixed-content",
    "group": "Technical",
    "severity": "important",
    "status": "pass",
    "title": "No mixed content",
    "detail": "Every resource loads over HTTPS."
   },
   {
    "id": "response-time",
    "group": "Technical",
    "severity": "important",
    "status": "fail",
    "title": "Server responded in 3.1s",
    "detail": "A slow first response delays everything else on the page.",
    "fix": "Enable page caching or a CDN in front of the site."
   }
  ],
  "stats": {
   "responseMs": 3104,
   "htmlKb": 41,
   "words": 180,
   "internalLinks": 9,
   "externalLinks": 3,
   "images": 9,
   "scripts": 14
  },
  "checkedAt": "2026-10-08T09:01:00.000Z",
  "cached": false,
  "cachedAt": null,
  "remainingThisWeek": 99
 },
 "pageSpeed": null
}
