<#
.SYNOPSIS
    Generate Complete 100-User CSV for Resource Academia
    Creates realistic user data across all departments
.NOTES
    Author: Israr Sadaq
    Date: March 2026
#>

$outputPath = "C:\Users\sadaq\AD-Automation-Suite\inventory\complete\resource_academia_users_full.csv"

# Department configurations
$departments = @{
    "IT" = @{
        Count = 15
        Titles = @("IT Director", "Network Administrator", "System Administrator", "Help Desk Lead", 
                   "Network Engineer", "System Engineer", "Help Desk Technician", "IT Support Specialist",
                   "Database Administrator", "Security Analyst", "Cloud Engineer", "DevOps Engineer",
                   "IT Project Manager", "Business Analyst", "IT Trainer")
        Office = "Islamabad-Head Office"
        PhoneBase = "1234567"
    }
    "Finance" = @{
        Count = 12
        Titles = @("Finance Director", "Senior Accountant", "Accountant", "Payroll Specialist",
                   "Auditor", "Budget Analyst", "Tax Specialist", "Accounts Receivable",
                   "Accounts Payable", "Financial Analyst", "Treasury Manager", "Risk Analyst")
        Office = "Islamabad-Head Office"
        PhoneBase = "1234580"
    }
    "Marketing" = @{
        Count = 12
        Titles = @("Marketing Director", "Digital Marketing Manager", "Content Creator", "Social Media Manager",
                   "SEO Specialist", "Graphic Designer", "Video Editor", "Email Marketing Specialist",
                   "Marketing Analyst", "Brand Manager", "PR Specialist", "Market Research Analyst")
        Office = "Islamabad-Head Office"
        PhoneBase = "1234590"
    }
    "Teachers" = @{
        Count = 20
        Titles = @("Professor Computer Science", "Senior Lecturer IT", "Professor Mathematics", 
                   "Lecturer Networking", "Lecturer Programming", "Associate Professor English",
                   "Professor Physics", "Lecturer Mathematics", "Lecturer English", "Associate Professor CS",
                   "Professor Chemistry", "Lecturer Biology", "Professor Economics", "Lecturer Business",
                   "Professor Psychology", "Lecturer History", "Associate Professor Law", "Lecturer Statistics",
                   "Professor Engineering", "Lecturer Design")
        Office = "Islamabad-Campus"
        PhoneBase = "1234600"
    }
    "Students" = @{
        Count = 35
        Titles = @("BS CS Student", "BS IT Student", "BS SE Student", "BS AI Student",
                   "BS DS Student", "BS Cyber Security", "MS CS Student", "MS IT Student",
                   "PhD CS Student", "BS Economics", "BS Business", "BS Accounting")
        Office = "Islamabad-Campus"
        PhoneBase = "1234650"
    }
    "Admin" = @{
        Count = 6
        Titles = @("HR Director", "Admin Officer", "Receptionist", "Facility Manager",
                   "HR Generalist", "Admin Assistant", "Office Coordinator", "Procurement Officer",
                   "Legal Advisor", "Compliance Officer")
        Office = "Islamabad-Head Office"
        PhoneBase = "1234680"
    }
}

# First names and last names pools
$firstNames = @(
    "Ahmed", "Fatima", "Omar", "Sara", "Usman", "Zara", "Bilal", "Ayesha", "Hamza", "Sana",
    "Ali", "Hina", "Imran", "Rabia", "Zain", "Saima", "Khalid", "Nadia", "Raza", "Muhammad",
    "Amina", "Hassan", "Iqra", "Junaid", "Kiran", "Maham", "Noman", "Parveen", "Qasim", "Rukhsana",
    "Saad", "Tahir", "Uzma", "Waqar", "Yasmeen", "Zafar", "Abrar", "Bushra", "Danish", "Eman"
)

$lastNames = @(
    "Khan", "Malik", "Hassan", "Ali", "Ahmed", "Raza", "Akhtar", "Shah", "Chaudhry", "Tariq",
    "Riaz", "Zahra", "Abbas", "Bhatti", "Butt", "Dar", "Farooq", "Gill", "Hashmi", "Iqbal",
    "Javed", "Khalid", "Latif", "Mirza", "Nawaz", "Qureshi", "Rana", "Siddiqui", "Usman", "Wahid"
)

$firstNamesCount = $firstNames.Count
$lastNamesCount = $lastNames.Count

# Generate users
$users = @()
$employeeIdCounter = 1

# Create header
$users += "FirstName,LastName,Department,Title,Manager,Office,Phone,Email,EmployeeID,StartDate"

# Function to get random phone
function Get-PhoneNumber {
    param([string]$Base, [int]$Index)
    $phoneNum = [int]$Base + $Index
    return "+92-51-$phoneNum"
}

# Function to get random manager based on department
function Get-Manager {
    param([string]$Department, [int]$Index)
    if ($Index -eq 1) { return "CEO" }
    
    # First person in department is director
    if ($Department -eq "IT" -and $Index -le 15) { return "Ahmed Hassan" }
    if ($Department -eq "Finance" -and $Index -le 12) { return "Omar Malik" }
    if ($Department -eq "Marketing" -and $Index -le 12) { return "Zain Malik" }
    if ($Department -eq "Teachers" -and $Index -le 20) { return "Dr. Muhammad Raza" }
    if ($Department -eq "Admin" -and $Index -le 6) { return "Hina Tariq" }
    
    return "Department Head"
}

# Generate users by department
$counter = 1
foreach ($dept in $departments.Keys) {
    $config = $departments[$dept]
    $titleIndex = 0
    
    for ($i = 1; $i -le $config.Count; $i++) {
        # Get random name
        $firstName = $firstNames[($counter - 1) % $firstNamesCount]
        $lastName = $lastNames[($counter - 1) % $lastNamesCount]
        
        # Get title (cycle through titles)
        $title = $config.Titles[$titleIndex % $config.Titles.Count]
        $titleIndex++
        
        # Get manager
        $manager = Get-Manager -Department $dept -Index $i
        
        # Get phone
        $phoneBase = [int]$config.PhoneBase
        $phone = Get-PhoneNumber -Base $phoneBase -Index $i
        
        # Generate email
        $email = "$($firstName.ToLower()).$($lastName.ToLower())@resourceacademia.local"
        if ($dept -eq "Students") {
            $email = "$($firstName.ToLower()).$($lastName.ToLower())@students.resourceacademia.local"
        }
        
        # Employee ID
        # Get department code (first 3 letters, or whole if shorter)
        $deptCode = $dept.Substring(0, [Math]::Min(3, $dept.Length)).ToUpper()
        $empId = "$deptCode$([string]$employeeIdCounter).PadLeft(3,'0')"
        
        # Start date (random within last 2 years)
        $startDate = (Get-Date).AddDays(-(Get-Random -Minimum 1 -Maximum 730)).ToString("yyyy-MM-dd")
        
        # Add user
        $users += "$firstName,$lastName,$dept,$title,$manager,$($config.Office),$phone,$email,$empId,$startDate"
        
        $counter++
        $employeeIdCounter++
        
        # Break if we have enough users (100 total)
        if ($counter -gt 100) { break }
    }
    if ($counter -gt 100) { break }
}

# Save to file
$users | Out-File -FilePath $outputPath -Encoding UTF8

Write-Host "="*60 -ForegroundColor Cyan
Write-Host "100-USER CSV GENERATED!" -ForegroundColor Green
Write-Host "="*60 -ForegroundColor Cyan
Write-Host ""
Write-Host "File: $outputPath" -ForegroundColor Yellow
Write-Host "Total Users: $($users.Count - 1)" -ForegroundColor Green
Write-Host ""
Write-Host "Department Breakdown:" -ForegroundColor Yellow

# Count users by department
$deptCounts = @{}
foreach ($user in $users[1..($users.Count-1)]) {
    $parts = $user -split ","
    $dept = $parts[2]
    $deptCounts[$dept] = $deptCounts[$dept] + 1
}

foreach ($dept in $deptCounts.Keys | Sort-Object) {
    Write-Host "  $dept : $($deptCounts[$dept]) users" -ForegroundColor Gray
}