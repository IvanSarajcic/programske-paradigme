# Programske Paradigme - Project Structure & Guidelines

## Project Organization

### Folder Structure
```
programske-paradigme/
├── .git/                         # Git repository
├── .gitignore                    # Git ignore rules
├── index.html                    # Navigation page listing all lessons
├── programske paradigme.md       # Complete 99-lesson course plan
├── programske paradigme.txt      # Official curriculum document
├── summary.md                    # This file - project documentation
├── lessons/                      # Lesson folders (organized by topic)
│   ├── I-01-Pojam-programske-paradigme/
│   │   ├── lesson.md             # Detailed lesson plan (teacher)
│   │   └── slides.md             # Marp presentation source (students)
│   ├── I-02-Deklarativno-i-imperativno-programiranje/
│   │   ├── lesson.md
│   │   └── slides.md
│   ├── I-03-Proceduralna-i-objektno-orijentisana-paradigma/
│   │   ├── lesson.md
│   │   └── slides.md
│   └── ... (96 more lessons to be created)
├── slides/                       # Generated HTML presentations
│   ├── I-01-Pojam-programske-paradigme.html
│   ├── I-02-Deklarativno-i-imperativno-programiranje.html
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma.html
├── images/                       # Images used in presentations
│   └── I-01-01-paradigme.jpg
├── templates/                    # Templates for creating new lessons
│   ├── README.md                 # Instructions for using templates
│   ├── template-lesson.md        # Lesson plan template
│   └── template-slides.md        # Marp slides template
├── scripts/                      # Automation scripts
│   ├── README.md                 # Script documentation
│   ├── create-lesson.ps1         # Create new lesson from template
│   ├── generate-slides.ps1       # Generate HTML from slides.md
│   └── validate-lessons.ps1      # Validate lesson structure
└── backup/                       # Backup of old files
```

## File Types & Differences

### Lesson MD Files (e.g., `I-01-Pojam-programske-paradigme/lesson.md`)
**Folder:** `lessons/`
**Purpose:** Detailed teaching materials for the instructor

**Content Structure:**
- Complete lesson plan format
- Detailed explanations and background info
- Time allocations (5 minutes, 15 minutes, etc.)
- Teaching instructions and notes
- Homework assignments
- Materials needed (images, links, etc.)
- Assessment criteria

### Slide MD Files (e.g., `I-01-Pojam-programske-paradigme/slides.md`)
**Folder:** `lessons/*/`
**Purpose:** Marp markdown source for slides shown to students during class

**Content Structure:**
- **Marp frontmatter** with styling
- **Slide-by-slide** content (separated by `---`)
- **Concise, visual** presentation format
- **Student-facing** language
- **Interactive elements** and examples

### Slide HTML Files (e.g., `I-01-Pojam-programske-paradigme.html`)
**Folder:** `slides/`
**Purpose:** Generated HTML presentations from Slide MD files for classroom use and sharing

**Content Structure:**
- HTML representation of each slide
- Includes all styles and scripts for presentation

### Key Differences Summary

| Aspect | **Lesson Files** | **Slide Files** | **Slide HTML Files** |
|--------|-----------------|----------------------|-----------------------|
| **Audience** | Teacher/Instructor | Students | Students |
| **Format** | Detailed text | Visual slides | HTML presentation |
| **Structure** | Lesson plan | Slide deck | Slide deck |
| **Content** | Complete explanations | Key points only | Key points only |
| **Technical** | Regular markdown | Marp + styling | HTML + embedded styles |
| **Usage** | Teaching preparation | Classroom display | Classroom display | 

## Lesson Types & Structure

The course consists of 99 lessons across 4 major themes:
- **Theme I (Uvod):** 5 lessons - Introduction to programming paradigms
- **Theme II (Imperativno):** 26 lessons - Imperative and procedural programming
- **Theme III (Objektno):** 26 lessons - Object-oriented programming
- **Theme IV (Funkcionalno):** 42 lessons - Functional programming

### Lesson Type Codes
- **O** = Obrada (Processing/Teaching new material) - 45 min
- **U** = Utvrđivanje (Reinforcement/Practice) - 45 min
- **PR** = Praktične vežbe (Practical exercises) - 45 min
- **K** = Kontrolni (Assessment/Test) - 45 min

Each lesson folder must contain:
1. `lesson.md` - Detailed teaching plan with objectives, content, activities
2. `slides.md` - Marp presentation for classroom display

## Templates

The `templates/` folder contains ready-to-use templates for creating new lessons:
- **`template-lesson.md`** - Comprehensive lesson plan template with all sections
- **`template-slides.md`** - Marp presentation template with optimized styling
- **`README.md`** - Detailed instructions, naming conventions, and best practices

### Quick Start: Creating a New Lesson
```powershell
# 1. Create lesson folder
New-Item -ItemType Directory -Path "lessons/I-04-Topic-Name"

# 2. Copy templates
Copy-Item "templates/template-lesson.md" "lessons/I-04-Topic-Name/lesson.md"
Copy-Item "templates/template-slides.md" "lessons/I-04-Topic-Name/slides.md"

# 3. Edit files (replace all [...] placeholders)
code "lessons/I-04-Topic-Name/lesson.md"
code "lessons/I-04-Topic-Name/slides.md"

# 4. Generate HTML presentation
marp "lessons/I-04-Topic-Name/slides.md" --html -o "slides/I-04-Topic-Name.html"
```

See `templates/README.md` for detailed instructions and best practices.

## Automation Scripts

PowerShell scripts in `scripts/` folder automate common tasks:

### `create-lesson.ps1` - Create New Lesson
```powershell
.\scripts\create-lesson.ps1 -LessonId "I-04" -TopicName "Topic-Name" [-OpenInCode]
```
Creates folder structure and copies templates automatically.

### `generate-slides.ps1` - Generate HTML Presentations
```powershell
# Generate all lessons
.\scripts\generate-slides.ps1

# Generate specific lesson
.\scripts\generate-slides.ps1 -LessonId "I-04" [-Force]
```
Converts all slides.md to HTML using Marp CLI.

### `validate-lessons.ps1` - Validate Structure
```powershell
.\scripts\validate-lessons.ps1 [-LessonId "I-04"]
```
Checks if lessons are complete and properly structured.

See `scripts/README.md` for detailed usage and examples.

## Workflow Instructions

### 1. Content Creation/Editing
- Edit lesson content in `lessons/*/lesson.md` files (detailed lesson plans for teachers)
- Edit presentation content in `lessons/*/slides.md` files (Marp presentations for students)
- Add images to `images/` folder with naming convention: `[lesson-id]-[number]-[description].jpg`

### 2. Generate HTML Presentations
Use Marp CLI to convert presentation markdown to HTML:
```powershell
# Generate single presentation
marp "lessons/I-01-Pojam-programske-paradigme/slides.md" --html -o "slides/I-01-Pojam-programske-paradigme.html"

# Generate all presentations at once (from project root)
Get-ChildItem -Path "lessons" -Filter "slides.md" -Recurse | ForEach-Object {
    $lessonName = $_.Directory.Name
    marp $_.FullName --html -o "slides/$lessonName.html"
}

# Or using bash-style (in PowerShell with proper escaping)
marp "lessons/*/slides.md" --html
```

### 3. Naming Conventions
- **Lesson folders:** `[Theme]-[Number]-[Topic-Name]/`
  - Example: `I-01-Pojam-programske-paradigme/`
  - Theme codes: I (Uvod), II (Imperativno), III (Objektno), IV (Funkcionalno)
- **Lesson files:** Always `lesson.md` (inside lesson folder)
- **Slide files:** Always `slides.md` (inside lesson folder)
- **Generated HTML:** `[Theme]-[Number]-[Topic-Name].html` (in slides/ folder)
- **Images:** `[Theme]-[Number]-[SubNumber]-[description].jpg`

### 4. Update Navigation
- Update `index.html` to reflect any new lessons
- Ensure all links point to correct paths in `slides/` folder
- Group lessons by theme (I, II, III, IV)

## CSS Optimization Notes

### Problem with Marp
Marp duplicates CSS styles in each section when using frontmatter `style:` property, causing:
- Large file sizes
- Duplicate CSS code (20+ repetitions)
- Poor maintainability

### Solution
- Move common styles to global `<style>` section in generated HTML
- Remove duplicate `data-style` attributes from sections
- Keep only essential CSS variables in inline styles

### Best Practices
- Keep frontmatter CSS minimal and global
- Use consistent color schemes across all presentations
- Optimize images for web (compress if needed)
- Test presentations in browser before deployment