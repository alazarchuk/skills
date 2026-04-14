---
name: youtube-how-to-video-to-md
description: Fetch YouTube video transcripts and convert them into structured, step-by-step 'How-to' markdown instructions. Use this when you need to extract procedural knowledge from a YouTube URL.
---

# YouTube How-to Video to Markdown

This skill extracts the transcript from a YouTube video and transforms it into a clear, actionable 'How-to' guide in Markdown.

## Core Workflow

### 1. Retrieve the Transcript
Given a YouTube URL, execute the `get_transcript.sh` script to fetch the transcript.

```bash
# Default to English (en)
./scripts/get_transcript.sh <url> en
```

### 2. Handle Language Preferences
- **Language Detection:** If the video's default language is NOT English, the script will return `AVAILABLE_SUBS_LIST`.
- **User Prompt:** If the default language is not English, ASK the user:
    - "The video's default language is [language]. Would you like me to fetch the original transcript, or a translated version (if available)?"
- **Re-run script:** Execute the script again with the user's preferred language code.

### 3. Determine Save Location
- **Path Selection:** Check if the user specified a destination path in their request.
- **User Prompt:** If no path was provided, ASK the user: "Where would you like me to save the generated Markdown file? (e.g., './instructions.md')"

### 4. Generate Instructions
Once the transcript text is retrieved and the destination is known:
- **Clean the Text:** Remove filler words (e.g., "uh", "um", "like", "so").
- **Header:** You MUST add a header to the top of the file following the format in `assets/header-example.md`.
    - Extract the **Title** of the video.
    - Set the **Source** to the YouTube URL.
    - Identify the **Author** (channel name).
    - Use the current date for **Created**.
    - Estimate/Extract **Published** date if possible, otherwise omit or use a placeholder.
    - Provide a short **Description** (1-2 sentences).
    - Add relevant **Tags**.
- **Structure as a Guide:** Create the rest of the structured Markdown document:
    - **Overview:** A 1-2 sentence summary of the task.
    - **Requirements:** List any tools or materials mentioned.
    - **Steps:** A numbered list of clear, actionable steps.
    - **Tips/Warnings:** Include any specific advice from the transcript.
- **Save File:** Write the content to the chosen destination path.

## Implementation Details

- **Script Location:** `scripts/get_transcript.sh`
- **Output:** A single `.md` file with the structured instructions.
