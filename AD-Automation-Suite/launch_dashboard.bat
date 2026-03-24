@echo off
echo Exporting AD data...
powershell -ExecutionPolicy Bypass -File "C:\Users\sadaq\AD-Automation-Suite\scripts\export_ad_dashboard.ps1"
echo.
echo Opening Dashboard...
start "" "C:\Users\sadaq\AD-Automation-Suite\dashboard\ad_dashboard.html"
echo.
echo Dashboard launched!
pause
