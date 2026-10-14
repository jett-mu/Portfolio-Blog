# Portfolio-Blog

A Jekyll blog published with GitHub Pages at `https://<username>.github.io/Portfolio-Blog/`.

## Write a post

```bash
./new-post.sh "My Post Title"
```

This creates `_posts/YYYY-MM-DD-my-post-title.md` and an image folder at `assets/images/my-post-title/`. Write in Markdown, then:

```bash
git add . && git commit -m "New post" && git push
```

The site rebuilds about a minute after the push.

You can also do everything on github.com. Open `_posts/` and use **Add file → Create new file**, naming it `YYYY-MM-DD-title.md`. To add images, open an image folder and use **Add file → Upload files**.

Every post starts with this header:

```yaml
---
layout: post
title: "My Post Title"
date: 2026-10-14 12:00:00 -0700
tags: [optional, tags]
---
```

## Add an image

Drop the file into `assets/images/<post-name>/` and embed it:

```markdown
![Description]({{ "/assets/images/my-post-title/photo.jpg" | relative_url }})
```

Keep the `relative_url` part. It adds the `/Portfolio-Blog` prefix so the image loads on GitHub Pages.

## Drafts

Posts in `_drafts/` (no date in the filename) are not published.

## Preview locally (optional)

macOS ships an old Ruby, so install a newer one first:

```bash
brew install ruby
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
bundle install
bundle exec jekyll serve --livereload --drafts
```

Then open <http://localhost:4000/Portfolio-Blog/>.
