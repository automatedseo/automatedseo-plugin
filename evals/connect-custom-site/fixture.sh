#!/bin/bash
# A small Next.js blog that renders Markdown posts from content/posts.
set -euo pipefail
mkdir -p app/blog/'[slug]' content/posts lib
cat > package.json <<'EOF'
{
  "name": "north-peak-blog",
  "private": true,
  "scripts": { "dev": "next dev", "build": "next build", "test": "vitest run" },
  "dependencies": { "next": "16.0.0", "react": "19.2.0", "react-dom": "19.2.0", "gray-matter": "4.0.3", "marked": "16.0.0" },
  "devDependencies": { "typescript": "5.9.3", "vitest": "3.2.4", "@types/node": "24.0.0", "@types/react": "19.2.0" }
}
EOF
cat > lib/posts.ts <<'EOF'
import fs from "node:fs";
import path from "node:path";
import matter from "gray-matter";

const dir = path.join(process.cwd(), "content/posts");

export type Post = { slug: string; title: string; description: string; date: string; body: string };

export function allPosts(): Post[] {
  return fs
    .readdirSync(dir)
    .filter((file) => file.endsWith(".md"))
    .map((file) => {
      const { data, content } = matter(fs.readFileSync(path.join(dir, file), "utf8"));
      return { slug: file.replace(/\.md$/, ""), title: data.title, description: data.description, date: data.date, body: content };
    })
    .sort((a, b) => b.date.localeCompare(a.date));
}

export function post(slug: string): Post | undefined {
  return allPosts().find((p) => p.slug === slug);
}
EOF
cat > 'app/blog/[slug]/page.tsx' <<'EOF'
import { marked } from "marked";
import { notFound } from "next/navigation";
import { post } from "@/lib/posts";

export default async function BlogPost({ params }: { params: Promise<{ slug: string }> }) {
  const found = post((await params).slug);
  if (!found) notFound();
  return (
    <article>
      <h1>{found.title}</h1>
      <div dangerouslySetInnerHTML={{ __html: marked.parse(found.body) as string }} />
    </article>
  );
}
EOF
cat > app/blog/page.tsx <<'EOF'
import Link from "next/link";
import { allPosts } from "@/lib/posts";

export default function Blog() {
  return (
    <ul>
      {allPosts().map((p) => (
        <li key={p.slug}><Link href={`/blog/${p.slug}`}>{p.title}</Link></li>
      ))}
    </ul>
  );
}
EOF
cat > app/sitemap.ts <<'EOF'
import { allPosts } from "@/lib/posts";

export default function sitemap() {
  return allPosts().map((p) => ({ url: `https://northpeakcoffee.example/blog/${p.slug}`, lastModified: p.date }));
}
EOF
cat > content/posts/cold-brew-ratio.md <<'EOF'
---
title: "Cold brew ratio: the only chart you need"
description: "The cold brew ratios we use, by strength."
date: "2026-08-12"
---

Start with 1:8 for concentrate and 1:15 for ready-to-drink.
EOF
cat > tsconfig.json <<'EOF'
{ "compilerOptions": { "strict": true, "jsx": "preserve", "module": "esnext", "moduleResolution": "bundler", "paths": { "@/*": ["./*"] } } }
EOF
cat > README.md <<'EOF'
# North Peak Coffee blog

Next.js site deployed to Vercel from main. Posts are Markdown files in content/posts.
EOF
git init -q && git add -A && git -c user.email=dev@example.test -c user.name=Dev commit -qm "Blog"
