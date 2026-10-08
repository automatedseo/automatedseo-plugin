# Evals

Six cases, one per skill, run against mocks of the AutomatedSEO MCP server for a fictional site, North Peak Coffee (`mocks/automatedseo/`). The mocks follow the real response shapes; `_tools.json` is the server's real `tools/list` without output schemas.

Run from the plugin folder with a signed-in Claude Code CLI (`claude auth login`):

```bash
claude plugin eval . --scaffold --allow-tools Write Edit --no-publish --trust-plugin -j 4
```

Add `--ablation none` to skip the no-plugin arm. To measure what the skills add over the connector alone, run the same suite against a copy of the plugin without `skills/`.

Results on 2026-10-08, 3 runs per case, graders other than "skill fired":

| Case | Connector only | With skills |
| --- | --- | --- |
| connect-custom-site | 67% | 100% |
| prospect-audit | 67% | 100% |
| seo-report | 92% | 100% |
| fix-site-issues | 100% | 100% |
| plan-content | 100% | 100% |
| review-article | 100% | 100% |
