---
expect:
  workspaceId: "ws-northpeak"
  websiteId: "site-northpeak"
  endpointUrl: "string"
  webhookToken: "string"
  publicUrlTemplate: "string"
---

{
 "connection": {
  "id": "conn-npc-webhook",
  "endpoint_url": "{{input.endpointUrl}}",
  "status": "active",
  "public_url_template": "{{input.publicUrlTemplate}}"
 },
 "connected": true
}
