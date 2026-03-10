# PowerShell & Gemini CLI Workshop

Welcome to the 45-minute rapid development workshop! In this session, we'll use the power of the Gemini CLI and PowerShell to scaffold, build, and deploy a project to GitHub.

## 🚀 Workshop Outline (45 Mins)

1.  **Environment Check (5 min):** Verifying PowerShell, Git, and Gemini CLI.
2.  **Repo Initialization (5 min):** `git init`, `.gitignore`, and connecting to GitHub.
3.  **AI-Driven Scaffolding (10 min):** Using Gemini CLI to create `GEMINI.md` and project files.
4.  **Rapid Development & Themes (10 min):** Building the Workshop Dashboard with Light/Dark mode.
5.  **Automation (5 min):** Running `Watch-Workshop.ps1` for real-time dashboard updates.
6.  **Version Control & Push (10 min):** Staging, committing, and pushing to the cloud.

## 🛠️ Setup Requirements

*   **PowerShell 7+**: Our primary shell environment.
*   **Git**: Version control for tracking our work.
*   **Gemini CLI**: Our AI-powered pair programmer.
*   **SSH Key**: Configured for GitHub authentication.

## ✨ Key Features Built

- **Workshop Dashboard (`index.html`)**: A clean UI for project status and links.
- **Theme Toggle**: Support for Light and Dark modes with persistent storage.
- **Auto-Update System**: `Watch-Workshop.ps1` script to update the UI as files change.
- **AI-Generated Bios**: Clean, professional bios generated automatically for participants.

## 🏃 Quick Start

```powershell
# 1. Initialize the repo
git init

# 2. Add Gemini mandates (GEMINI.md)

# 3. Create the dashboard (Let Gemini CLI do the work!)

# 4. Start the live watcher
.\Watch-Workshop.ps1

# 5. Open the dashboard
Start-Process .\index.html
```

---
*Created for the Rapid Workshop Series.*
