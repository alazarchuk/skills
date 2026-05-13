#!/bin/bash
set -e

# Usage: ci.sh <new_branch_name> <commit_message> <pr_description>
NEW_BRANCH=$1
COMMIT_MESSAGE=$2
PR_DESCRIPTION=$3

if [ -z "$NEW_BRANCH" ] || [ -z "$COMMIT_MESSAGE" ] || [ -z "$PR_DESCRIPTION" ]; then
    echo "Error: Branch name, commit message, and PR description are required."
    echo "Usage: ./ci.sh <branch-name> \"<commit message>\" \"<pr description>\""
    exit 1
fi

# Get current branch to use as base for PR
BASE_BRANCH=$(git branch --show-current)

# Check if there are changes to commit
if [ -z "$(git status --short)" ]; then
    echo "Error: No changes detected to commit."
    exit 1
fi

# Create and checkout new branch
echo "Creating and checking out branch: $NEW_BRANCH"
git checkout -b "$NEW_BRANCH"

# Stage all changes and commit
echo "Committing changes..."
git add .
git commit -m "$COMMIT_MESSAGE"

# Identify remote
REMOTE=$(git remote | head -n 1)
if [ -z "$REMOTE" ]; then
    echo "Error: No remote found."
    exit 1
fi

# Push changes with -u
echo "Pushing to $REMOTE/$NEW_BRANCH..."
git push -u "$REMOTE" "$NEW_BRANCH"

# Create PR against the base branch
echo "Creating Pull Request against $BASE_BRANCH..."
gh pr create --base "$BASE_BRANCH" --head "$NEW_BRANCH" --title "$COMMIT_MESSAGE" --body "$PR_DESCRIPTION"

echo "Success! PR created and changes pushed."
