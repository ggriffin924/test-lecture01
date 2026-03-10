# Workspace Customization (GEMINI.md)

This file provides project-specific instructions and context for Gemini CLI. These mandates take precedence over general defaults.

## Project Overview
- **Goal:** [Describe the primary purpose of this project]
- **Stack:** [e.g., React, TypeScript, Node.js, Python, Go]
- **Key Constraints:** [e.g., Must support IE11, No external dependencies]

## Engineering Standards
### Coding Style & Conventions
- **Naming:** [e.g., camelCase for variables, PascalCase for components]
- **Formatting:** [e.g., Use Prettier with the provided .prettierrc]
- **Types:** [e.g., Prefer interfaces over types, use strict null checks]
- **Documentation:** [e.g., JSDoc for all public functions, mandatory README updates]

### Architecture & Patterns
- **Pattern:** [e.g., Clean Architecture, MVC, Functional Programming]
- **State Management:** [e.g., Redux, Context API, Zustand]
- **Data Flow:** [e.g., Unidirectional, Event-driven]

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
- **Source Control:** Gemini is explicitly authorized to perform Git operations (stage, commit, branch, etc.) as needed to fulfill tasks in this project.
