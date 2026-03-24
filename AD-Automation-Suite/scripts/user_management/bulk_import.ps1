<#
.SYNOPSIS
    Bulk User Import Script - LEARNING VERSION
    This script imports multiple users from a CSV file
.DESCRIPTION
    We'll learn:
    - How to read CSV files
    - How to process multiple users
    - How to track success/failure counts
    - How to generate import reports
.NOTES
    This is a SIMULATED script for learning
    Author: Israr Sadaq
    Date: March 2026
#>

Clear-Host

# ============================================================
# STEP 1: Define Variables
# ============================================================

$CSVPath = "C:\Users\sadaq\AD-Automation-Suite\inventory\sample_users.csv"
$LogFile = "C:\Users\sadaq\AD-Automation-Suite\logs\bulk_import.log"
$ReportFile = "C:\Users\sadaq\AD-Automation-Suite\reports\bulk_import_report_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv"

# Simulated existing users
$simulatedExistingUsers = @("john.doe", "jane.smith", "admin.user")

# Department OUs
$DepartmentOUs = @{
    "IT" = "OU=IT,OU=Departments,DC=resourceacademia,DC=local"
    "Finance" = "OU=Finance,OU=Departments,DC=resourceacademia,DC=local"
    "Marketing" = "OU=Marketing,OU=Departments,DC=resourceacademia,DC=local"
    "Teachers" = "OU=Teachers,OU=Departments,DC=resourceacademia,DC=local"
    "Students" = "OU=Students,OU=Departments,DC=resourceacademia,DC=local"
    "Admin" = "OU=Admin,OU=Departments,DC=resourceacademia,DC=local"
}

# ============================================================
# STEP 2: Create Logging Function
# ============================================================

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp [$Level] - $Message"
    Add-Content -Path $LogFile -Value $logEntry
    Write-Host $logEntry -ForegroundColor Gray
}

# ============================================================
# STEP 3: Check if CSV File Exists
# ============================================================

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "BULK USER IMPORT - CSV Import" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Checking CSV file..." -ForegroundColor Yellow

if (-not (Test-Path $CSVPath)) {
    Write-Host "[ERROR] CSV file not found: $CSVPath" -ForegroundColor Red
    exit 1
}

Write-Host "[OK] CSV file found: $CSVPath" -ForegroundColor Green

# ============================================================
# STEP 4: Read and Process CSV
# ============================================================

Write-Host ""
Write-Host "Reading CSV file..." -ForegroundColor Yellow

$users = Import-Csv $CSVPath
$totalUsers = $users.Count
Write-Host "[OK] Found $totalUsers users in CSV" -ForegroundColor Green

Write-Log "Starting bulk import of $totalUsers users"

# Arrays to track results
$successful = @()
$failed = @()
$alreadyExists = @()

$counter = 0

foreach ($user in $users) {
    $counter++
    Write-Host ""
    Write-Host "Processing user $counter of $totalUsers : $($user.FirstName) $($user.LastName)" -ForegroundColor Yellow
    
    # Generate username
    $Username = ($user.FirstName.Substring(0,1) + $user.LastName).ToLower()
    
    # Check if user exists
    if ($Username -in $simulatedExistingUsers) {
        Write-Host "  [WARNING] User already exists: $Username" -ForegroundColor Yellow
        $alreadyExists += [PSCustomObject]@{
            Username = $Username
            Name = "$($user.FirstName) $($user.LastName)"
            Status = "Already Exists"
            Reason = "Username already in use"
        }
        Write-Log "User already exists: $Username" "WARNING"
        continue
    }
    
    # Check department
    if (-not $DepartmentOUs.ContainsKey($user.Department)) {
        Write-Host "  [ERROR] Invalid department: $($user.Department)" -ForegroundColor Red
        $failed += [PSCustomObject]@{
            Username = $Username
            Name = "$($user.FirstName) $($user.LastName)"
            Status = "Failed"
            Reason = "Invalid department: $($user.Department)"
        }
        Write-Log "Invalid department for user: $($user.FirstName) - $($user.Department)" "ERROR"
        continue
    }
    
    # Simulate user creation
    $UserOU = $DepartmentOUs[$user.Department]
    Write-Host "  [OK] Creating user: $Username" -ForegroundColor Green
    Write-Host "      Department: $($user.Department)" -ForegroundColor Gray
    Write-Host "      Title: $($user.Title)" -ForegroundColor Gray
    Write-Host "      OU: $UserOU" -ForegroundColor Gray
    Write-Host "      Password: $($user.Password)" -ForegroundColor Gray
    
    $successful += [PSCustomObject]@{
        Username = $Username
        Name = "$($user.FirstName) $($user.LastName)"
        Department = $user.Department
        Title = $user.Title
        Status = "Created"
        Reason = "Success"
    }
    
    Write-Log "Created user: $Username ($($user.FirstName) $($user.LastName)) - $($user.Department)"
}

# ============================================================
# STEP 5: Display Summary
# ============================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "BULK IMPORT COMPLETE!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "SUMMARY:" -ForegroundColor Yellow
Write-Host "  Total Users Processed: $totalUsers" -ForegroundColor White
Write-Host "  Successfully Created: $($successful.Count)" -ForegroundColor Green
Write-Host "  Already Exists: $($alreadyExists.Count)" -ForegroundColor Yellow
Write-Host "  Failed: $($failed.Count)" -ForegroundColor Red

# Show successful users
if ($successful.Count -gt 0) {
    Write-Host ""
    Write-Host "SUCCESSFUL CREATIONS:" -ForegroundColor Green
    foreach ($user in $successful) {
        Write-Host "  - $($user.Username) : $($user.Name) ($($user.Department))" -ForegroundColor Gray
    }
}

# Show existing users
if ($alreadyExists.Count -gt 0) {
    Write-Host ""
    Write-Host "ALREADY EXISTS:" -ForegroundColor Yellow
    foreach ($user in $alreadyExists) {
        Write-Host "  - $($user.Username) : $($user.Name)" -ForegroundColor Gray
    }
}

# Show failed users
if ($failed.Count -gt 0) {
    Write-Host ""
    Write-Host "FAILED:" -ForegroundColor Red
    foreach ($user in $failed) {
        Write-Host "  - $($user.Username) : $($user.Name) - $($user.Reason)" -ForegroundColor Gray
    }
}

# ============================================================
# STEP 6: Generate Report
# ============================================================

$allResults = @()
$allResults += $successful
$allResults += $alreadyExists
$allResults += $failed

if ($allResults.Count -gt 0) {
    $allResults | Export-Csv -Path $ReportFile -NoTypeInformation
    Write-Host ""
    Write-Host "[OK] Report saved to: $ReportFile" -ForegroundColor Green
}

Write-Host ""
Write-Host "[OK] Log saved to: $LogFile" -ForegroundColor Green
Write-Log "Bulk import completed. Created: $($successful.Count), Failed: $($failed.Count), Existing: $($alreadyExists.Count)"