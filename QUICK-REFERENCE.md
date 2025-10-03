# 📋 Quick Reference Card - Programske Paradigme

## 🚀 Most Common Commands

### Create New Lesson
```powershell
.\scripts\create-lesson.ps1 "I-04" "Topic-Name" -OpenInCode
```

### Generate HTML (Single Lesson)
```powershell
.\scripts\generate-slides.ps1 -LessonId "I-04"
```

### Generate HTML (All Lessons)
```powershell
.\scripts\generate-slides.ps1
```

### Validate Lesson
```powershell
.\scripts\validate-lessons.ps1 -LessonId "I-04"
```

### Validate All Lessons
```powershell
.\scripts\validate-lessons.ps1
```

---

## 📁 Folder Structure Quick Guide

```
lessons/[ID-Topic]/
  ├── lesson.md    ← Detailed teaching plan
  └── slides.md    ← Marp presentation source

slides/
  └── [ID-Topic].html  ← Generated HTML presentation

templates/
  ├── template-lesson.md   ← Copy this for new lessons
  └── template-slides.md   ← Copy this for new slides

scripts/
  ├── create-lesson.ps1    ← Automate lesson creation
  ├── generate-slides.ps1  ← Generate HTML
  └── validate-lessons.ps1 ← Check structure
```

---

## 🏷️ Naming Conventions

### Lesson ID Format
```
[Theme]-[Number]-[Topic-Name-With-Hyphens]
```

### Theme Codes
- **I** = Uvod (5 lessons)
- **II** = Imperativno (26 lessons)
- **III** = Objektno (26 lessons)
- **IV** = Funkcionalno (42 lessons)

### Examples
```
I-01-Pojam-programske-paradigme
II-05-Promenljive-i-tipovi-podataka
III-12-Nasledjivanje-i-polimorfizam
IV-20-Lambda-izrazi
```

---

## ✏️ Lesson Type Codes

| Code | Serbian | English | Duration |
|------|---------|---------|----------|
| **O** | Obrada | New material | 45 min |
| **U** | Utvrđivanje | Reinforcement | 45 min |
| **PR** | Praktične vežbe | Practice | 45 min |
| **K** | Kontrolni | Assessment | 45 min |

---

## 📝 Template Placeholders to Replace

### In lesson.md
- `[NUMBER]` → Lesson number (e.g., 4)
- `[NAZIV LEKCIJE]` → Lesson title
- `[Obrada novog gradiva / Utvrđivanje / ...]` → Choose lesson type
- `[Исход 1]`, `[Исход 2]`, etc. → Specific learning outcomes
- `[ТЕМА 1]`, `[ТЕМА 2]`, etc. → Topic sections
- `[programming-language]` → cpp, java, python, etc.
- All other `[...]` → Replace with actual content

### In slides.md
- `[НАСЛОВ ЛЕКЦИЈЕ]` → Presentation title
- `[Концепт 1]`, `[Концепт 2]` → Main concepts
- `[programming-language]` → cpp, java, python, etc.
- All other `[...]` → Replace with actual content
- Add/remove slides as needed (slides separated by `---`)

---

## 🔄 Complete Workflow

```
1. CREATE
   .\scripts\create-lesson.ps1 "I-04" "Topic" -OpenInCode

2. EDIT
   - Fill lesson.md (detailed plan)
   - Fill slides.md (presentation)
   - Replace all [...] placeholders

3. GENERATE
   .\scripts\generate-slides.ps1 -LessonId "I-04"

4. VALIDATE
   .\scripts\validate-lessons.ps1 -LessonId "I-04"

5. PREVIEW
   Start-Process "slides\I-04-Topic.html"

6. COMMIT
   git add lessons/I-04-Topic/
   git add slides/I-04-Topic.html
   git commit -m "Add lesson I-04: Topic"
   git push
```

---

## 🎨 Slide Styling (Pre-configured)

### Colors
- Background: `#1a1a1a` (dark gray)
- Text: `#ffffff` (white)
- Headings: `#4fc3f7` (cyan)
- Code blocks: `#2d2d2d` background

### Best Practices
- Max 10-15 lines of code per slide
- Use bullet points (not paragraphs)
- One concept per slide
- Include visual aids (tables, lists)
- Use emoji for visual interest 🎯✅❌👍📝

---

## 🔍 Useful Check Commands

### Count Progress
```powershell
# Lessons created
(Get-ChildItem lessons -Directory).Count

# HTML generated
(Get-ChildItem slides -Filter "*.html").Count

# Percentage complete
$total = 99
$done = (Get-ChildItem lessons -Directory).Count
[math]::Round(($done / $total) * 100, 1)
```

### Find Issues
```powershell
# Lessons missing slides.md
Get-ChildItem lessons -Directory | Where-Object {
    -not (Test-Path (Join-Path $_.FullName "slides.md"))
}

# Lessons with placeholders
Get-ChildItem lessons -Recurse -Filter "*.md" | 
    Select-String "\[NAZIV|\[NUMBER|\[ТЕМА" -List

# Images not used
Get-ChildItem images | Where-Object {
    $img = $_.Name
    -not (Get-ChildItem lessons -Recurse -Filter "*.md" | 
          Select-String $img -Quiet)
}
```

---

## 📚 Documentation Files

| File | Purpose |
|------|---------|
| **README.md** | Project overview, getting started |
| **summary.md** | Detailed structure, workflows, file types |
| **templates/README.md** | How to use templates |
| **scripts/README.md** | Script documentation |
| **PROJECT-UPDATES.md** | Recent changes summary |
| **QUICK-REFERENCE.md** | This file - quick commands |
| **programske paradigme.md** | All 99 lesson plans |

---

## 🆘 Troubleshooting

### Marp CLI not found
```powershell
npm install -g @marp-team/marp-cli
marp --version
```

### Script execution disabled
```powershell
# Run as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Template not found
```powershell
# Make sure you're in project root
cd "d:\Ivan\skola 2\programske paradigme"
.\scripts\create-lesson.ps1 ...
```

### HTML not generating
```powershell
# Check Marp CLI
marp --version

# Try manual generation
marp "lessons/I-04-Topic/slides.md" --html -o "slides/I-04-Topic.html"

# Check for syntax errors in slides.md
```

---

## 💡 Pro Tips

1. **Use -OpenInCode** - Auto-opens files in VS Code
2. **Validate frequently** - Catch errors early
3. **Generate often** - See your changes in browser
4. **Commit per lesson** - Easy to track and rollback
5. **Reference existing lessons** - I-01, I-02, I-03 as examples
6. **Check programske paradigme.md** - For lesson content ideas

---

## 📞 Quick Help

### Need help with:
- **Templates**: See `templates/README.md`
- **Scripts**: See `scripts/README.md`
- **Structure**: See `summary.md`
- **Overview**: See `README.md`
- **Commands**: This file!

---

**Keep this file handy while creating lessons!** 📌
