# Cross-platform vim.pack plugin manager (PowerShell)
# Usage: .\pack-update.ps1 -Action [install|update|clean|list]

param(
    [ValidateSet("install", "update", "clean", "list")]
    [string]$Action = "install"
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PackDir = Join-Path $ScriptDir ".config\nvim\pack\theovim"
$StartDir = Join-Path $PackDir "start"
$OptDir = Join-Path $PackDir "opt"

function Show-Usage {
    Write-Host @"
vim.pack Plugin Manager (PowerShell)
Usage: .\pack-update.ps1 -Action [install|update|clean|list]

Commands:
  install   - Initialize all plugins (clone submodules)
  update    - Update all plugins to latest versions
  clean     - Remove all plugins (not the config)
  list      - List installed plugins
"@
}

function Install-Plugins {
    Write-Host "Installing vim.pack plugins..."
    
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Error: git is required" -ForegroundColor Red
        exit 1
    }
    
    Push-Location (Split-Path $PackDir)
    try {
        & git submodule update --init --recursive
        Write-Host "✓ Plugins installed" -ForegroundColor Green
    }
    finally {
        Pop-Location
    }
}

function Update-Plugins {
    Write-Host "Updating vim.pack plugins..."
    
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Error: git is required" -ForegroundColor Red
        exit 1
    }
    
    Push-Location (Split-Path $PackDir)
    try {
        & git submodule update --remote
        Write-Host "✓ Plugins updated" -ForegroundColor Green
    }
    finally {
        Pop-Location
    }
}

function Remove-Plugins {
    Write-Host "WARNING: This will remove all plugin directories" -ForegroundColor Yellow
    $response = Read-Host "Continue? (y/N)"
    
    if ($response -eq "y" -or $response -eq "Y") {
        Get-ChildItem $StartDir -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force
        Get-ChildItem $OptDir -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force
        Write-Host "✓ Plugins removed" -ForegroundColor Green
    }
    else {
        Write-Host "Cancelled"
    }
}

function List-Plugins {
    Write-Host "START plugins (loaded on startup):" -ForegroundColor Cyan
    Get-ChildItem $StartDir -ErrorAction SilentlyContinue | ForEach-Object { Write-Host "  - $($_.Name)" }
    
    Write-Host ""
    Write-Host "OPT plugins (lazy-loaded):" -ForegroundColor Cyan
    Get-ChildItem $OptDir -ErrorAction SilentlyContinue | ForEach-Object { Write-Host "  - $($_.Name)" }
}

switch ($Action) {
    "install" { Install-Plugins }
    "update" { Update-Plugins }
    "clean" { Remove-Plugins }
    "list" { List-Plugins }
    default { Show-Usage }
}
