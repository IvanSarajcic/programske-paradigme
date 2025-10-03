<#
.SYNOPSIS
    Generates HTML presentations from all slides.md files in lessons/ folder.

.DESCRIPTION
    This script finds all slides.md files in the lessons/ directory and generates
    HTML presentations using Marp CLI, saving them to the slides/ folder.

.PARAMETER LessonId
    Optional. If specified, generates HTML only for the specified lesson.
    Example: "I-04", "II-15"

.PARAMETER Force
    If specified, regenerates HTML even if it already exists

.EXAMPLE
    .\generate-slides.ps1
    Generates HTML for all lessons that have slides.md

.EXAMPLE
    .\generate-slides.ps1 -LessonId "I-04"
    Generates HTML only for lesson I-04

.EXAMPLE
    .\generate-slides.ps1 -Force
    Regenerates HTML for all lessons, overwriting existing files
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$LessonId,
    
    [Parameter(Mandatory=$false)]
    [switch]$Force
)

# Check if Marp CLI is installed
try {
    $marpVersion = marp --version 2>&1
    Write-Host "Using Marp CLI: $marpVersion" -ForegroundColor Cyan
} catch {
    Write-Error "Marp CLI is not installed. Install it with: npm install -g @marp-team/marp-cli"
    exit 1
}

# Create slides folder if it doesn't exist
if (-not (Test-Path "slides")) {
    Write-Host "Creating slides folder..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Path "slides" -Force | Out-Null
}

# Find all slides.md files
$slidesFiles = Get-ChildItem -Path "lessons" -Filter "slides.md" -Recurse

if ($slidesFiles.Count -eq 0) {
    Write-Warning "No slides.md files found in lessons/ folder"
    exit 0
}

# Filter by lesson ID if specified
if ($LessonId) {
    $slidesFiles = $slidesFiles | Where-Object { $_.Directory.Name -like "$LessonId-*" }
    if ($slidesFiles.Count -eq 0) {
        Write-Warning "No slides.md found for lesson ID: $LessonId"
        exit 0
    }
}

Write-Host "Found $($slidesFiles.Count) slide file(s) to process" -ForegroundColor Green
Write-Host ""

$successCount = 0
$skipCount = 0
$errorCount = 0

foreach ($slideFile in $slidesFiles) {
    $lessonName = $slideFile.Directory.Name
    $outputPath = Join-Path "slides" "$lessonName.html"
    
    # Check if output already exists
    if ((Test-Path $outputPath) -and -not $Force) {
        Write-Host "⏭️  Skipping $lessonName (already exists, use -Force to regenerate)" -ForegroundColor Yellow
        $skipCount++
        continue
    }
    
    Write-Host "🔄 Generating: $lessonName" -ForegroundColor Cyan
    
    try {
        # Generate HTML using Marp
        $result = marp $slideFile.FullName --html -o $outputPath 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            $fileSize = (Get-Item $outputPath).Length
            $fileSizeKB = [math]::Round($fileSize / 1KB, 1)
            Write-Host "   ✅ Success: $outputPath ($fileSizeKB KB)" -ForegroundColor Green
            $successCount++
        } else {
            Write-Host "   ❌ Error: $result" -ForegroundColor Red
            $errorCount++
        }
    } catch {
        Write-Host "   ❌ Error: $($_.Exception.Message)" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  ✅ Success: $successCount" -ForegroundColor Green
Write-Host "  ⏭️  Skipped: $skipCount" -ForegroundColor Yellow
Write-Host "  ❌ Errors:  $errorCount" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Cyan

if ($successCount -gt 0) {
    Write-Host ""
    Write-Host "HTML presentations saved to: slides/" -ForegroundColor Green
}
