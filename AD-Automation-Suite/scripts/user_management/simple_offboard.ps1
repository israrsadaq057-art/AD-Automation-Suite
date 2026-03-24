<#
.SYNOPSIS
    Simple User Offboarding Script - LEARNING VERSION
    This script simulates removing a user from Active Directory
.DESCRIPTION
    We'll learn:
    - How to get user input
    - How to check if user exists
    - How to disable user account
    - How to move to terminated OU
    - How to remove group memberships
.NOTES
    This is a SIMULATED script for learning
    Author: Israr Sadaq
    Date: March 2026
#>

Clear-Host

# ============================================================
# STEP 1: Define Variables
# ============================================================

$Domain = "resourceacademia.local"
$BaseDN = "DC=resourceacademia,DC=local"
$TerminatedOU = "OU=Terminated,OU=Departments,$BaseDN"

# Log file
$LogFile = "C:\Users\sadaq\AD-Automation-Suite\logs\offboard.log"

# ============================================================
# STEP 2: Create Logging Function
# ============================================================

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp [$Level] - $Message"
    Add-Content -Path $LogFile -Value $logEntry
    
    switch ($Level) {
        "ERROR" { Write-Host $logEntry -ForegroundColor Red }
        "WARNING" { Write-Host $logEntry -ForegroundColor Yellow }
        default { Write-Host $logEntry -ForegroundColor Gray }
    }
}

# ============================================================
# STEP 3: Simulated User Database
# ============================================================

# Simulated list of existing users (users we created earlier)
$simulatedUsers = @{
    "araza" = @{
        Name = "Ali Raza"
        Department = "IT"
        Title = "Network Engineer"
        Groups = @("IT_Admins", "Network_Admins")
        Enabled = $true
    }
    "fkhan" = @{
        Name = "Fatima Khan"
        Department = "Finance"
        Title = "Senior Accountant"
        Groups = @("Finance_Staff")
        Enabled = $true
    }
    "john.doe" = @{
        Name = "John Doe"
        Department = "IT"
        Title = "System Admin"
        Groups = @("IT_Admins")
        Enabled = $true
    }
    "jane.smith" = @{
        Name = "Jane Smith"
        Department = "Marketing"
        Title = "Marketing Specialist"
        Groups = @("Marketing_Staff")
        Enabled = $true
    }
}

# ============================================================
# STEP 4: Get User Input
# ============================================================

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "USER OFFBOARDING - Remove Employee" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Current Active Users:" -ForegroundColor Yellow
foreach ($user in $simulatedUsers.Keys | Sort-Object) {
    $userData = $simulatedUsers[$user]
    if ($userData.Enabled) {
        Write-Host "  - $user ($($userData.Name)) - $($userData.Department)" -ForegroundColor Gray
    }
}

Write-Host ""
$Username = Read-Host "Username to offboard"
$Reason = Read-Host "Reason for leaving (Resignation/Termination/Retirement)"

# ============================================================
# STEP 5: Check if User Exists
# ============================================================

Write-Host ""
Write-Host "Checking if user exists..." -ForegroundColor Yellow

if (-not $simulatedUsers.ContainsKey($Username)) {
    Write-Log "User not found: $Username" "ERROR"
    Write-Host "[ERROR] User $Username not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Available users:" -ForegroundColor Yellow
    foreach ($user in $simulatedUsers.Keys | Sort-Object) {
        Write-Host "  - $user" -ForegroundColor Gray
    }
    exit 1
}

$userData = $simulatedUsers[$Username]
Write-Log "Found user: $Username - $($userData.Name)"

# ============================================================
# STEP 6: Confirm Offboarding
# ============================================================

Write-Host ""
Write-Host "User Details:" -ForegroundColor Yellow
Write-Host "  Name: $($userData.Name)" -ForegroundColor White
Write-Host "  Department: $($userData.Department)" -ForegroundColor White
Write-Host "  Title: $($userData.Title)" -ForegroundColor White
Write-Host "  Groups: $($userData.Groups -join ', ')" -ForegroundColor White
Write-Host "  Reason: $Reason" -ForegroundColor White

Write-Host ""
$confirm = Read-Host "Confirm offboarding? (Y/N)"

if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "[CANCELLED] Offboarding cancelled by user" -ForegroundColor Yellow
    Write-Log "Offboarding cancelled for $Username"
    exit 0
}

# ============================================================
# STEP 7: Simulated Offboarding Process
# ============================================================

Write-Host ""
Write-Host "Processing offboarding for $Username..." -ForegroundColor Yellow

# Step 7a: Remove from all groups
Write-Host "  Removing from security groups..." -ForegroundColor Gray
foreach ($group in $userData.Groups) {
    Write-Log "  Removed from group: $group"
    Write-Host "    [OK] Removed from: $group" -ForegroundColor Gray
}

# Step 7b: Disable user account
Write-Host "  Disabling user account..." -ForegroundColor Gray
$userData.Enabled = $false
Write-Log "Account disabled for: $Username"

# Step 7c: Move to Terminated OU
Write-Host "  Moving to Terminated OU..." -ForegroundColor Gray
Write-Log "Moved user to: $TerminatedOU"

# Step 7d: Update description with termination date
$TerminationDate = Get-Date -Format "yyyy-MM-dd"
Write-Host "  Adding termination notes..." -ForegroundColor Gray
Write-Log "Termination notes: $Reason - $TerminationDate"

# Step 7e: Log offboarding completion
Write-Host "  Creating offboarding record..." -ForegroundColor Gray
Write-Log "Offboarding completed for $Username ($($userData.Name))"

# ============================================================
# STEP 8: Display Summary
# ============================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "USER OFFBOARDING COMPLETE!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "OFFBOARDING SUMMARY:" -ForegroundColor Yellow
Write-Host "  Username: $Username" -ForegroundColor White
Write-Host "  Name: $($userData.Name)" -ForegroundColor White
Write-Host "  Previous Department: $($userData.Department)" -ForegroundColor White
Write-Host "  Reason: $Reason" -ForegroundColor White
Write-Host "  Termination Date: $TerminationDate" -ForegroundColor White

Write-Host ""
Write-Host "Actions Performed:" -ForegroundColor Green
Write-Host "  [OK] Removed from all security groups" -ForegroundColor Gray
Write-Host "  [OK] Disabled user account" -ForegroundColor Gray
Write-Host "  [OK] Moved to Terminated OU" -ForegroundColor Gray
Write-Host "  [OK] Added termination notes" -ForegroundColor Gray
Write-Host "  [OK] Created offboarding record" -ForegroundColor Gray

Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Forward email to manager (if applicable)" -ForegroundColor Gray
Write-Host "  2. Collect company assets" -ForegroundColor Gray
Write-Host "  3. Remove access to external systems" -ForegroundColor Gray

Write-Log "Offboarding process completed for $Username"

Write-Host ""
Write-Host "[OK] Done! Log saved to: $LogFile" -ForegroundColor Green