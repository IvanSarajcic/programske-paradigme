# Automation Scripts

This folder contains PowerShell scripts to automate common tasks for the Programske Paradigme course.

## Available Scripts

### 1. `create-lesson.ps1` - Create New Lesson
Creates a new lesson folder with template files.

**Usage:**
```powershell
.\scripts\create-lesson.ps1 -LessonId "I-04" -TopicName "Imperativno-programiranje"

# With VS Code auto-open
.\scripts\create-lesson.ps1 "II-05" "Promenljive-i-tipovi" -OpenInCode
```

**What it does:**
- Creates folder: `lessons/[LessonId]-[TopicName]/`
- Copies `template-lesson.md` → `lesson.md`
- Copies `template-slides.md` → `slides.md`
- Optionally opens files in VS Code

---

### 2. `generate-slides.ps1` - Generate HTML Presentations
Converts all slides.md files to HTML using Marp CLI.

**Usage:**
```powershell
# Generate all lessons
.\scripts\generate-slides.ps1

# Generate specific lesson
.\scripts\generate-slides.ps1 -LessonId "I-04"

# Force regenerate (overwrite existing)
.\scripts\generate-slides.ps1 -Force
```

**What it does:**
- Finds all `lessons/*/slides.md` files
- Generates HTML: `slides/[lesson-name].html`
- Shows progress and file sizes
- Skips existing files (unless `-Force` is used)

**Requirements:**
- Marp CLI must be installed: `npm install -g @marp-team/marp-cli`

---

### 3. `validate-lessons.ps1` - Validate Lesson Structure
Checks if lessons are complete and properly structured.

**Usage:**
```powershell
# Validate all lessons
.\scripts\validate-lessons.ps1

# Validate specific lesson
.\scripts\validate-lessons.ps1 -LessonId "I-04"
```

**What it checks:**
- ✅ Folder naming convention (I-01, II-15, etc.)
- ✅ Required files exist (lesson.md, slides.md)
- ✅ HTML presentation generated
- ⚠️  Placeholder text still present ([...])
- ⚠️  File size anomalies

**Output:**
- Summary of valid/invalid lessons
- List of issues found
- Recommendations for next steps

---

## Workflow Examples

### Creating a Complete Lesson

```powershell
# Step 1: Create lesson from template
.\scripts\create-lesson.ps1 "I-04" "Imperativno-programiranje" -OpenInCode

# Step 2: Edit the files in VS Code
# - Replace all [...] placeholders
# - Add content, examples, exercises

# Step 3: Generate HTML presentation
.\scripts\generate-slides.ps1 -LessonId "I-04"

# Step 4: Validate
.\scripts\validate-lessons.ps1 -LessonId "I-04"

# Step 5: Open in browser and review
Start-Process "slides/I-04-Imperativno-programiranje.html"
```

### Batch Processing Multiple Lessons

```powershell
# Create multiple lessons at once
@("05-Topic-A", "06-Topic-B", "07-Topic-C") | ForEach-Object {
    .\scripts\create-lesson.ps1 "I-$_"
}

# After editing all lessons, generate all HTML
.\scripts\generate-slides.ps1

# Validate everything
.\scripts\validate-lessons.ps1
```

### Regenerating After Updates

```powershell
# If you updated slides.md and want to regenerate HTML
.\scripts\generate-slides.ps1 -LessonId "I-04" -Force

# Or regenerate all
.\scripts\generate-slides.ps1 -Force
```

---

## Tips & Tricks

### Quick Lesson Creation Alias
Add to your PowerShell profile (`$PROFILE`):
```powershell
function New-Lesson {
    param($id, $name)
    Set-Location "d:\Ivan\skola 2\programske paradigme"
    .\scripts\create-lesson.ps1 $id $name -OpenInCode
}

# Usage: New-Lesson "I-04" "Topic-Name"
```

### Auto-generate on Save
Use VS Code task or file watcher to auto-generate HTML when slides.md is saved.

Create `.vscode/tasks.json`:
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Generate Slides",
      "type": "shell",
      "command": "powershell",
      "args": [
        "-File",
        "scripts/generate-slides.ps1"
      ],
      "problemMatcher": []
    }
  ]
}
```

### Check Progress
```powershell
# Count lessons created
(Get-ChildItem lessons -Directory).Count

# Count HTML presentations generated
(Get-ChildItem slides -Filter "*.html").Count

# Find lessons without slides.md
Get-ChildItem lessons -Directory | Where-Object {
    -not (Test-Path (Join-Path $_.FullName "slides.md"))
} | Select-Object Name
```

---

## Troubleshooting

### Marp CLI Not Found
```powershell
# Install Marp CLI globally
npm install -g @marp-team/marp-cli

# Verify installation
marp --version
```

### Permission Errors
```powershell
# Enable script execution (run as Administrator)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Template Not Found
Make sure you're running scripts from the project root:
```powershell
cd "d:\Ivan\skola 2\programske paradigme"
.\scripts\create-lesson.ps1 ...
```

---

## Future Enhancements

Potential scripts to add:
- `export-course.ps1` - Package all lessons for distribution
- `check-images.ps1` - Validate all image references
- `generate-index.ps1` - Auto-generate index.html navigation
- `sync-github.ps1` - Commit and push lessons to repository
- `preview-lesson.ps1` - Start local server for preview

---

**Happy teaching!** 📚
