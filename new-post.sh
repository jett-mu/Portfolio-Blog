#!/usr/bin/env bash
# Usage: ./new-post.sh "My Post Title"
# Creates _posts/YYYY-MM-DD-my-post-title.md and assets/images/my-post-title/.
set -euo pipefail

if [ $# -eq 0 ]; then
  echo 'Usage: ./new-post.sh "My Post Title"' >&2
  exit 1
fi

title="$*"
escaped_title=${title//\"/\\\"}
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')
date=$(date +%Y-%m-%d)
file="_posts/${date}-${slug}.md"
images="assets/images/${slug}"

cd "$(dirname "$0")"

if [ -e "$file" ]; then
  echo "Already exists: $file" >&2
  exit 1
fi

mkdir -p "$images"
cat > "$file" <<POST
---
layout: post
title: "${escaped_title}"
date: $(date '+%Y-%m-%d %H:%M:%S %z')
tags: []
---

Write your post here.

<!-- Put images in ${images}/ and embed them like this:
![Description]({{ "/${images}/photo.jpg" | relative_url }})
-->
POST

echo "Created $file"
echo "Put images in $images/ and embed them with:"
echo "  ![Description]({{ \"/${images}/photo.jpg\" | relative_url }})"
