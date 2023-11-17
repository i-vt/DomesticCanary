# List Processes Sorted by Memory Usage
Write-Host "Listing Processes by Memory Usage:" -ForegroundColor Cyan
Get-Process | Sort-Object WorkingSet -Descending | Select-Object Name, ID, WorkingSet -First 10 | Format-Table -AutoSize

# Check Active Network Connections
Write-Host "`nActive Network Connections:" -ForegroundColor Cyan
Get-NetTCPConnection | Where-Object { $_.State -eq "Established" } | Format-Table LocalAddress, LocalPort, RemoteAddress, RemotePort, State -AutoSize

# List Running Services
Write-Host "`nRunning Services:" -ForegroundColor Cyan
Get-Service | Where-Object { $_.Status -eq "Running" } | Format-Table Name, DisplayName, Status -AutoSize

# Check Scheduled Tasks
Write-Host "`nScheduled Tasks:" -ForegroundColor Cyan
Get-ScheduledTask | Where-Object { $_.State -eq "Ready" } | Select-Object TaskName, TaskPath, State, LastRunTime | Format-Table -AutoSize

# Check Autostart Programs
Write-Host "`nAutostart Programs:" -ForegroundColor Cyan
Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location, User | Format-Table -AutoSize

# Check Critical System Logs
Write-Host "`nCritical System Logs (Last 50 Entries):" -ForegroundColor Cyan
Get-EventLog -LogName System -EntryType Error, Warning -Newest 50 | Select-Object TimeWritten, Source, Message | Format-Table -AutoSize

# Check Security Logs (Optional, can be resource-intensive)
Write-Host "`nSecurity Logs (Last 50 Entries):" -ForegroundColor Cyan
Get-EventLog -LogName Security -Newest 50 | Select-Object TimeWritten, EntryType, Message | Format-Table -AutoSize
