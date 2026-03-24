<#
.SYNOPSIS
    Run Complete Onboarding for 100 Users
    Uses the full CSV file generated
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

Clear-Host

Write-Host "="*80 -ForegroundColor Cyan
Write-Host "RESOURCE ACADEMIA - 100 USER ONBOARDING" -ForegroundColor Yellow
Write-Host "Running complete onboarding for all departments" -ForegroundColor Gray
Write-Host "="*80 -ForegroundColor Cyan

# Set the CSV path to the full file
$env:ONBOARD_CSV = "C:\Users\sadaq\AD-Automation-Suite\inventory\complete\resource_academia_users_full.csv"

# Run the onboarding script
& "C:\Users\sadaq\AD-Automation-Suite\scripts\user_management\complete_onboard_100.ps1"

Write-Host ""
Write-Host "="*80 -ForegroundColor Green
Write-Host "ONBOARDING COMPLETE!" -ForegroundColor Green
Write-Host "Check logs and reports in the logs/ and reports/ folders" -ForegroundColor Gray
Write-Host "="*80 -ForegroundColor Green