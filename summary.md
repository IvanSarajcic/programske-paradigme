# Programske Paradigme - Project Structure & Guidelines

## Project Organization

### Folder Structure
```
├── index.html                    # Navigation page listing all topics
├── source/                       # Source markdown files
│   ├── I-01-Pojam-programske-paradigme.md                    # Lesson content
│   ├── I-01-Pojam-programske-paradigme-slides.md             # Presentation slides
│   ├── I-02-Deklarativno-i-imperativno-programiranje.md      # Lesson content
│   ├── I-02-Deklarativno-i-imperativno-programiranje-slides.md # Presentation slides
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma.md # Lesson content
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma-slides.md # Presentation slides
├── slides/                       # Generated HTML presentations
│   ├── I-01-Pojam-programske-paradigme.html
│   ├── I-02-Deklarativno-i-imperativno-programiranje.html
│   └── I-03-Proceduralna-i-objektno-orijentisana-paradigma.html
└── images/                       # Images for presentations
    └── Paradigms2-1024x551.jpg
```

## File Types & Differences

### Lesson MD Files (e.g., `I-01-Pojam-programske-paradigme.md`)
**Purpose:** Detailed teaching materials for the instructor

**Content Structure:**
- Complete lesson plan format
- Detailed explanations and background info
- Time allocations (5 minutes, 15 minutes, etc.)
- Teaching instructions and notes
- Homework assignments
- Materials needed
- Assessment criteria

**Example:**
```markdown
# Час 1: Појам програмске парадигме и класификација програмских језика
**Тип часа:** Обрада новог градива  
**Трајање:** 45 минута

## Циљ часа
Ученици ће се упознати са основним појмом програмске парадигме...

### 1. УВОД (5 минута)
**Мотивациона питања:**
- Које програмске језике знате до сада?

## Домаћи задатак
Истражити по један програмски језик...

## Напомене за наставника
- Користити конкретне примере које ученици знају
```

### Presentation MD Files (e.g., `I-01-Pojam-programske-paradigme-slides.md`)
**Purpose:** Actual slides shown to students during class

**Content Structure:**
- **Marp frontmatter** with styling
- **Slide-by-slide** content (separated by `---`)
- **Concise, visual** presentation format
- **Student-facing** language
- **Interactive elements** and examples

**Example:**
```markdown
---
marp: true
theme: default
class: invert
style: |
  section {
    background: #1a1a1a;
    color: #ffffff;
  }
paginate: true
---

# Програмске парадигме

**Час 1: Појам и класификација**
*4. разред гимназије*

---

## 🤔 Питања за размишљање

- Које програмске језике знате?
- Зашто постоји толико језика?

---

## 💡 Шта је парадигма?

**Програмска парадигма** = стил програмирања

![width:600px](images/paradigms.jpg)
```

### Key Differences Summary

| Aspect | **Lesson Files** | **Presentation Files** |
|--------|-----------------|----------------------|
| **Audience** | Teacher/Instructor | Students |
| **Format** | Detailed text | Visual slides |
| **Structure** | Lesson plan | Slide deck |
| **Content** | Complete explanations | Key points only |
| **Technical** | Regular markdown | Marp + styling |
| **Usage** | Teaching preparation | Classroom display |

## Workflow Instructions

### 1. Content Creation/Editing
- Edit lesson content in `source/*.md` files (lesson plans)
- Edit presentation content in `source/*-slides.md` files (Marp presentations)
- Add images to `images/` folder

### 2. Generate HTML Presentations
Use Marp CLI to convert presentation markdown to HTML:
```bash
# Individual files
marp "source/I-01-Pojam-programske-paradigme-slides.md" --html --output "slides/I-01-Pojam-programske-paradigme.html"

# All at once
marp "source/*-slides.md" --html --output-dir "slides/"
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