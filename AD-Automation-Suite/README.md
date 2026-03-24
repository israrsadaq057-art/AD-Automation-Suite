\# 🏢 Resource Academia - Enterprise IT Management Suite



\## 👨‍💻 Network Engineer: Israr Sadaq



\[!\[PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://microsoft.com/powershell)

\[!\[HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5\&logoColor=white)](https://html.spec.whatwg.org/)

\[!\[CSS3](https://img.shields.io/badge/CSS3-1572B6?logo=css3\&logoColor=white)](https://www.w3.org/Style/CSS/)

\[!\[JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript\&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

\[!\[Chart.js](https://img.shields.io/badge/Chart.js-FF6384?logo=chartdotjs\&logoColor=white)](https://www.chartjs.org/)

\[!\[License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)



\---



\## 📋 Project Overview



This project is a \*\*complete IT management solution\*\* for \*\*Resource Academia International\*\*, demonstrating enterprise-level capabilities in:



| Area | Skills Demonstrated |

|------|---------------------|

| \*\*Active Directory\*\* | User lifecycle, GPO automation, backup/recovery, health monitoring |

| \*\*PowerShell Automation\*\* | Onboarding, offboarding, bulk import, reporting, logging |

| \*\*IT Administration\*\* | Employee tracking, asset management, ticket system, compliance |

| \*\*Web Development\*\* | Interactive dashboard with real-time data, charts, modals |

| \*\*Data Management\*\* | CSV generation for 100+ users with realistic employee data |



\---



\## 🚀 Features



\### 1. PowerShell Automation Suite



| Script | Purpose |

|--------|---------|

| `simple\_onboard.ps1` | Create single user with department OU, groups, home directory |

| `simple\_offboard.ps1` | Disable account, remove groups, move to Terminated OU |

| `bulk\_import.ps1` | Import multiple users from CSV with progress tracking |

| `complete\_onboard\_100.ps1` | Full onboarding for 100 users with all attributes |

| `ad\_health\_monitor.ps1` | Check replication, locked users, password expiry, FSMO roles |

| `gpo\_automation.ps1` | Create and backup Group Policy Objects |



\### 2. Enterprise Dashboard



\*\*Live Dashboard Features:\*\*

\- 📊 \*\*Employee Statistics\*\* - Total, on notice, on probation, anniversaries

\- ⚠️ \*\*System Alerts\*\* - Password expiry, locked accounts, pending reviews

\- 🎫 \*\*IT Support Tickets\*\* - Priority, status, SLA tracking

\- 💻 \*\*Asset Management\*\* - Laptops, monitors, phones with warranty

\- 📦 \*\*Software Licenses\*\* - Expiry tracking, cost management

\- 🔐 \*\*Access Requests\*\* - Pending approvals, security review

\- 📚 \*\*Compliance Training\*\* - GDPR, security awareness progress

\- 🚀 \*\*Onboarding Pipeline\*\* - New hires next 90 days

\- 👋 \*\*Offboarding Pipeline\*\* - Departures next 30 days

\- 📈 \*\*Department Headcount\*\* - Visual chart with distribution

\- 🛡️ \*\*Security Incidents\*\* - Phishing, malware, suspicious logins



\### 3. Employee Data Management



Complete employee database with:

\- \*\*Personal Information:\*\* Name, ID, title, department, email, phone, join date, manager

\- \*\*Asset Assignment:\*\* Laptop, monitor, phone, accessories with serial numbers

\- \*\*Attendance Tracking:\*\* Present, absent, leave, late days with percentage

\- \*\*Fault Reports:\*\* Hardware issues, status, resolution tracking



\---



\## 📸 Dashboard Preview



| Main Dashboard | Employee Modal |

|----------------|----------------|

| \*Enterprise dashboard with statistics cards and data panels\* | \*Click any employee to see full profile with assets and attendance\* |



\---



\## 📁 Project Structure

AD-Automation-Suite/

│

├── dashboard/ # HTML Dashboard

│ └── ad\_dashboard\_enterprise.html # Main dashboard (clickable!)

│

├── scripts/ # PowerShell Automation

│ ├── user\_management/

│ │ ├── simple\_onboard.ps1 # Create single user

│ │ ├── simple\_offboard.ps1 # Remove user

│ │ ├── bulk\_import.ps1 # CSV import

│ │ └── complete\_onboard\_100.ps1 # Full 100-user onboarding

│ ├── monitoring/

│ │ └── ad\_health\_monitor.ps1 # AD health checks

│ ├── gpo\_management/

│ │ └── gpo\_automation.ps1 # GPO creation \& backup

│ └── backup/

│ └── ad\_backup.ps1 # AD backup automation

│

├── inventory/complete/

│ └── resource\_academia\_users.csv # 100 realistic users

│

├── logs/ # All operation logs

├── reports/ # Generated CSV reports

├── backup/ # AD backup files

├── .gitignore

├── README.md

└── portfolio.html # Simple portfolio page



\---



\## 🚀 Quick Start



\### 1. Clone the Repository

```bash

git clone https://github.com/israrsadaq057-art/AD-Automation-Suite.git

cd AD-Automation-Suite



