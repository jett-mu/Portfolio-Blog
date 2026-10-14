---
layout: post
title: "Building a weather app in a weekend"
date: 2026-10-05 14:00:00 -0700
tags: [projects, javascript]
---

This is an example of a project write-up, with a screenshot, code, a table, and a footnote.

![App screenshot]({{ "/assets/images/building-a-weather-app/screenshot.svg" | relative_url }})

## The idea

I wanted a weather app that shows *one* number when I open it, with no ads and no ten-day forecast I'll never read.

## How it works

The app calls a free weather API[^1] and renders the result:

```javascript
async function getWeather(lat, lon) {
  const url = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current=temperature_2m`;
  const res = await fetch(url);
  const data = await res.json();
  return data.current.temperature_2m;
}
```

Inline code looks like this: `getWeather(42.36, -71.06)`.

## What I used

| Part      | Tool             | Why                          |
|-----------|------------------|------------------------------|
| Frontend  | Plain HTML + JS  | No build step needed         |
| Data      | Open-Meteo       | Free, no API key             |
| Hosting   | GitHub Pages     | Same place as this blog      |

## What I'd do differently

- Cache the last result so the app works offline
- ~~Add a 10-day forecast~~ Nope, that defeats the point
- Support °C / °F switching

[^1]: [Open-Meteo](https://open-meteo.com/) is free for non-commercial use.
