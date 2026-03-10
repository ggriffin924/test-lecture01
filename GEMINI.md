# Workspace Customization (GEMINI.md)

This file provides project-specific instructions and context for Gemini CLI. These mandates take precedence over general defaults.

## Project Overview
- **Goal:** Provide a 45-minute workshop demonstrating PowerShell, GitHub repository setup, and Gemini CLI integration on a local PC.
- **Stack:** PowerShell, Git, Gemini CLI.
- **Key Constraints:** 45-minute time limit. Avoid large downloads or slow processes. Focus on rapid local execution and immediate visual feedback.

## Engineering Standards
### Coding Style & Conventions
- **Naming:** Kebab-case for filenames, simple and descriptive variables.
- **Formatting:** Clean, readable scripts without heavy boilerplate.
- **Documentation:** Minimal but clear comments to explain steps to students.

### Architecture & Patterns
- **Pattern:** Simple procedural scripts or basic single-file web pages.
- **Data Flow:** Local-first development with frequent Git pushes to demonstrate version control.

## Testing Strategy
- **Framework:** [e.g., Jest, Vitest, Pytest]
- **Requirements:** [e.g., Minimum 80% coverage, every bug fix needs a regression test]
- **Commands:**
  - Test: `npm test`
  - Coverage: `npm run coverage`

## Workspace Commands
- **Build:** `npm run build`
- **Lint:** `npm run lint`
- **Dev:** `npm run dev`

## AI Behavior Prefs
- **Tone:** Professional and terse.
- **Automation:** Always run lint --fix after edits.
- **Safety:** Never modify the .env.example file.
- **Screenshots:** When the user asks to "take a look" at what they are working on or to check a screenshot, automatically identify and analyze the most recently modified image file in the `screenshots/` directory.
- **Source Control:** Gemini is explicitly authorized to perform Git operations (stage, commit, branch, etc.) as needed to fulfill tasks in this project.
