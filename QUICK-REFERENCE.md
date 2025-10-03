# 📋 Quick Reference Card - Programske Paradigme

## 🤖 AI-Assisted Workflow

**Use Claude Sonnet 4.5 to generate lessons!**

### Ask Claude to create a lesson:
- Give it the lesson number and topic from `programske paradigme.md`
- Point to existing examples: I-01, I-02, I-03
- Claude will create the folder and both files

## 🚀 Manual Commands (when needed)

### Generate HTML (Single Lesson)
```powershell
marp "lessons/I-04-Topic-Name/slides.md" --html -o "slides/I-04-Topic-Name.html"
```

### Generate HTML (All Lessons)
```powershell
Get-ChildItem -Path "lessons" -Filter "slides.md" -Recurse | ForEach-Object {
    $lessonName = $_.Directory.Name
    marp $_.FullName --html -o "slides/$lessonName.html"
}
```

### Create Folder Manually
```powershell
New-Item -ItemType Directory -Path "lessons/I-04-Topic-Name"
```

---

## 📁 Folder Structure Quick Guide

```
lessons/[ID-Topic]/
  ├── lesson.md    ← Detailed teaching plan
  └── slides.md    ← Marp presentation source

slides/
  └── [ID-Topic].html  ← Generated HTML presentation
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

## 🔄 Complete Workflow (AI-Assisted)

```
1. ASK CLAUDE
   "Create lesson I-04 about [Topic] following existing lesson structure"
   Provide: programske paradigme.md, existing examples (I-01, I-02, I-03)

2. CLAUDE CREATES
   - Creates lessons/I-04-Topic/ folder
   - Generates lesson.md (teaching plan)
   - Generates slides.md (presentation)

3. GENERATE HTML
   marp "lessons/I-04-Topic/slides.md" --html -o "slides/I-04-Topic.html"

4. PREVIEW
   Start-Process "slides/I-04-Topic.html"

5. COMMIT
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
- **Structure**: See `summary.md`
- **Overview**: See `README.md`
- **Commands**: This file!
- **AI Generation**: Just ask Claude!

---

**Keep this file handy while creating lessons!** 📌
