---
expect:
  workspaceId: "ws-northpeak"
  websiteId: "site-northpeak"
  targetQuery: "string"
---

{
 "article": {
  "id": "plan-{{input.targetQuery}}",
  "website_id": "site-northpeak",
  "title": "{{input.targetQuery}}",
  "slug": null,
  "target_query": "{{input.targetQuery}}",
  "status": "planned",
  "scheduled_at": null,
  "editor_version": 1
 },
 "created": true,
 "dispatch": {
  "dispatched": 1
 }
}
