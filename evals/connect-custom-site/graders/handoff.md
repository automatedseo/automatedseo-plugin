---
type: llm
---

PASS if the reply says what is left before AutomatedSEO can publish: set the
AUTOMATEDSEO_WEBHOOK_TOKEN_SHA256 secret, deploy, check the live endpoint, and then
connect it with the webhook URL https://northpeakcoffee.example/api/automatedseo/articles
and a public URL template such as https://northpeakcoffee.example/blog/{slug}.
FAIL if it claims the endpoint is deployed or already connected.
