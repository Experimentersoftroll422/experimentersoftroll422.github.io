#GetPS-Drive commandlet

#(1: Powershell FAQs, Bijay Kumar, 20/07/2026)
#GetPS-Drive commandlet allows you to list off all of the current drivers 
#Includes: File System Drives, Registry Drives, & Certificate Stores


#(Packt, YouTube, 20/07/26)
#We first need to understand the difference between a PS-Drive and a PS-Provider 
#A powershell provider is used to get access to data on your system 
#It is used to help nagivate, access, or edit a data store
#(Data Store: Essentially data can a power shell provider can dig up for you) 

#A PS-Drive provides the entry point/doorway into these data stores which
#uses powershell providers as the standard logic for it

#PS-Driver ---->  holds data stores ----> PS-Provider helps nagivate, edit, and the define the logic 
# PS-Drive ----> Data stores ---> PS-Providers

Get-PSdrive

#The name column = all existing drives
#Root column = location of the drive

#2 Capabillities of the FileSystem provider
#Each provider has different capabillities, run PSprovider to get an idea
Get-PSprovider

#(1: Powershell FAQs, Bijay Kumar, 20/07/2026)
#(3:  PowershellFAQs, Bijay Kumar, 20/07/2026)
#(5: CodeLucky, 20/07/2026)

#Filter Capabillity:

#The filter parameter can be used to narrow down results that powershell gives:
#In this case, it is used to list all .ps1 results in the specified path
#Just to clarify, we are filtering at the provider level since the C:\ & -Filter
#are linked to Filesystem provider

Get-ChildItem -path "C:\COMP66\Commands" -Filter "*.ps1"

#(4: Microsoft Learn, 20/07/2026)

#Credential Capabillity:

#This is going to be a bit theoretical since the powershell's filesytem provider for
#credential  is used to authentic remote paths. If you were to use it on a local path
#credetial is ignored. 

#Get-Credential cmdlet creates a unsername and stores a password
$cred = Get-Credential 

#Theorectically speaking, if the -root path was a remote one, I would be creating a new PSDrive 
#that is stored in this -root path w/ FileSystem provider. This provider uses the credential capabillity
#to authenticate using $cred 

New-PSDrive -Name "S" -Root "\\Server\Scripts" -PSProvider "FileSystem" -Credential $cred
#Note since this is theorectical, the path is fake hence why a network error is thrown 


#SOURCES:
#(1:PowershellFAQs, Bijay , 20/07/2026: https://powershellfaqs.com/powershell-get-childitem-filter/)
#(2:Packt, YouTube, 20/07/2026: https://www.youtube.com/watch?v=K5UaDc6dMzo&t=11s)
#(3:PowershellFAQs, Bijay Kumar, 20/07/2026: https://powershellfaqs.com/list-drives-in-powershell/)
#(4:Microsoft Learn,  20/07/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-psdrive?view=powershell-7.6)
#(5: CodeLucky, 20/07/2026: https://codelucky.com/powershell-providers/)



