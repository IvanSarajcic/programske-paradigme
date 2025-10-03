# Programske Paradigme - Project Structure & Guidelines

## Project Organization

### Folder Structure
```
├── index.html                    # Navigation page listing all topics
├── lessons/                       # Source markdown files
│   ├── I-01-Pojam-programske-paradigme.md                    # Lesson content
│   ├── I-02-Deklarativno-i-imperativno-programiranje.md      # Lesson content
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma.md # Lesson content
├── slides/
│   ├── I-01-Pojam-programske-paradigme.md                    # Presentation content
│   ├── I-02-Deklarativno-i-imperativno-programiranje.md      # Presentation content
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma.md # Presentation content
├── slides-html/                       # Generated HTML presentations
│   ├── I-01-Pojam-programske-paradigme.html
│   ├── I-02-Deklarativno-i-imperativno-programiranje.html
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma.html
└── images/                       # Images for presentations
    └── I-01-01-paradigme.jpg
```

## File Types & Differences

### Lesson MD Files (e.g., `I-01-Pojam-programske-paradigme.md`)
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

### Slide MD Files (e.g., `I-01-Pojam-programske-paradigme-slides.md`)
**Folder:** `slides/`
**Purpose:** Actual slides shown to students during class generated from lesson files

**Content Structure:**
- **Marp frontmatter** with styling
- **Slide-by-slide** content (separated by `---`)
- **Concise, visual** presentation format
- **Student-facing** language
- **Interactive elements** and examples

### Slide HTML Files (e.g., `I-01-Pojam-programske-paradigme-slides.html`)
**Folder:** `slides-html/`
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

## Workflow Instructions

### 1. Content Creation/Editing
- Edit lesson content in `lessons/*.md` files (lesson plans)
- Edit presentation content in `slides/*-slides.md` files (Marp presentations)
- Add images to `images/` folder

### 2. Generate HTML Presentations
Use Marp CLI to convert presentation markdown to HTML:
```bash
# Individual files
marp "slides/I-01-Pojam-programske-paradigme-slides.md" --html --output "slides-html/I-01-Pojam-programske-paradigme-slides.html"

# All at once
marp "slides/*-slides.md" --html --output-dir "slides-html/"
```

### 3. Update Navigation
- Update `index.html` to reflect any new files or changes in structure
- Ensure all links point to correct paths in `slides/` folder

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