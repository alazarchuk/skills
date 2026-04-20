---
name: youtube-video-to-article-md
description: Fetch YouTube video transcripts and convert them into a detailed, well-structured article in Markdown. Ideal for summarizing long-form content, educational videos, or video essays.
---

# YouTube Video to Article Markdown

This skill extracts the transcript from a YouTube video and transforms it into a comprehensive, engaging article in Markdown.

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
- **File Name Convention:** Use the video's title as the file name (e.g., `The Future of Artificial Intelligence - Deep Dive.md`).
- **User Prompt:** If no path was provided, ASK the user: "Where would you like me to save the generated Markdown file? (e.g., './The Future of Artificial Intelligence - Deep Dive.md')"

### 4. Generate Article
Once the transcript text is retrieved and the destination is known:
- **Extract Description Information:** Extract useful information and links from the video description.
- **Clean and Synthesize:** Remove filler words and repetitive phrases. Synthesize the spoken transcript into coherent, written-style prose.
- **Header:** You MUST add a header to the top of the file following the format in `assets/header-example.md`.
    - Extract the **Title** of the video.
    - Set the **Source** to the YouTube URL.
    - Identify the **Author** (channel name).
    - Use the current date for **Created**.
    - Estimate/Extract **Published** date if possible, otherwise omit or use a placeholder.
    - Provide a short **Description** (1-2 sentences).
    - Add relevant **Tags**.
- **Article Structure:**
    - **Introduction:** An engaging opening that introduces the topic and the key themes discussed in the video.
    - **Thematic Sections:** Break down the content into logical, named sections based on the transcript's narrative. Use descriptive `##` and `###` headings. Use paragraphs for detailed explanations rather than just bullet points.
    - **Key Takeaways:** A summary of the most important points or arguments made in the video.
    - **Conclusion:** A final summary or closing thought that ties the themes together.
    - **Resources:** List useful links and supplementary information extracted from the video description.
- **Save File:** Write the content to the chosen destination path.

## Implementation Details

- **Script Location:** `scripts/get_transcript.sh`
- **Output:** A single `.md` file with the structured article content.
