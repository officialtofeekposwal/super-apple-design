<#
.SYNOPSIS
    Native PowerShell installer for Super Apple Design
.DESCRIPTION
    Installs Apple HIG and 4-Phase Design Workflow skills into Antigravity, Claude Code, and Cursor.
.PARAMETER Target
    Installation target: 'antigravity', 'claude', 'cursor', or 'all' (default: 'all')
.PARAMETER Scope
    Installation scope: 'global' (default) or 'project'
.PARAMETER WithUpstream
    Clone upstream viral skills from GitHub
.PARAMETER DryRun
    Simulate installation without writing files
.EXAMPLE
    .\scripts\install.ps1 -Target antigravity -Scope project
#>
[CmdletBinding()]
param (
    [ValidateSet('antigravity', 'claude', 'cursor', 'all')]
    [string]$Target = 'all',

    [ValidateSet('global', 'project')]
    [string]$Scope = 'global',

    [switch]$WithUpstream,
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$ScriptDir = Split-Path -Parent $PSScriptRoot

function Write-Log {
    param([string]$Message)
    Write-Host "[super-apple-design] $Message" -ForegroundColor Cyan
}

function Ensure-Dir {
    param([string]$Path)
    if ($DryRun) {
        Write-Log "[dry-run] mkdir '$Path'"
    } else {
        if (-not (Test-Path $Path)) {
            New-Item -ItemType Directory -Path $Path -Force | Out-Null
        }
    }
}

function Copy-SkillFile {
    param([string]$Source, [string]$Destination)
    if ($DryRun) {
        Write-Log "[dry-run] copy '$Source' -> '$Destination'"
    } else {
        Copy-Item -Path $Source -Destination $Destination -Force
    }
}

Write-Log "Starting installation (Target: $Target, Scope: $Scope, DryRun: $DryRun)..."

# 1. Antigravity Installation
if ($Target -in @('antigravity', 'all')) {
    $agDest = if ($Scope -eq 'global') {
        Join-Path $env:USERPROFILE ".gemini\antigravity\skills"
    } else {
        Join-Path (Get-Location) ".agent\skills"
    }

    Write-Log "Installing for Antigravity at: $agDest"
    Ensure-Dir (Join-Path $agDest "apple-design-universal")
    Ensure-Dir (Join-Path $agDest "design-workflow")
    Ensure-Dir (Join-Path $agDest "liquid-glass-physics")
    Ensure-Dir (Join-Path $agDest "apple-hig-components")

    Copy-SkillFile (Join-Path $ScriptDir "skills\apple-design-universal\SKILL.md") (Join-Path $agDest "apple-design-universal\SKILL.md")
    Copy-SkillFile (Join-Path $ScriptDir "skills\design-workflow\SKILL.md") (Join-Path $agDest "design-workflow\SKILL.md")
    Copy-SkillFile (Join-Path $ScriptDir "skills\liquid-glass-physics\SKILL.md") (Join-Path $agDest "liquid-glass-physics\SKILL.md")
    Copy-SkillFile (Join-Path $ScriptDir "skills\apple-hig-components\SKILL.md") (Join-Path $agDest "apple-hig-components\SKILL.md")
    Write-Log "✓ Antigravity skills installed successfully."
}

# 2. Claude Code Installation
if ($Target -in @('claude', 'all')) {
    $claudeDest = if ($Scope -eq 'global') {
        Join-Path $env:USERPROFILE ".claude\skills"
    } else {
        Join-Path (Get-Location) ".claude\skills"
    }

    Write-Log "Installing for Claude Code at: $claudeDest"
    Ensure-Dir (Join-Path $claudeDest "apple-design-universal")
    Ensure-Dir (Join-Path $claudeDest "design-workflow")

    Copy-SkillFile (Join-Path $ScriptDir "skills\apple-design-universal\SKILL.md") (Join-Path $claudeDest "apple-design-universal\SKILL.md")
    Copy-SkillFile (Join-Path $ScriptDir "skills\design-workflow\SKILL.md") (Join-Path $claudeDest "design-workflow\SKILL.md")
    Write-Log "✓ Claude Code skills installed successfully."
}

# 3. Cursor Rules Installation
if ($Target -in @('cursor', 'all')) {
    $cursorDest = Join-Path (Get-Location) ".cursor\rules"
    Write-Log "Installing for Cursor at: $cursorDest"
    Ensure-Dir $cursorDest

    Copy-SkillFile (Join-Path $ScriptDir "cursor\rules\apple-design.mdc") (Join-Path $cursorDest "apple-design.mdc")
    if (Test-Path (Join-Path $ScriptDir ".cursor\rules\design-workflow.mdc")) {
        Copy-SkillFile (Join-Path $ScriptDir ".cursor\rules\design-workflow.mdc") (Join-Path $cursorDest "design-workflow.mdc")
    }
    Write-Log "✓ Cursor rules installed successfully."
}

# 4. Optional Upstream Skills
if ($WithUpstream) {
    Write-Log "Upstream sync requested. Check skills.json for manual or tool-assisted cloning."
}

Write-Log "All done! Restart your coding assistant or run '/' to view the skills."
