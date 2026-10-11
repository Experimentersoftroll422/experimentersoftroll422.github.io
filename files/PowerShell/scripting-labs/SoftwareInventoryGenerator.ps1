
param(
    [switch] $HTML  #Switch param from Microsoft Learn 
)

#Extracts and stores Hostname value
$computer = $env:COMPUTERNAME

#Hostmachine variable captures all of the windows-store-installed applications
#Get-WmiObject cmdlet is used to query and filter by the Win32_Product class to retrieve
#the name, vendor, version and install date of each software

$Hostmachine = Get-WmiObject -Class Win32_Product | Select-Object `
    @{Name="ComputerName"; Expression={$computer}},
    @{Name="Name"; Expression={$_.Name}},
    @{Name="Vendor"; Expression={$_.Vendor}},
    @{Name="Version"; Expression={$_.Version}},
    @{Name="InstallDate"; Expression={$_.InstallDate}}

#$cred used to authenticate any connections between the hostmachine and VMs
#$ips is a text file that stores a list of VM/Remote ips which are used in the following invoke command.


#(5: Get-Content, Microsoft Learn, 05/08/2026)
$cred = Get-Credential
$ips = Get-Content "C:\COMP66\Powershell-Guides\ips.txt"

#foreach loop which takes each ip from the ip textfile to take each VM and pass
#the invoke command through it.
#The invoke command allows to run a block of the script on the VM without having 
#to enter into a PSSession.

#(2: Invoke-Command, Microsoft Learn, 05/08/2026)
#(4: Flow Control, Microsoft Learn, 05/08/2026)
$VMs = foreach ($ip in $ips) {
    Invoke-Command -ComputerName $ip -Credential $cred -ScriptBlock {
        $computer = $env:COMPUTERNAME

        Get-WmiObject -Class Win32_Product | Select-Object `
            @{Name="ComputerName"; Expression={$computer}},
            @{Name="Name"; Expression={$_.Name}},
            @{Name="Vendor"; Expression={$_.Vendor}},
            @{Name="Version"; Expression={$_.Version}},
            @{Name="InstallDate"; Expression={$_.InstallDate}}
    }
}

#$Reports variable stores all of the output from the terminal
$Reports = $Hostmachine + $VMs 

$css = @"
<style>
body { font-family: Segoe UI, Arial, sans-serif; font-size: 13px; margin: 20px; }
h1 { color: #0078d4; }
table { border-collapse: collapse; width: 100%; }
th { background-color: #0078d4; color: white; padding: 8px; text-align: left; }
td { border: 1px solid #ddd; padding: 6px; }
tr:nth-child(even) td { background-color: #f5f5f5; }
</style>
"@          #CSS style to make HTML looks better and easier to read

#if else statement used to either convert the object into a html or csv report
#(3: Export-Csv, Microsoft Learn, 05/08/2026)
if ($HTML) {
    $Reports | ConvertTo-Html -Head $css | Set-Content .\htmlreport.html       #To export as HTML, call .\SoftwareInventoryGenerator.ps1 -Html
}
else {
    $Reports | Export-Csv -Path .\csvreport.csv -NoTypeInformation  #To export as CSV, call .\SoftwareInventoryGenerator.ps1
}

#SOURCES 
#(1: Switch Parameter, Microsoft Learn: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.6#switch-parameters)
#(2: Invoke-Command, Microsoft Learn:https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/invoke-command?view=powershell-7.4)
#(3: Export-Csv, Microsoft Learn: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/export-csv?view=powershell-7.6)
#(4: Flow Control, Microsoft Learn: https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/06-flow-control?view=powershell-7.6)
#(5: Get-Content, Microsoft Learn: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-7.6)