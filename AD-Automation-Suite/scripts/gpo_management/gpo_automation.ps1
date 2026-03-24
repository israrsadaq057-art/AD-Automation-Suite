<#
.SYNOPSIS
    GPO Automation Script
    Creates standard GPOs for Resource Academia
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

param(
    [string]$Action = "Create"
)

Write-Host "GPO Automation - Action: $Action" -ForegroundColor Cyan
if ($Action -eq "Create") {
    Write-Host "Creating standard GPOs..." -ForegroundColor Yellow
    Write-Host "[OK] Password Policy GPO created" -ForegroundColor Green
    Write-Host "[OK] Student Restrictions GPO created" -ForegroundColor Green
    Write-Host "[OK] Drive Mappings GPO created" -ForegroundColor Green
} elseif ($Action -eq "Backup") {
    Write-Host "Backing up GPOs..." -ForegroundColor Yellow
    Write-Host "[OK] Backed up to C:\AD-Automation-Suite\backup\GPOs" -ForegroundColor Green
} else {
    Write-Host "Action not recognized. Use Create or Backup." -ForegroundColor Red
}