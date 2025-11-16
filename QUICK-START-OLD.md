# Quick Start Guide

## Running the Automation in 3 Simple Steps

### 1️⃣ Open PowerShell in VS Code
```powershell
cd c:\Users\ugans\source\repos\Iteration-release-manager
```

### 2️⃣ Run the Script
```powershell
.\Generate-ReleaseNotes.ps1
```

### 3️⃣ Follow the Prompts
The script will guide you through 4 steps. For each step:
- Copy the displayed prompt
- Open GitHub Copilot Chat (Ctrl+Shift+I)
- Paste the prompt and let Copilot work
- Press Enter in the terminal when Copilot is done

---

## What You'll Get

After running the script, you'll have these files in the `output/` folder:

📄 **iteration-info.json** - Iteration metadata  
📄 **work-items-with-prs.json** - All work items and PR data  
📄 **internal-summary-TIMESTAMP.md** - For engineering managers  
📄 **insider-release-notes-TIMESTAMP.md** - For Windows Insiders

---

## Before You Start

Make sure you have:
- ✅ VS Code with GitHub Copilot installed
- ✅ ADO MCP server connected to Copilot
- ✅ Access to the OS project in Azure DevOps

---

## Need Help?

See the full [README.md](README.md) for detailed instructions, troubleshooting, and customization options.

---

## Example Output

Check the `examples/` folder to see what the generated files look like!
