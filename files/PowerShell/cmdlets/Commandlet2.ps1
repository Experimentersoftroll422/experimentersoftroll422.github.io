#(1: Sharepoint, Salaudeen Rajack, 2026/07/05)
# CmdletBinding is used transform a basic powershell function ---> Advanced Function (cmdlet)
# Difference between a function and native cmdlet <---- A part of the actual powershell engine 
# [CmdletBinding()]  Allows parameters  -Verbose, -Debug, -ErrorAction


# (2: YouTube, Lucas Ferdidnandes, 2026/07/05)
function VerboseTest {
    [CmdletBinding()]
    param()
    
 
    Write-Verbose "Testing, Testing, Testing"
    Write-Output "Regular Output"
}

VerboseTest -Verbose




#SOURCES

#(1: Sharepoint, Salaudeen Rajack, 2026/07/05:
#https://www.sharepointdiary.com/2023/01/what-is-cmdletbinding-in-powershell-functions.html
#)
#(2:YouTube, Lucas Ferdidnandes, 2026/07/05:
#https://www.youtube.com/watch?v=0aqzJqJbPoQ)