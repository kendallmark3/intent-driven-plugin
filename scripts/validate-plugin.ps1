# Validates the required file structure and JSON manifests for intent-driven-plugin.
# Usage: ./scripts/validate-plugin.ps1 (run from anywhere; resolves paths relative to this script)

$RootDir = Split-Path -Parent $PSScriptRoot
Set-Location $RootDir

$Fail = $false

function Check-File {
    param([string]$Path)
    if (-not (Test-Path $Path -PathType Leaf)) {
        Write-Host "MISSING: $Path"
        $script:Fail = $true
    } else {
        Write-Host "OK: $Path"
    }
}

function Check-Json {
    param([string]$Path)
    if (-not (Test-Path $Path -PathType Leaf)) {
        return
    }
    try {
        Get-Content $Path -Raw | ConvertFrom-Json | Out-Null
        Write-Host "VALID JSON: $Path"
    } catch {
        Write-Host "INVALID JSON: $Path"
        $script:Fail = $true
    }
}

Write-Host "Checking required files..."
Check-File ".claude-plugin/plugin.json"
Check-File ".claude-plugin/marketplace.json"
Check-File "commands/intent-check.md"
Check-File "skills/repository-intent-analysis/SKILL.md"
Check-File "README.md"
Check-File "LICENSE"
Check-File "CHANGELOG.md"
Check-File "CONTRIBUTING.md"

Write-Host ""
Write-Host "Checking JSON manifests..."
Check-Json ".claude-plugin/plugin.json"
Check-Json ".claude-plugin/marketplace.json"

Write-Host ""
if (Get-Command claude -ErrorAction SilentlyContinue) {
    Write-Host "Running 'claude plugin validate .' ..."
    claude plugin validate .
    if ($LASTEXITCODE -ne 0) { $Fail = $true }
} else {
    Write-Host "Claude Code CLI not found on PATH; skipping 'claude plugin validate .'"
}

Write-Host ""
if ($Fail) {
    Write-Host "Validation FAILED."
    exit 1
}
Write-Host "Validation passed."
