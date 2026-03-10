# Workshop Reference Guide: Project Setup & Gemini CLI

This guide provides a step-by-step walkthrough of the commands and processes used to initialize this project, configure Gemini CLI, and deploy to GitHub.

## 🛠️ Required Tools
Before starting, ensure you have the following installed:
- **PowerShell 7+**: The modern cross-platform shell.
- **Git**: Essential for version control.
- **Visual Studio Code**: Recommended editor. You can open your project by typing `code .` in PowerShell.
- **Gemini CLI**: The AI assistant used throughout this workshop.

## 1. Local Repository Initialization
First, we set up the local environment and git tracking.

```powershell
# Initialize a new Git repository
git init

# Create a .gitignore to exclude large or unnecessary files
# Example: echo "*.tar.gz" > .gitignore
```

## 2. Gemini CLI Customization (GEMINI.md)
We created a `GEMINI.md` file to give the AI specific instructions for this project. This file is the "brain" for the AI's behavior in your workspace.

**Key Mandates Added:**
*   Explicit authorization for Git operations.
*   Project goals and time constraints (45-min workshop).
*   Coding standards (Kebab-case, clean scripts).

## 3. GitHub Authentication (SSH)
To push code securely without entering passwords, we used an existing SSH key.

```powershell
# Check for existing public keys
ls ~/.ssh/*.pub

# Copy the key to clipboard for GitHub (Windows)
type $HOME\.ssh\id_rsa.pub | clip

# Test connection and trust GitHub's host key
ssh -T git@github.com
```

## 4. Connecting to GitHub
We linked the local repo to a remote repository on GitHub.

```powershell
# Add the remote origin
git remote add origin git@github.com:username/reponame.git

# Push the initial main branch
git push -u origin main
```

## 5. Rapid Scaffolding
Using Gemini CLI, we generated a functional `index.html` dashboard and a `README.md` outline in seconds.

```powershell
# Command to view the dashboard locally
Start-Process .\index.html
```

## 6. Automation (PowerShell Watcher)
We built a `Watch-Workshop.ps1` script to monitor the `images/students` folder. This script automatically updates the `index.html` with new profiles and AI-generated bios whenever you drop in a photo.

```powershell
# Run the watcher script
.\Watch-Workshop.ps1
```

## 7. UI Enhancements (Theme Toggle)
The dashboard includes a light/dark theme toggle that uses CSS variables and JavaScript to persist preferences in `localStorage`.

## 8. Syncing Changes
Frequent commits and pushes ensure your work is saved to the cloud.

```powershell
# Stage, commit, and push (PowerShell syntax)
git add .; git commit -m "Your descriptive message"; git push
```

---
*Reference for the PowerShell & Gemini CLI Workshop.*
