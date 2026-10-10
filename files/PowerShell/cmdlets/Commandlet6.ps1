#Set-ExecutionPolicy & Get-ExecutionPolicy

#(1: CodeLucky, YouTube, 02/08/26)
#(2: About-ExecutionPolicy, Microsoft Learn, 02/08/2026)

#First off, what is an execution policy?
#An execution policy is a security feauture used to control how powershell loads 
#configuration files and runs scripts 
#This is feature used to prevent pontentially harmful scripts from running
#Very important in terms of scripts in general since it's lets you set restrictions
#on what kinda scripts are run

#(4: CodeLucky, YouTube, 02/08/2026)
#Execution Policy Scopes???
#The scope of an execution policy tells us where it is applied to
#So there are 5 possible ways an execution policy can be applied

#List of Scopes:
#Process: temporary since it applies to current powershell session and dissapears once closed
#CurrentUser: a persistant scope meaning it stays even after a session is closed, applies to the current user profile
#LocalMachine: system wide, applies to the entire system (requires elevated permissions) 
#UserPolicy: set through group policy, it has the highest priority which allows it to override local policies 
#MachinePolicy: set through group policy, it has the second priority which allows it to override local policies 


#Let's talk about scope priority:
#powershell actually uses a hierarchical structure to determine priority of 
#which scope gets applied
#You can view this this through this command:
Get-ExecutionPolicy -List
#if an execution policy is undefined, powershell skips to the next one
#untill it lands on one that is defined


#There are 6 types of Execution Policies:
#Restricted: No scripts allowed
#AllSigned: Only scripts signed by trusted publishers
#RemoteSigned: Downloaded scripts from the Internet must be signed
#Unrestricted: All scripts run with warning (specifically when downloaded from the Internet)
#Bypass: Nothing is blocked, no warning nor any prompts (used for scenerios where you don't want any user intraction at all)
#Undefined: No execution policy set at current scope

#Alrighty so to check what policy is currently in effect:
Get-ExecutionPolicy

#(3: Set-ExecutionPolicy, Microsoft Learn, 02/08/2026)
#To change your execution policy:

Set-ExecutionPolicy -Scope Process RemoteSigned

#scope parameter determines where the policy is being applied
#NOTE: for the LocalMachine scope which affects all users, requires elevated permissions


#SOURCES!!!
#(1: CodeLucky, YouTube, 02/08/2026: https://www.youtube.com/watch?v=cNPM3sg9GEg)
#(2: About-ExecutionPolicy, Microsoft Learn, 02/08/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.6)
#(3: Set-ExecutionPolicy, Microsoft Learn, 02/08/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.6)
#(4: CodeLucky, YouTube, 02/08/2026: https://www.youtube.com/watch?v=TRpvoY7MPuk)

$cred = Get-Credential -UserName "admin"
Enter-PSSession -ComputerName 192.168.192.129 -Credential $cred


$computer = $env:COMPUTERNAME

Get-WmiObject -Class Win32_Product | Select-Object  @{Name="ComputerName"; Expression={$computer}}, @{Name="Name"; Expression={$_.Name}}, @{Name="Vendor"; Expression={$_.Vendor}}, @{Name="Version"; Expression={$_.Version}}, @{Name="InstallDate"; Expression={$_.InstallDate}}

