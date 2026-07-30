---
name: enrich-and-reformat-article
description: Reformat, clean, and enrich raw, web-clipped, or Notion-exported articles and recipe notes into Obsidian-friendly Markdown documents. Handles filename cleaning, MIME-type checks for extensionless images, frontmatter metadata, web noise removal, and YouTube transcript enrichment.
---

# Enrich & Reformat Article Skill

This skill provides a comprehensive workflow to clean, reformat, and enrich raw, web-clipped, or Notion-exported Markdown documents. It transforms noisy web dumps into beautifully structured, publication-ready Markdown notes.

---

## When to Use This Skill

Use this skill whenever you need to:

- Reformat raw web clippings or Notion exports in the workspace.
- Remove Notion export ID hashes from filenames and attachment subdirectories.
- Inspect and fix extensionless image attachments.
- Clean up web clipping noise (ads, tracking parameters, comment threads, duplicate headers).
- Standardize YAML frontmatter metadata and Markdown layouts.
- Enrich an existing note with technical depth or transcript data from a YouTube video URL.

---

## Core Workflow Steps

### Step 1: Filename & Directory Cleanup (Removing Notion Hashes)

1. **Detect Notion Hashes:** Check if the target `.md` file or its associated attachment folder contains hex export IDs (e.g. ` 6116616e160f4d53a5f2f418349367de`).
2. **Rename File & Folder:** Rename both the `.md` file and its attachment subdirectory to clean, descriptive titles.
3. **Update Internal Links:** Update all internal markdown links and image embed paths (`![caption](folder/image.jpg)`) inside the `.md` file to reference the updated folder name using **URL-encoded relative paths** (e.g., spaces replaced with `%20`).

### Step 2: Attachment MIME-Type Inspection & URL-Encoded Extension Fix

1. **Find Extensionless Files:** Scan attachment folders for files missing extension extensions (e.g., `untitled`, `untitled 1`).
2. **Detect MIME Type:** Run `file --mime-type <path>` on each extensionless attachment file.
3. **Rename with Correct Extension:** Append the correct extension based on MIME type (e.g., `image/jpeg` → `.jpg`, `image/png` → `.png`).
4. **URL-Encode Image Embed Paths:** Update all image embed paths in the Markdown file using **URL-encoded relative paths** (e.g. `![caption](Folder%20Name/untitled%201.jpg)` instead of unencoded `Folder Name/untitled 1.jpg`). Ensure spaces, quotes, ampersands, and non-ASCII characters in relative paths are properly percent-encoded using standard HTTP URL encoding.

### Step 3: Web Noise & Header Cleanup

1. **Remove Duplicate Headers:** Keep only a single main `# Title` heading.
2. **Strip Web Artifacts:** Remove web clipping junk, including:
   - Newsletter / subscription prompts
   - Print buttons & "Add to list" widgets
   - Social media login/comment sections
   - URL tracking parameters (e.g., `?prop26=...`)
   - Non-content navigation elements ("On Sale near you")

### Step 4: YAML Frontmatter & Layout Standardization

1. **Add YAML Metadata Block:**
   ```yaml
   ---
   title: "Clean Descriptive Title"
   source: "https://example.com/original-article"
   video_source: "https://www.youtube.com/watch?v=..." # If applicable
   author:
     - "[[Author Name]]"
   published: YYYY-MM-DD
   created: YYYY-MM-DD
   updated: YYYY-MM-DD
   description: "Concise 1-2 sentence summary of the article."
   tags:
     - "topic"
     - "subtopic"
     - "recipe"
   ---
   ```
2. **Standardize Section Layout:**
   - **Hero Quote / Image:** Include a high-level summary quote or primary hero image.
   - **Overview Table:** Use a Markdown table for quick metadata (Prep Time, Cook Time, Total Time, Yield, Servings, Source).
   - **Categorized Lists:** Group ingredients/requirements into logical categories (Produce, Seasonings, Equipment).
   - **Logical Step Groups:** Divide multi-step directions into named phases (e.g., `Step 1: Prep & Sauté`, `Step 2: Simmer & Reduce`).
   - **Callout Blocks:** Highlight tips and warnings using GitHub Markdown callout syntax:
     - `> [!TIP]` for practical chef's advice or optimizations.
     - `> [!NOTE]` for scientific explanations or scaling advice.
     - `> [!IMPORTANT]` for critical instructions or safety warnings.

### Step 5: Content Enrichment (Optional YouTube Transcript Analysis)

1. **Fetch Transcript:** If a YouTube URL is provided or referenced, run the transcript script:
   ```bash
   /home/alazarchuk/Documents/Outliner/.agents/skills/youtube-video-to-article-md/scripts/get_transcript.sh "<YOUTUBE_URL>" en
   ```
2. **Extract Technical & Culinary Science Depth:**
   - Identify core mechanisms (e.g., Maillard reaction, enzyme deactivation, glutamate synergy, hydrocolloid mouthfeel replacements).
   - Extract exact ratios, temperatures, and timing parameters.
3. **Synthesize & Enrich:** Add dedicated "Culinary Science", "Deep Dive", or "Why It Works" sections into the Markdown article to elevate it beyond a simple recipe card.

---

## Example Usage

### Input (Raw Notion/Web Dump)

```markdown
# Creamy White Wine Sauce Recipe

Tags: next
Created: April 30, 2018 11:41 AM
URL: https://www.allrecipes.com/recipe/20895/creamy-white-wine-sauce/?prop26=123

# Creamy White Wine Sauce

Recipe by: sal

## Like Vegetarian recipes? Follow for recommendations

- 1 cup heavy whipping cream
- 3/4 cup white wine
  [Print] [Add Note]

1. In saucepan combine cream, wine...
```

### Output (Clean Enriched Markdown)

```markdown
---
title: "Creamy White Wine Sauce"
source: "https://www.allrecipes.com/recipe/20895/creamy-white-wine-sauce/"
author:
  - "sal"
created: 2018-04-30
description: "A quick, rich, and silky white wine and heavy cream sauce thickened with flour and seasoned with parsley."
tags:
  - "food"
  - "sauces"
  - "recipe"
  - "vegetarian"
---

# Creamy White Wine Sauce

A simple yet elegant sauce made from dry white wine and heavy cream simmered with flour and parsley.

---

## Recipe Overview

| Attribute      | Details |
| :------------- | :------ |
| **Prep Time**  | 0 mins  |
| **Cook Time**  | 15 mins |
| **Total Time** | 15 mins |
| **Servings**   | 8       |

---

## Ingredients

- **1 cup** heavy whipping cream
- **¾ cup** dry white wine
- **2 tbsp** all-purpose flour
- **1 tsp** salt
- **1 tsp** dried parsley

---

## Instructions

1. **Combine Ingredients:** In a medium saucepan set over medium-high heat, combine heavy cream, white wine, flour, salt, and parsley.
2. **Bring to a Boil:** Whisk thoroughly until smooth and bring to a boil.
3. **Simmer & Thicken:** Reduce heat to low and simmer until thickened to desired consistency.

---

## Chef's Tips

> [!TIP]
> **Choosing the Wine:** Use a dry white wine such as Sauvignon Blanc or Pinot Grigio. Avoid sweet white wines or salted cooking wine.
```
