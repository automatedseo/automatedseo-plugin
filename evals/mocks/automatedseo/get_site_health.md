---
expect:
  workspaceId: "ws-northpeak"
  websiteId: "site-northpeak"
---

{
 "snapshot": {
  "report": {
   "aiReadabilityScore": 68,
   "checkedAt": "2026-10-06T09:12:00.000Z",
   "checks": [
    {
     "category": "technical",
     "fix": "Enable HTTPS and redirect every HTTP request to it.",
     "label": "HTTPS redirect",
     "owner": "you",
     "affectedPages": 0,
     "detail": "HTTPS works and HTTP redirects to it.",
     "id": "https",
     "score": 100,
     "status": "pass"
    },
    {
     "category": "ai",
     "fix": "Publish a valid sitemap.xml at your site root.",
     "label": "Sitemap",
     "owner": "you",
     "affectedPages": 0,
     "detail": "sitemap responded with HTTP 200.",
     "id": "sitemap",
     "score": 100,
     "status": "pass"
    },
    {
     "category": "ai",
     "fix": "Publish robots.txt and allow legitimate crawlers to access the site.",
     "label": "Robots.txt",
     "owner": "you",
     "affectedPages": 0,
     "detail": "robots responded with HTTP 200.",
     "id": "robots",
     "score": 100,
     "status": "pass"
    },
    {
     "category": "ai",
     "fix": "Publish llms.txt with the key pages and facts about your business.",
     "label": "LLMs.txt",
     "owner": "you",
     "affectedPages": 0,
     "detail": "llms responded with HTTP 404.",
     "id": "llms",
     "score": 60,
     "status": "warning"
    },
    {
     "category": "technical",
     "fix": "Remove an unintended noindex directive from the page.",
     "label": "Indexability",
     "owner": "you",
     "affectedPages": 1,
     "detail": "1 of 48 checked page(s) need attention.",
     "id": "indexable",
     "score": 37,
     "status": "fail"
    },
    {
     "category": "technical",
     "fix": "Add a unique, descriptive title between 10 and 60 characters.",
     "label": "Meta title",
     "owner": "you",
     "affectedPages": 5,
     "detail": "5 of 48 checked page(s) need attention.",
     "id": "title",
     "score": 72,
     "status": "warning"
    },
    {
     "category": "technical",
     "fix": "Add a unique meta description between 50 and 160 characters.",
     "label": "Meta description",
     "owner": "you",
     "affectedPages": 9,
     "detail": "9 of 48 checked page(s) need attention.",
     "id": "description",
     "score": 34,
     "status": "fail"
    },
    {
     "category": "technical",
     "fix": "Add a canonical URL that points to the preferred version of the page.",
     "label": "Canonical URL",
     "owner": "you",
     "affectedPages": 4,
     "detail": "4 of 48 checked page(s) need attention.",
     "id": "canonical",
     "score": 37,
     "status": "fail"
    },
    {
     "category": "ai",
     "fix": "Use one clear main heading on the page.",
     "label": "Main heading",
     "owner": "you",
     "affectedPages": 0,
     "detail": "All checked pages passed this check.",
     "id": "headings",
     "score": 100,
     "status": "pass"
    },
    {
     "category": "ai",
     "fix": "Add valid JSON-LD structured data relevant to this page.",
     "label": "Structured data",
     "owner": "you",
     "affectedPages": 12,
     "detail": "12 of 48 checked page(s) need attention.",
     "id": "structured-data",
     "score": 75,
     "status": "warning"
    },
    {
     "category": "technical",
     "fix": "Add meaningful alt text to informative images.",
     "label": "Image alt text",
     "owner": "you",
     "affectedPages": 31,
     "detail": "31 of 48 checked page(s) need attention.",
     "id": "alt-text",
     "score": 3,
     "status": "fail"
    },
    {
     "category": "technical",
     "fix": "Reduce the time until the page returns its first HTML response.",
     "label": "Response speed",
     "owner": "you",
     "affectedPages": 3,
     "detail": "3 of 48 checked page(s) need attention.",
     "id": "speed",
     "score": 37,
     "status": "fail"
    },
    {
     "category": "technical",
     "fix": "Update or remove internal links that point to missing pages.",
     "label": "Internal links",
     "owner": "you",
     "affectedPages": 2,
     "detail": "2 of 48 checked page(s) need attention.",
     "id": "broken-links",
     "score": 40,
     "status": "fail"
    }
   ],
   "crawlerFiles": {
    "llms": {
     "detail": "llms responded with HTTP 404.",
     "id": "llms",
     "status": "warning",
     "url": "https://northpeakcoffee.example/llms.txt"
    },
    "robots": {
     "detail": "robots responded with HTTP 200.",
     "id": "robots",
     "status": "pass",
     "url": "https://northpeakcoffee.example/robots.txt"
    },
    "sitemap": {
     "detail": "sitemap responded with HTTP 200.",
     "id": "sitemap",
     "status": "pass",
     "url": "https://northpeakcoffee.example/sitemap.xml"
    }
   },
   "pages": [
    {
     "issues": [
      {
       "category": "technical",
       "fix": "Remove an unintended noindex directive from the page.",
       "label": "Indexability",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The page has a noindex directive.",
       "id": "indexable",
       "score": 0,
       "status": "fail"
      },
      {
       "category": "technical",
       "fix": "Add a unique meta description between 50 and 160 characters.",
       "label": "Meta description",
       "owner": "you",
       "affectedPages": 1,
       "detail": "This description is shared by more than one page.",
       "id": "description",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/collections/subscriptions",
     "score": 6,
     "url": "https://northpeakcoffee.example/collections/subscriptions"
    },
    {
     "issues": [
      {
       "category": "technical",
       "fix": "Add a unique, descriptive title between 10 and 60 characters.",
       "label": "Meta title",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The title is 68 characters.",
       "id": "title",
       "score": 60,
       "status": "warning"
      },
      {
       "category": "technical",
       "fix": "Add meaningful alt text to informative images.",
       "label": "Image alt text",
       "owner": "you",
       "affectedPages": 1,
       "detail": "4 of 9 images need alt text.",
       "id": "alt-text",
       "score": 0,
       "status": "fail"
      },
      {
       "category": "technical",
       "fix": "Reduce the time until the page returns its first HTML response.",
       "label": "Response speed",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The first HTML response took 2912ms.",
       "id": "speed",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/",
     "score": 18,
     "url": "https://northpeakcoffee.example/"
    },
    {
     "issues": [
      {
       "category": "ai",
       "fix": "Add valid JSON-LD structured data relevant to this page.",
       "label": "Structured data",
       "owner": "you",
       "affectedPages": 1,
       "detail": "No JSON-LD structured data was found.",
       "id": "structured-data",
       "score": 60,
       "status": "warning"
      },
      {
       "category": "technical",
       "fix": "Add a canonical URL that points to the preferred version of the page.",
       "label": "Canonical URL",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The canonical URL points to /products/ethiopia-yirgacheffe?variant=250g.",
       "id": "canonical",
       "score": 0,
       "status": "fail"
      },
      {
       "category": "technical",
       "fix": "Reduce the time until the page returns its first HTML response.",
       "label": "Response speed",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The first HTML response took 3104ms.",
       "id": "speed",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/products/ethiopia-yirgacheffe",
     "score": 12,
     "url": "https://northpeakcoffee.example/products/ethiopia-yirgacheffe"
    },
    {
     "issues": [
      {
       "category": "ai",
       "fix": "Add valid JSON-LD structured data relevant to this page.",
       "label": "Structured data",
       "owner": "you",
       "affectedPages": 1,
       "detail": "No JSON-LD structured data was found.",
       "id": "structured-data",
       "score": 60,
       "status": "warning"
      },
      {
       "category": "technical",
       "fix": "Add a canonical URL that points to the preferred version of the page.",
       "label": "Canonical URL",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The canonical URL points to /products/colombia-huila?variant=250g.",
       "id": "canonical",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/products/colombia-huila",
     "score": 18,
     "url": "https://northpeakcoffee.example/products/colombia-huila"
    },
    {
     "issues": [
      {
       "category": "ai",
       "fix": "Add valid JSON-LD structured data relevant to this page.",
       "label": "Structured data",
       "owner": "you",
       "affectedPages": 1,
       "detail": "No JSON-LD structured data was found.",
       "id": "structured-data",
       "score": 60,
       "status": "warning"
      },
      {
       "category": "technical",
       "fix": "Reduce the time until the page returns its first HTML response.",
       "label": "Response speed",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The first HTML response took 2405ms.",
       "id": "speed",
       "score": 60,
       "status": "warning"
      }
     ],
     "path": "/products/house-espresso",
     "score": 24,
     "url": "https://northpeakcoffee.example/products/house-espresso"
    },
    {
     "issues": [
      {
       "category": "technical",
       "fix": "Update or remove internal links that point to missing pages.",
       "label": "Internal links",
       "owner": "you",
       "affectedPages": 1,
       "detail": "1 internal link points to a missing page: /blog/aeropress-recipe (404).",
       "id": "broken-links",
       "score": 0,
       "status": "fail"
      },
      {
       "category": "technical",
       "fix": "Add meaningful alt text to informative images.",
       "label": "Image alt text",
       "owner": "you",
       "affectedPages": 1,
       "detail": "3 of 3 images need alt text.",
       "id": "alt-text",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/blog/cold-brew-ratio",
     "score": 30,
     "url": "https://northpeakcoffee.example/blog/cold-brew-ratio"
    },
    {
     "issues": [
      {
       "category": "technical",
       "fix": "Update or remove internal links that point to missing pages.",
       "label": "Internal links",
       "owner": "you",
       "affectedPages": 1,
       "detail": "1 internal link points to a missing page: /blog/aeropress-recipe (404).",
       "id": "broken-links",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/blog/pour-over-basics",
     "score": 36,
     "url": "https://northpeakcoffee.example/blog/pour-over-basics"
    },
    {
     "issues": [
      {
       "category": "technical",
       "fix": "Add a unique, descriptive title between 10 and 60 characters.",
       "label": "Meta title",
       "owner": "you",
       "affectedPages": 1,
       "detail": "The title is 74 characters.",
       "id": "title",
       "score": 60,
       "status": "warning"
      },
      {
       "category": "technical",
       "fix": "Add a unique meta description between 50 and 160 characters.",
       "label": "Meta description",
       "owner": "you",
       "affectedPages": 1,
       "detail": "No meta description was found.",
       "id": "description",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/wholesale",
     "score": 24,
     "url": "https://northpeakcoffee.example/wholesale"
    },
    {
     "issues": [
      {
       "category": "technical",
       "fix": "Add a unique meta description between 50 and 160 characters.",
       "label": "Meta description",
       "owner": "you",
       "affectedPages": 1,
       "detail": "No meta description was found.",
       "id": "description",
       "score": 0,
       "status": "fail"
      },
      {
       "category": "technical",
       "fix": "Add meaningful alt text to informative images.",
       "label": "Image alt text",
       "owner": "you",
       "affectedPages": 1,
       "detail": "2 of 2 images need alt text.",
       "id": "alt-text",
       "score": 0,
       "status": "fail"
      }
     ],
     "path": "/about",
     "score": 30,
     "url": "https://northpeakcoffee.example/about"
    }
   ],
   "score": 58,
   "technicalSeoScore": 41
  },
  "run": {
   "crawlRunId": "site-health-crawl-npc-1006",
   "createdAt": "2026-10-06T09:11:20.000Z",
   "finishedAt": "2026-10-06T09:12:00.000Z",
   "pagesCrawled": 48,
   "pagesDiscovered": 112,
   "pagesFailed": 0,
   "status": "succeeded",
   "updatedAt": "2026-10-06T09:12:00.000Z"
  }
 },
 "pageCounts": {
  "total_pages": 48,
  "error_pages": 0,
  "noindex_pages": 1
 },
 "issues": []
}
