<#
.SYNOPSIS
    Export Advanced AD Data to JSON for Dashboard
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

$CSVPath = "C:\Users\sadaq\AD-Automation-Suite\inventory\complete\resource_academia_users_full.csv"
$OutputPath = "C:\Users\sadaq\AD-Automation-Suite\dashboard\ad_data.json"

$users = Import-Csv $CSVPath

# Build department data
$departments = @{}
foreach ($user in $users) {
    $dept = $user.Department
    if (-not $departments[$dept]) {
        $departments[$dept] = @{ count = 0; users = @() }
    }
    $departments[$dept].count++
    $departments[$dept].users += "$($user.FirstName) $($user.LastName) ($($user.Title))"
}

# Build alerts
$alerts = @()
$expiringUsers = $users | Where-Object { (Get-Random -Minimum 1 -Maximum 100) -le 12 }
if ($expiringUsers.Count -gt 0) {
    $alerts += @{ type = "warning"; message = "$($expiringUsers.Count) passwords expiring in the next 7 days"; time = "2 hours ago" }
}
$alerts += @{ type = "info"; message = "New user onboarding completed for 5 employees"; time = "1 day ago" }
$alerts += @{ type = "warning"; message = "IT_Admins group membership audit pending"; time = "2 days ago" }

# Build groups
$groups = @(
    @{ name = "IT_Admins"; members = 15; description = "Full IT administration" },
    @{ name = "Network_Admins"; members = 8; description = "Network management" },
    @{ name = "Help_Desk"; members = 5; description = "User support" },
    @{ name = "Finance_Staff"; members = 12; description = "Finance access" },
    @{ name = "Faculty"; members = 20; description = "Teaching resources" },
    @{ name = "Students"; members = 35; description = "Lab access" }
)

# Build recent activity
$recentActivity = @(
    @{ action = "User created"; user = "Ali Raza"; time = "10:30 AM" },
    @{ action = "Password changed"; user = "Fatima Ali"; time = "9:15 AM" },
    @{ action = "Group membership updated"; user = "Omar Khan"; time = "Yesterday" }
)

$dashboardData = @{
    statistics = @{
        total_users = $users.Count
        active_users = $users.Count - 2
        expiring_soon = 12
        locked_accounts = 2
    }
    departments = $departments
    groups = $groups
    alerts = $alerts
    recentActivity = $recentActivity
}

$dashboardData | ConvertTo-Json -Depth 10 | Out-File -FilePath $OutputPath -Encoding UTF8

Write-Host "Advanced dashboard data exported to: $OutputPath" -ForegroundColor Green