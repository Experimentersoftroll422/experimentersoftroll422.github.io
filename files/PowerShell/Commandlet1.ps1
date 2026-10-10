# A Process is a running program on the computer(1, PS Tips).

# Get-Process is a command used to display processes in detail: CPU time, memory usage, process ID (1, PS Tips).


#(1, PS Tips)
#Retrieves all processes 
#Primary case is have a detailed view of computer consumption 
Get-Process

#Filter by different variables: Name
Get-Process -Name 'msedge'
Get-Process -Name 'Discord'
Get-Process -Name 'notepad'

#Filter by CPU Total Time  
Get-Process | Sort-Object CPU -Descending


#(2, Powershell FAQ)
#Used to start applications - elevated privileges or with specific arguments 
#Basic syntax for any application 
Start-Process -FilePath "notepad.exe"

#if the application is not in the path, the full path may be required 

Start-Process -FilePath "C:\COMP66\Commands\Commandlet1.ps1"

#Using elevated privileges, running as admin

Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File C:\COMP66\Commands\Commandlet1.ps1" -Verb RunAs

#(1, PS Tips)
#Used to end a process/terminate it
#End unessecary tasks
Stop-Process -Name 'notepad'

#Filter by ID (notepad)
Stop-Process -ID '16880'


#Sources:

#1. PowerShell Tips, PowerShell Forum, 2026-07-01:
#https://www.powershelltips.com/powershell-get-process/https://www.powershelltips.com/powershell-get-process/
#2. PowerShell FAQ, Bijay Kumar, 2026-07-01:
#https://powershellfaqs.com/powershell-start-process/
