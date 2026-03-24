<#
.SYNOPSIS
    Simple User Onboarding Script - LEARNING VERSION
    This script teaches you how to create AD users step by step
.DESCRIPTION
    We'll learn:
    - How to get user input
    - How to format usernames
    - How to check if user exists
    - How to create user in correct OU
    - How to add to groups
.NOTES
    This is a SIMULATED script for learning
    Author: Israr Sadaq
    Date: March 2026
#>

Clear-Host

# ============================================================
# STEP 1: Define Variables (Configuration)
# ============================================================

$Domain = "resourceacademia.local"
$BaseDN = "DC=resourceacademia,DC=local"

# Department OUs - like mailboxes for different departments
$DepartmentOUs = @{
    "IT" = "OU=IT,OU=Departments,$BaseDN"
    "Finance" = "OU=Finance,OU=Departments,$BaseDN"
    "Marketing" = "OU=Marketing,OU=Departments,$BaseDN"
    "Teachers" = "OU=Teachers,OU=Departments,$BaseDN"
    "Students" = "OU=Students,OU=Departments,$BaseDN"
    "Admin" = "OU=Admin,OU=Departments,$BaseDN"
}

# Department Groups - what access each department gets
$DepartmentGroups = @{
    "IT" = @("IT_Admins", "Network_Admins")
    "Finance" = @("Finance_Staff")
    "Marketing" = @("Marketing_Staff")
    "Teachers" = @("Faculty")
    "Students" = @("Students", "Lab_Access", "Library_Access")
    "Admin" = @("Admin_Staff")
}

# Log file - where we record everything
$LogFile = "C:\Users\sadaq\AD-Automation-Suite\logs\onboard.log"

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
# STEP 3: Get User Input
# ============================================================

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "USER ONBOARDING - Enter New Employee Details" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

$FirstName = Read-Host "First Name"
$LastName = Read-Host "Last Name"

# Show available departments
Write-Host ""
Write-Host "Available Departments:" -ForegroundColor Yellow
foreach ($dept in $DepartmentOUs.Keys | Sort-Object) {
    Write-Host "  - $dept" -ForegroundColor Gray
}

$Department = Read-Host "Department (IT/Finance/Marketing/Teachers/Students/Admin)"
$Title = Read-Host "Job Title"
$Password = Read-Host "Initial Password (default: ChangeMe@123)"

if (-not $Password) {
    $Password = "ChangeMe@123"
}

# ============================================================
# STEP 4: Generate Username
# ============================================================

$Username = ($FirstName.Substring(0,1) + $LastName).ToLower()
Write-Log "Generated username: $Username"

# ============================================================
# STEP 5: Check if User Already Exists (Simulated)
# ============================================================

Write-Host ""
Write-Host "Checking if user already exists..." -ForegroundColor Yellow

# Simulated list of existing users (for learning)
$simulatedExistingUsers = @("john.doe", "jane.smith", "admin.user")

if ($Username -in $simulatedExistingUsers) {
    Write-Log "User already exists: $Username" "WARNING"
    Write-Host "[ERROR] User $Username already exists!" -ForegroundColor Red
    exit 1
}
else {
    Write-Log "User $Username is available" "INFO"
    Write-Host "[OK] Username available: $Username" -ForegroundColor Green
}

# ============================================================
# STEP 6: Determine User's OU
# ============================================================

if ($DepartmentOUs.ContainsKey($Department)) {
    $UserOU = $DepartmentOUs[$Department]
    Write-Log "User will be placed in: $UserOU"
}
else {
    Write-Log "Invalid department: $Department" "ERROR"
    Write-Host "[ERROR] Invalid department! Please choose from list." -ForegroundColor Red
    exit 1
}

# ============================================================
# STEP 7: Create User (SIMULATED)
# ============================================================

Write-Host ""
Write-Host "Creating user account..." -ForegroundColor Yellow

# Simulated user creation
Write-Log "Creating user: $FirstName $LastName"
Write-Log "  Username: $Username"
Write-Log "  Department: $Department"
Write-Log "  Title: $Title"
Write-Log "  OU: $UserOU"

Write-Host "[OK] User created: $Username" -ForegroundColor Green

# ============================================================
# STEP 8: Add User to Groups
# ============================================================

Write-Host ""
Write-Host "Adding user to security groups..." -ForegroundColor Yellow

if ($DepartmentGroups.ContainsKey($Department)) {
    $Groups = $DepartmentGroups[$Department]
    
    foreach ($Group in $Groups) {
        Write-Log "  Added to group: $Group"
        Write-Host "  [OK] Added to: $Group" -ForegroundColor Gray
    }
}
else {
    Write-Log "No groups defined for department: $Department" "WARNING"
}

# ============================================================
# STEP 9: Display Summary
# ============================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "USER ONBOARDING COMPLETE!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "USER DETAILS:" -ForegroundColor Yellow
Write-Host "  Name: $FirstName $LastName" -ForegroundColor White
Write-Host "  Username: $Username" -ForegroundColor White
Write-Host "  Department: $Department" -ForegroundColor White
Write-Host "  Title: $Title" -ForegroundColor White
Write-Host "  Password: $Password (must change on first login)" -ForegroundColor Yellow

Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Inform user of their credentials" -ForegroundColor Gray
Write-Host "  2. User must change password on first login" -ForegroundColor Gray
Write-Host "  3. Verify group memberships" -ForegroundColor Gray

Write-Log "Onboarding completed successfully for $Username"

Write-Host ""
Write-Host "[OK] Done! Log saved to: $LogFile" -ForegroundColor Green