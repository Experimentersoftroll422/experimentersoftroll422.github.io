
#(2: WMI Tutorial, CodeLucky, 27/07/2026)
#(3: Working with WMI, Microsoft Learn, 27/07/2026)

#What is WMI?
#WMI stands for Windows Managment Instrumentation
#WMI is tool built into Windows that grants developers/admin the ability to
#access to system information and make configurations
#WMI relies on CIM (Common Information Model) to help display things like systems, applications  or networks

#(4: About WMI Cmdlets, Microsoft Learn, 27/07/2026)

#WMI Cmdlets

#NOTE: For any version above Powershell 6+, all WMI Cmdlets will not work
#They have been completely removed from the Powershell engine 
#WMI Cmdlets are stil important since you may encounter them in older scripts but
#Microsoft has explained in their official documentation to use CIM Commandlets for any future development 


#I am currently running Powershell 5.1 so these native WMI Cmdlets should 
$PSVersionTable

#Command gets a list of common native WMI Cmdlets
Get-Command -Noun WMI*

#(5: WMI Classes, Microsoft Learn, 27/07/2026)
#(3: Working with WMI, Microsoft Learn, 27/07/2026)

#Before getting into a few WMI Cmdlets, we need to first understand what a WMI class is
#A WMI class is something that allows you to query and manage a system 
#WMI's classes are organized into groups called namespaces


# Examples of some common namespaces:

#1: root\CIMv2 = contains classes for operating system or hardware
#2:root\Default = contains classes for registry operations or system configurations
#3:root\Microsoft\Windows = contains classes for certain windows managment features
#4:root\SecurityCenter2 = contains classes for security or firewall operations 

#Examples of actual classes:

#1: Win32_ComputerSystem = system hardware and configuration
#2: Win32_Processor = CPU details
#3: Win32_LogicalDisk  = disk drives/storage information

#(1: Powershell Commands, 27/07/2026)

#shows all instances(objects) in the Win32_ComputerSystem class

#command get system information
Get-WmiObject -Class Win32_ComputerSystem

#(5: PDQ, 27/07/2026)
#Set-WmiInstance: Used to create an instance
#This block of code inside this hashtable creates an environment variable (testvar) using the Win32_Environment class 
#An object created inside the class is called an 'instance'
$setWmiInstanceSplat = @{
    Class = 'Win32_Environment'
    Arguments = @{
        Name="testvar"
        VariableValue="testvalue"
        UserName="<SYSTEM>" #tells us which user environment this is being apllied to
    }
}


Set-WmiInstance @setWmiInstanceSplat

#(6: Where-Object, Microsoft Learn, 27/07/2026)
#Verify if it is actually there
Get-WmiObject -Class Win32_Environment | Where-Object Name -eq "testvar"

#(7:Remove-WmiObject, Microsoft Learn, 27/07/2026)
#Next cmdlet is Remove-WmiObject
#Can be used to delete an instance (object) from a class
#In this case, we are going to remove the instance we created using the Win32_Environment class
 
$testvar = Get-WmiObject -Class Win32_Environment | Where-Object Name -eq "testvar"
$testvar | Remove-WmiObject

SOURCES: 
#(1: Powershell Commands, 27/07/2026:https://powershellcommands.com/get-wmiobject-powershell)
#(2: WMI Tutorial. 27/07/2026: https://www.youtube.com/watch?v=JCKB3YzgNIU&t=13s)
#(3: Working with WMI, Microsoft Learn, 27/07/2026: https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/07-working-with-wmi?view=powershell-7.6)
#(4: About WMI Cmdlets, Microsoft Learn, 27/07/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_wmi_cmdlets?view=powershell-5.1)
#(5: PDQ, 27/07/2026: https://www.pdq.com/powershell/set-wmiinstance/)
#(6: Where-Object, Microsoft Learn, 27/07/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.6)
#(7:Remove-WmiObject, Microsoft Learn, 27/07/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.6)



Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "VMware*" } | ForEach-Object { $_.Uninstall() }