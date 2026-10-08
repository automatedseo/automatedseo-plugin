---
expect:
  workspaceId: "ws-northpeak"
  websiteId: "site-northpeak"
  articleId: "string"
  scheduledAt: "string"
  timeZone: "string"
---

{
 "article": {
  "id": "{{input.articleId}}",
  "status": "planned",
  "scheduled_at": "{{input.scheduledAt}}",
  "editor_version": 2
 },
 "moved": true
}
