---
name: ci
description: Automates the workflow of creating a new branch, committing local changes, pushing to remote, and opening a Pull Request. Use this when you want to quickly wrap up your current work and submit it for review.
---

# CI Skill

## Overview

The `ci` skill streamlines the process of submitting local changes to a remote repository. It automates the boilerplate steps of branching, committing, pushing with upstream tracking, and creating a Pull Request (PR) against the original branch.

## Workflow

When the user triggers this skill (e.g., by saying "ci", "wrap up my work", or "create a PR"), follow this workflow:

1. **Analyze Changes**: Check `git status` to ensure there are changes to commit.
2. **Determine Metadata**:
   - **Branch Name**: Propose a concise, hyphenated branch name based on the changes (e.g., `fix-parser-bug`, `feat-auth-logic`).
   - **Commit Message**: Propose a clear, descriptive commit message following project conventions.
   - **PR Description**: Generate a detailed Markdown-formatted description summarizing the changes, the "why" behind them, and any testing performed.
3. **Confirm with User**: Present the proposed branch name, commit message, and PR description to the user for approval or modification.
4. **Execute Automation**: Use the bundled `ci.sh` script to perform the operations.

### Execution Command

```bash
./scripts/ci.sh <branch_name> "<commit_message>" "<pr_description>"
```

The script will:
- Record the current branch as the `base` branch.
- Create and checkout the new `<branch_name>`.
- Add all local changes and commit with `<commit_message>`.
- Identify the git remote and push the branch with the `-u` (upstream) flag.
- Use the `gh` CLI to create a Pull Request against the original `base` branch.

## Guidelines

- **Context Awareness**: If you've been working on a specific task or issue, incorporate the issue number or task name into the branch and commit message.
- **Verification**: Ensure the `gh` CLI is authenticated. If the script fails due to authentication, advise the user to run `gh auth login`.
- **Single Commit**: This skill is designed for wrapping up a set of changes into a single commit on a new branch. For more complex branching strategies, advise the manual approach.

## Examples

**User**: "ci"
**Agent**: "I see you have changes in `src/parser.ts`. I propose:
- **Branch**: `fix-parser-logic`
- **Commit**: `Fix: Resolve timeout issue in parser`
- **PR Description**: A summary of the parser changes and the fix for the timeout bug.

Shall I proceed with creating the PR?"

**User**: "wrap up this work and call the branch feature-x"
**Agent**: "Understood. I'll create the branch `feature-x`, commit your changes with a descriptive message, and open a PR with a detailed description of the work. Proceeding now..."
