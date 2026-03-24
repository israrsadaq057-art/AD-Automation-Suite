<#
.SYNOPSIS
    Test Active Directory Connection
    This script shows how to connect to AD (simulated for learning)
.DESCRIPTION
    We'll learn:
    - How to check if AD module is available
    - Basic AD query structure
    - How to handle connection errors
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

Clear-Host

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "ACTIVE DIRECTORY CONNECTION TEST" -ForegroundColor Yellow
Write-Host "Learning how to connect to AD" -ForegroundColor Gray
Write-Host "============================================================" -ForegroundColor Cyan

# ============================================================
# STEP 1: Check if AD Module is Available
# ============================================================
Write-Host ""
Write-Host "[1] Checking Active Directory Module..." -ForegroundColor Yellow

$adModule = Get-Module -ListAvailable -Name ActiveDirectory

if ($adModule) {
    Write-Host "[OK] AD Module found at: $($adModule.ModuleBase)" -ForegroundColor Green
    Import-Module ActiveDirectory -ErrorAction SilentlyContinue
}
else {
    Write-Host "[INFO] AD Module NOT found" -ForegroundColor Yellow
    Write-Host "  This is normal if you don't have a Domain Controller" -ForegroundColor Gray
    Write-Host "  In production, you'd install RSAT tools first" -ForegroundColor Gray
}

# ============================================================
# STEP 2: Try to Connect to AD Domain
# ============================================================
Write-Host ""
Write-Host "[2] Attempting to connect to AD Domain..." -ForegroundColor Yellow

try {
    $domain = Get-ADDomain -ErrorAction Stop
    Write-Host "[OK] Connected to domain: $($domain.DNSRoot)" -ForegroundColor Green
}
catch {
    Write-Host "[INFO] Cannot connect to AD Domain" -ForegroundColor Yellow
    Write-Host "  Error: $($_.Exception.Message)" -ForegroundColor Gray
    Write-Host "  This is expected - we're in a lab environment" -ForegroundColor Gray
}

# ============================================================
# STEP 3: Basic AD Query Structure
# ============================================================
Write-Host ""
Write-Host "[3] AD Query Syntax (for reference)" -ForegroundColor Yellow

Write-Host "  In a real AD environment, you'd use commands like:" -ForegroundColor Gray
Write-Host ""
Write-Host "  # Get all users" -ForegroundColor White
Write-Host "  Get-ADUser -Filter *" -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Get users in specific department" -ForegroundColor White
Write-Host "  Get-ADUser -Filter `"Department -eq 'IT'`"" -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Get specific user" -ForegroundColor White
Write-Host "  Get-ADUser -Identity `"israr.sadaq`"" -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Get group members" -ForegroundColor White
Write-Host "  Get-ADGroupMember -Identity `"IT_Admins`"" -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Create a new user" -ForegroundColor White
Write-Host "  New-ADUser -Name `"John Doe`" -SamAccountName `"jdoe`" -Department `"IT`"" -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Disable a user" -ForegroundColor White
Write-Host "  Disable-ADAccount -Identity `"jdoe`"" -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Add user to group" -ForegroundColor White
Write-Host "  Add-ADGroupMember -Identity `"IT_Admins`" -Members `"jdoe`"" -ForegroundColor Cyan

# ============================================================
# STEP 4: Simulated AD Query (For Learning)
# ============================================================
Write-Host ""
Write-Host "[4] Simulated AD Query (Learning without real AD)" -ForegroundColor Yellow

# Create a simulated list of users
$simulatedUsers = @(
    [PSCustomObject]@{Username="israr.sadaq"; Name="Israr Sadaq"; Department="IT"; Title="Network Administrator"}
    [PSCustomObject]@{Username="ahmed.hassan"; Name="Ahmed Hassan"; Department="IT"; Title="System Administrator"}
    [PSCustomObject]@{Username="fatima.ali"; Name="Fatima Ali"; Department="IT"; Title="Help Desk Lead"}
    [PSCustomObject]@{Username="omar.khan"; Name="Omar Khan"; Department="Finance"; Title="Finance Manager"}
    [PSCustomObject]@{Username="zain.malik"; Name="Zain Malik"; Department="Marketing"; Title="Marketing Manager"}
)

Write-Host "  Simulated AD Users:" -ForegroundColor Yellow
foreach ($user in $simulatedUsers) {
    Write-Host "    $($user.Username) - $($user.Name) - $($user.Department)" -ForegroundColor Gray
}

# ============================================================
# SUMMARY
# ============================================================
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "WHAT WE LEARNED:" -ForegroundColor Yellow
Write-Host "  [1] How to check if AD module is installed" -ForegroundColor Green
Write-Host "  [2] Basic AD query syntax" -ForegroundColor Green
Write-Host "  [3] How to handle connection errors" -ForegroundColor Green

Write-Host ""
Write-Host "NEXT STEPS:" -ForegroundColor Yellow
Write-Host "  1. Continue with our simulated AD scripts" -ForegroundColor Gray
Write-Host "  2. Practice the AD commands in our simulation" -ForegroundColor Gray

Write-Host ""
Write-Host "[OK] Connection test completed!" -ForegroundColor Green