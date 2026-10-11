#Figuring out how to compile all of the software
#Apparantly it lies within windows registry under two seperate categories, 32 & 64 bit software 
function InventoryGen {
    #Advance Function for switch parameter
    [CmdletBinding()]
    Param (
        [switch]$HTML

    )
#runs atleast once in the beginning
    begin {

    if($HTML) {
      #HTML conversion 
    } else {
        #stays CVS
    }
  }

    process {
 #software variable stores the two registry paths that contain all software
$software = @(
#64 bit software
"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
#32 bit software
"HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
) 
#report variable takes the registry paths and sends them through the ForEachObject cmdlet which allows us to pipe through 
#each registry path individually through the $_ variable. GetItemProperty gets the contents. ErrorAction SilentlyContinue
#is required in almost all instances since we don't want the script failing over a bugged . whereobject used to filter for 
#actual software name, piped by selectobject to display the software name, software version, publisher, and installation date


$report = $software | ForEach-Object {
    Get-ItemProperty -Path $_ -ErrorAction SilentlyContinue 

} | Where-Object DisplayName | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
Sort-Object DisplayName -Unique

$report

 }

 $report | Export-Csv -Path .\report.csv -NoTypeInformation

 end {
  
    }

}
   
$cred = Get-Credential -UserName "admin"
Enter-PSSession -ComputerName 192.168.192.129 -Credential $cred


$computer = $env:COMPUTERNAME

Get-WmiObject -Class Win32_Product | Select-Object  @{Name="ComputerName"; Expression={$computer}}, @{Name="Name"; Expression={$_.Name}}, @{Name="Vendor"; Expression={$_.Vendor}}, @{Name="Version"; Expression={$_.Version}}, @{Name="InstallDate"; Expression={$_.InstallDate}}

