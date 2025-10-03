<#
.SYNOPSIS
    Creates a new lesson folder with templates for Programske Paradigme course.

.DESCRIPTION
    This script automates the creation of new lesson folders by:
    1. Creating a new folder in lessons/ directory
    2. Copying template files (lesson.md and slides.md)
    3. Optionally opening the files in VS Code

.PARAMETER LessonId
    The lesson ID (e.g., "I-04", "II-15", "III-08", "IV-20")

.PARAMETER TopicName
    The topic name using hyphens (e.g., "Imperativno-programiranje")

.PARAMETER OpenInCode
    If specified, opens the created files in VS Code

.EXAMPLE
    .\create-lesson.ps1 -LessonId "I-04" -TopicName "Imperativno-programiranje"
    Creates a new lesson folder: lessons/I-04-Imperativno-programiranje/

.EXAMPLE
    .\create-lesson.ps1 "II-05" "Promenljive-i-tipovi" -OpenInCode
    Creates a new lesson and opens files in VS Code
#>

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$LessonId,
    
    [Parameter(Mandatory=$true, Position=1)]
    [string]$TopicName,
    
    [Parameter(Mandatory=$false)]
    [switch]$OpenInCode
)

# Validate lesson ID format
if ($LessonId -notmatch '^(I|II|III|IV)-\d{2}$') {
    Write-Error "Invalid lesson ID format. Expected format: I-01, II-15, III-08, or IV-20"
    exit 1
}

# Create folder name
$folderName = "$LessonId-$TopicName"
$lessonPath = Join-Path "lessons" $folderName

# Check if folder already exists
if (Test-Path $lessonPath) {
    Write-Error "Lesson folder already exists: $lessonPath"
    exit 1
}

# Check if templates exist
$templateLesson = "templates\template-lesson.md"
$templateSlides = "templates\template-slides.md"

if (-not (Test-Path $templateLesson)) {
    Write-Error "Template not found: $templateLesson"
    exit 1
}

if (-not (Test-Path $templateSlides)) {
    Write-Error "Template not found: $templateSlides"
    exit 1
}

# Create lesson folder
Write-Host "Creating lesson folder: $lessonPath" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $lessonPath -Force | Out-Null

# Copy templates
Write-Host "Copying templates..." -ForegroundColor Cyan
Copy-Item $templateLesson (Join-Path $lessonPath "lesson.md")
Copy-Item $templateSlides (Join-Path $lessonPath "slides.md")

Write-Host "✅ Lesson created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Edit lesson.md - Replace all [...] placeholders with actual content"
Write-Host "2. Edit slides.md - Create presentation slides"
Write-Host "3. Generate HTML: marp `"$lessonPath\slides.md`" --html -o `"slides\$folderName.html`""
Write-Host ""

# Open in VS Code if requested
if ($OpenInCode) {
    Write-Host "Opening files in VS Code..." -ForegroundColor Cyan
    code (Join-Path $lessonPath "lesson.md")
    code (Join-Path $lessonPath "slides.md")
}

Write-Host "Lesson folder: $lessonPath" -ForegroundColor Green
