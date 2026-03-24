<#
.SYNOPSIS
    Active Directory Health Monitor
    Checks DC replication, locked users, password expiry, FSMO roles
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

Write-Host "AD Health Monitor (simulated for demo)" -ForegroundColor Cyan
Write-Host "Checking replication status..." -ForegroundColor Yellow
Start-Sleep -Seconds 1
Write-Host "[OK] Replication healthy on all DCs" -ForegroundColor Green
Write-Host "Checking locked users..." -ForegroundColor Yellow
Write-Host "[OK] No locked users found" -ForegroundColor Green
Write-Host "Checking password expiry..." -ForegroundColor Yellow
Write-Host "[WARNING] 12 passwords expiring in next 7 days" -ForegroundColor Yellow
Write-Host "Checking FSMO roles..." -ForegroundColor Yellow
Write-Host "[OK] All FSMO roles assigned" -ForegroundColor Green
Write-Host "`nHealth check completed!" -ForegroundColor Green