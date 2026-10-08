---
name: review-article
description: Review and edit an article in AutomatedSEO against the website's brand rules (voice, preferred terms, phrases to avoid, prohibited claims) and its title, meta description and on-page SEO, then save the fixes. Use when the user asks to review, proofread, edit, improve or brand-check a draft or article, or to fix its title or meta description.
---

# Review an article

## Load the article and the rules

1. Call `list_websites`. Use the website the user named, or the only one. If there are several and none was named, ask which.
2. Find the article with `list_articles` (filter by `status`, such as `review` or `drafting`, when that helps) and match the user's description. Call `get_article` for its body, meta fields, brief and `editor_version`.
3. Call `get_content_settings`. The rules are `voiceGuidelines`, `preferredTerms`, `phrasesToAvoid`, `topicsToAvoid`, `writingStyleGuide`, and in `business`, `approvedClaims` and `prohibitedClaims`.

## Check

Go through the title, meta title, meta description, excerpt and body:

- **Phrases to avoid**: every occurrence, in any case or tense.
- **Claims**: remove or rewrite anything in `prohibitedClaims` or `topicsToAvoid`. A claim about certification, health, guarantees or results that isn't in `approvedClaims` is a risk: rewrite it to an approved claim or drop it.
- **Preferred terms**: replace variants with the preferred wording.
- **Voice and style**: match `voiceGuidelines` and `writingStyleGuide`.
- **SEO**: title and meta title 60 characters or fewer and containing the target query; meta description 120 to 160 characters, with the query and a reason to click; the opening paragraph answers the query.

Keep the brief's angle and leave anything that already works.

## Save

If the user asked for fixes, save them with one `update_article` call. Send only the fields that changed (the whole `bodyMarkdown` if the body changed) and `expectedVersion` set to the `editor_version` from `get_article`. If it fails because the version changed, call `get_article` again, reapply your edits and retry once.

Editing an approved, scheduled or published article sends it back to drafting, so someone approves it again in AutomatedSEO, and a live page changes only when it's republished. Tell the user when that applies.

If the user only asked for a review, list the changes you'd make and ask before saving.

## Reply

List the changes grouped by brand rules, claims and SEO, with before and after for the title and meta description, and anything left for the user to decide.
