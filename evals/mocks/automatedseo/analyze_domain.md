---
expect:
  workspaceId: "ws-northpeak"
  domain: "string"
---

{
 "domain": "{{input.domain}}",
 "authority": {
  "score": 21,
  "metric": "Domain InLink Rank",
  "provider": "SE Ranking"
 },
 "backlinks": 340,
 "referringDomains": 58,
 "dofollowShare": 71,
 "brokenBacklinks": 6,
 "topLinks": [
  {
   "sourceUrl": "https://denverdentists.example/directory/a-z",
   "sourceDomain": "denverdentists.example",
   "targetUrl": "https://{{input.domain}}/",
   "anchor": "Bright Smile Dental",
   "dofollow": true,
   "firstSeen": "2024-02-11",
   "lastSeen": null
  },
  {
   "sourceUrl": "https://chamber-denver.example/members",
   "sourceDomain": "chamber-denver.example",
   "targetUrl": "https://{{input.domain}}/",
   "anchor": "Visit website",
   "dofollow": false,
   "firstSeen": "2023-06-02",
   "lastSeen": null
  }
 ],
 "provider": "moz",
 "measuredAt": "2026-10-08T09:00:00.000Z",
 "cached": false,
 "cachedAt": null,
 "remainingThisWeek": 99
}
