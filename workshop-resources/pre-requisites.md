# 🛠️ Workshop Pre-requisites

Welcome to the workshop! To ensure a smooth experience, please complete the following setup steps on your local machine.

---

## 🟢 1. Install Node.js

Node.js is required to run the Gemini CLI. If you don't have it installed yet, you can do so quickly via the terminal.

### **Option A: Using Windows Package Manager (Recommended)**
Run this command in your **PowerShell** terminal:

```powershell
winget install OpenJS.NodeJS.LTS
```

> [!IMPORTANT]
> **Restart your terminal** after the installation finishes to ensure the changes take effect.

### **Verification**
To confirm Node.js is ready, type:
```powershell
node -v
```
*You should see a version number (e.g., v20.x.x).*

---

## ♊ 2. Install Gemini CLI

Once Node.js is installed, you can install the Gemini CLI tool globally.

### **Installation Command**
Run the following command in your terminal:

```powershell
npm install -g @google/gemini-cli
```

### **Verification**
Confirm the installation by checking the version or accessing the help menu:
```powershell
gemini --help
```

---

## 🚀 3. Getting Started
Now that you have the tools installed, you are ready to begin! 

- **Check your configuration:** `gemini config list`
- **Need help?** Just type `gemini --help` at any time.

---
*Good luck with the workshop!*
