# AutomatedSEO for Claude

Turn your [AutomatedSEO](https://automatedseo.app) workspace into finished SEO work from a conversation with Claude. Ask how your site is doing and get a report you can forward. Ask what's broken and get a ranked fix list. Ask what to write next and Claude plans the articles and puts them on your content calendar.

The plugin bundles the AutomatedSEO connector with six skills that tell Claude which data to pull, in what order, and what a good answer looks like. It works in Claude chat, Cowork and Claude Code.

## Skills

| Skill | Ask something like | What you get |
| --- | --- | --- |
| `seo-report` | "How did my site do this month? Write it up for my business partner." | Clicks, impressions and position, what changed, site health, content shipped and planned, next steps |
| `fix-site-issues` | "What's broken on my site and what should I fix first?" | A ranked fix list naming pages and the exact change. In Claude Code, Claude can make the fixes in your code |
| `plan-content` | "Pick the next three articles I should write and schedule them." | Relevant keywords picked from your data, article plans created and scheduled on free days |
| `review-article` | "Check my pour over draft against our brand rules and fix it." | The draft edited for your voice, banned phrases, prohibited claims and SEO, saved back to AutomatedSEO |
| `prospect-audit` | "I have a sales call with a local dentist on Thursday. Audit their site and draft an email." | Domain rating, homepage audit, rankings for local searches, and a short pre-call email |
| `connect-custom-site` | "Set up AutomatedSEO to publish into this blog." | In Claude Code: the publishing webhook built in your codebase, deployed and connected |

## Get started

1. Install the plugin, then connect AutomatedSEO from the plugin's Connectors tab (in Claude Code it connects on first use).
2. Sign in with your AutomatedSEO account and approve access for your workspace.
3. Ask one of the questions above.

You need an AutomatedSEO workspace with at least one website. Claude starts with read access. The first time a skill changes something, such as creating an article plan, Claude asks for write access and AutomatedSEO shows an approval screen. Claude can't approve or publish an article that hasn't been approved in AutomatedSEO.

## Data and privacy

- The plugin talks only to the AutomatedSEO MCP server at `https://automatedseo.app/api/mcp`, through the connection you approve. It contains no scripts or hooks and sends data nowhere else.
- Claude reads your workspace's site health, search performance, keywords, articles, calendar, backlinks and content settings, and changes only what a skill's task needs: article plans, schedules, article edits, site checks and webhook connections.
- `prospect-audit` checks domains and pages you name. Domain ratings, page audits and rank checks come from your workspace's weekly allowance (per website: 100 domain ratings, 25 backlink profiles, 100 audits, 50 speed tests and 50 rank checks).
- How AutomatedSEO handles your data: [privacy policy](https://automatedseo.app/legal/privacy) and [terms](https://automatedseo.app/legal/terms).

## Support

Read the [connector guide](https://automatedseo.app/docs/mcp), visit [automatedseo.app/support](https://automatedseo.app/support), or email hello@automatedseo.app.

## License

MIT. See [LICENSE](LICENSE).
