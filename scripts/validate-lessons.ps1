<#
.SYNOPSIS
    Validates lesson structure and completeness.

.DESCRIPTION
    This script checks:
    - If lesson folders follow naming conventions
    - If required files (lesson.md, slides.md) exist
    - If HTML presentations are generated
    - If placeholder text [...] is still present

.PARAMETER LessonId
    Optional. If specified, validates only the specified lesson.

.EXAMPLE
    .\validate-lessons.ps1
    Validates all lessons

.EXAMPLE
    .\validate-lessons.ps1 -LessonId "I-04"
    Validates only lesson I-04
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$LessonId
)

Write-Host "🔍 Validating lesson structure..." -ForegroundColor Cyan
Write-Host ""

# Get all lesson folders
$lessonFolders = Get-ChildItem -Path "lessons" -Directory

if ($LessonId) {
    $lessonFolders = $lessonFolders | Where-Object { $_.Name -like "$LessonId-*" }
}

if ($lessonFolders.Count -eq 0) {
    Write-Warning "No lesson folders found"
    exit 0
}

$totalLessons = $lessonFolders.Count
$validLessons = 0
$issues = @()

foreach ($folder in $lessonFolders) {
    $lessonName = $folder.Name
    $hasIssues = $false
    
    Write-Host "Checking: $lessonName" -ForegroundColor White
    
    # Check naming convention
    if ($lessonName -notmatch '^(I|II|III|IV)-\d{2}-.+$') {
        Write-Host "  ❌ Invalid folder name format" -ForegroundColor Red
        $issues += "$lessonName : Invalid folder name format"
        $hasIssues = $true
    }
    
    # Check lesson.md exists
    $lessonMdPath = Join-Path $folder.FullName "lesson.md"
    if (-not (Test-Path $lessonMdPath)) {
        Write-Host "  ❌ Missing: lesson.md" -ForegroundColor Red
        $issues += "$lessonName : Missing lesson.md"
        $hasIssues = $true
    } else {
        # Check for placeholder text
        $content = Get-Content $lessonMdPath -Raw
        if ($content -match '\[.*?\]' -and $content -match '\[NUMBER\]|\[NAZIV|\[ТЕМА|\[Исход') {
            Write-Host "  ⚠️  Warning: lesson.md contains placeholder text [...]" -ForegroundColor Yellow
            $issues += "$lessonName : lesson.md has placeholder text"
        }
    }
    
    # Check slides.md exists
    $slidesMdPath = Join-Path $folder.FullName "slides.md"
    if (-not (Test-Path $slidesMdPath)) {
        Write-Host "  ❌ Missing: slides.md" -ForegroundColor Red
        $issues += "$lessonName : Missing slides.md"
        $hasIssues = $true
    } else {
        # Check for placeholder text
        $content = Get-Content $slidesMdPath -Raw
        if ($content -match '\[НАСЛОВ ЛЕКЦИЈЕ\]|\[Концепт|\[programming-language\]') {
            Write-Host "  ⚠️  Warning: slides.md contains placeholder text [...]" -ForegroundColor Yellow
            $issues += "$lessonName : slides.md has placeholder text"
        }
    }
    
    # Check if HTML was generated
    $htmlPath = Join-Path "slides" "$lessonName.html"
    if (-not (Test-Path $htmlPath)) {
        Write-Host "  ⚠️  Warning: HTML not generated" -ForegroundColor Yellow
        $issues += "$lessonName : HTML presentation not generated"
    } else {
        $fileSize = (Get-Item $htmlPath).Length
        if ($fileSize -lt 1KB) {
            Write-Host "  ⚠️  Warning: HTML file is very small ($fileSize bytes)" -ForegroundColor Yellow
        }
    }
    
    if (-not $hasIssues) {
        Write-Host "  ✅ Valid" -ForegroundColor Green
        $validLessons++
    }
    
    Write-Host ""
}

# Summary
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Validation Summary:" -ForegroundColor Cyan
Write-Host "  Total lessons: $totalLessons" -ForegroundColor White
Write-Host "  Valid lessons: $validLessons" -ForegroundColor Green
Write-Host "  Issues found:  $($issues.Count)" -ForegroundColor $(if ($issues.Count -eq 0) { "Green" } else { "Yellow" })
Write-Host "========================================" -ForegroundColor Cyan

if ($issues.Count -gt 0) {
    Write-Host ""
    Write-Host "Issues:" -ForegroundColor Yellow
    foreach ($issue in $issues) {
        Write-Host "  • $issue" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Fix any issues listed above"
Write-Host "  2. Run: .\scripts\generate-slides.ps1 to create missing HTML files"
Write-Host "  3. Review generated presentations in browser"
