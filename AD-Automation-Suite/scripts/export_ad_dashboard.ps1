<#
.SYNOPSIS
    Export AD Data to JSON for Dashboard
    Generates real-time data from the 100-user CSV
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

$CSVPath = "C:\Users\sadaq\AD-Automation-Suite\inventory\complete\resource_academia_users_full.csv"
$OutputPath = "C:\Users\sadaq\AD-Automation-Suite\dashboard\ad_data.json"
$LogFile = "C:\Users\sadaq\AD-Automation-Suite\logs\dashboard_export.log"

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $Message" | Out-File -FilePath $LogFile -Append
    Write-Host "$timestamp - $Message" -ForegroundColor Gray
}

Write-Log "Starting dashboard data export"

# Check if CSV exists
if (-not (Test-Path $CSVPath)) {
    Write-Log "CSV file not found: $CSVPath" "ERROR"
    exit 1
}

# Import users
$users = Import-Csv $CSVPath
Write-Log "Loaded $($users.Count) users from CSV"

# Group by department
$departmentData = @{}
$departmentCounts = @{}
$userLists = @{}

foreach ($user in $users) {
    $dept = $user.Department
    $departmentCounts[$dept] = $departmentCounts[$dept] + 1
    
    if (-not $userLists[$dept]) {
        $userLists[$dept] = @()
    }
    $userName = "$($user.FirstName) $($user.LastName) ($($user.Title))"
    $userLists[$dept] += $userName
}

# Department colors
$deptColors = @{
    "IT" = "#667eea"
    "Finance" = "#f093fb"
    "Marketing" = "#4facfe"
    "Teachers" = "#43e97b"
    "Students" = "#fa709a"
    "Admin" = "#30cfd0"
}

# Build department object
$departments = @{}
foreach ($dept in $departmentCounts.Keys) {
    $departments[$dept] = @{
        count = $departmentCounts[$dept]
        color = $deptColors[$dept]
        users = $userLists[$dept] | Select-Object -First 20
    }
}

# Define security groups
$groups = @(
    @{name="IT_Admins"; members=15; description="Full IT administration rights"},
    @{name="Network_Admins"; members=8; description="Network device management"},
    @{name="Help_Desk"; members=5; description="User support staff"},
    @{name="Finance_Staff"; members=12; description="Financial systems access"},
    @{name="Marketing_Staff"; members=12; description="Marketing tools access"},
    @{name="Faculty"; members=20; description="Teaching resources access"},
    @{name="Students"; members=35; description="Lab and library access"},
    @{name="Admin_Staff"; members=6; description="Administrative systems access"},
    @{name="VPN_Users"; members=45; description="Remote access for staff"},
    @{name="WiFi_Access"; members=85; description="Wireless network access"},
    @{name="Lab_Access"; members=35; description="Computer lab access"},
    @{name="Library_Access"; members=55; description="Digital library access"}
)

# Build final JSON object
$dashboardData = @{
    statistics = @{
        total_users = $users.Count
        total_departments = $departmentCounts.Keys.Count
        total_groups = $groups.Count
        active_users = $users.Count
    }
    departments = $departments
    groups = $groups
    last_updated = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

# Save to JSON
$dashboardData | ConvertTo-Json -Depth 10 | Out-File -FilePath $OutputPath -Encoding UTF8

Write-Log "Dashboard data exported to: $OutputPath"
Write-Log "Total users: $($users.Count)"
Write-Log "Departments: $($departmentCounts.Keys.Count)"

Write-Host ""
Write-Host "="*60 -ForegroundColor Green
Write-Host "DASHBOARD DATA EXPORTED!" -ForegroundColor Green
Write-Host "="*60 -ForegroundColor Green
Write-Host "File: $OutputPath" -ForegroundColor Yellow
Write-Host "Users: $($users.Count)" -ForegroundColor Gray
Write-Host ""
Write-Host "Open the dashboard: C:\Users\sadaq\AD-Automation-Suite\dashboard\ad_dashboard.html" -ForegroundColor Cyan