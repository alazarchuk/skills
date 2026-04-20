#!/bin/bash

# Fetch YouTube transcript using yt-dlp
# Usage: ./get_transcript.sh <url> [lang]
# Returns: The transcript content as plain text

URL=$1
LANG=${2:-en}

if [ -z "$URL" ]; then
    echo "Error: No URL provided."
    exit 1
fi

# List available subtitles to detect language
SUB_LIST=$(yt-dlp --list-subs "$URL" 2>/dev/null)

# Check if the requested language (or auto-generated) is available
if ! echo "$SUB_LIST" | grep -q "$LANG"; then
    echo "AVAILABLE_SUBS_LIST"
    echo "$SUB_LIST"
    exit 2
fi

# Download and convert to plain text (using .vtt as intermediate)
# Note: we use --skip-download to only get the subtitles
TMP_BASE="tmp_$(date +%s)"
yt-dlp --skip-download --write-auto-subs --sub-langs "$LANG" --output "${TMP_BASE}.vtt" "$URL" > /dev/null 2>&1

# Move the actual file (yt-dlp adds the lang code to the filename)
ACTUAL_FILE=$(ls ${TMP_BASE}*.*.vtt 2>/dev/null | head -n 1)

if [ -f "$ACTUAL_FILE" ]; then
    # Simple VTT to plain text conversion: remove timestamps and tags
    grep -vE '^[0-9]{2}:[0-9]{2}:[0-9]{2}' "$ACTUAL_FILE" | sed 's/<[^>]*>//g' | sed 's/&nbsp;//g' | sed '/^WEBVTT/d' | sed '/^Kind:/d' | sed '/^Language:/d' | tr -s '\n'
    rm ${TMP_BASE}*.*.vtt
else
    echo "Error: Failed to download transcript. Check if yt-dlp is installed and the URL is correct."
    exit 1
fi
