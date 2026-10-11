<#
    COURSE: COMP66-OS Scripting
    AUTHOR: Ziad Ewais, Luc Vaillancourt
    LAB: 8 - File System Scripting
    STUDENT NAME: Rizwan Anver
#>

<#

    Please write your name in the above section beside 'STUDENT NAME'.
    Please write your code where indicated.
    Submission is through BlackBoard -> Assignments. Upload your file where indicated by the lab number.
    Always open PowerShell as an Administrator.
    *If you will use VS Code for this course, make sure to run VS Code as Administrator as well*
    **Please comment your code to indicate what your code does**
    Enjoy!
#>

<########################################################## LAB 6 ########################################################>

<#
    Task 8-1: Sort-Filenames
    - The script should accept a path to a folder as an input (use the provided sample data folder)

    - The script should sort each users .txt file into folders, 
    first by their birth year and then by the first letter of their last name (information is in the file name)

    - After the script has completed running, 

#>
#Steps to solve:

#(Microsoft Learn)
# Testing out some code: Resolve-Path  -LiteralPath 'C:\COMP66\Labs\Lab-8SampleData\Sample Data'

#1- Input param is the file path
param (

    [string]$FilePath = "C:\COMP66\Labs\Lab-8SampleData\Sample Data"
)

#2- Use Resolve-Path to get the path of each file as a string array
# I was kinda confused on why you should use resolve-path cmdlet since it's sued to display the path contents
# Logically I assumed the Get-ChildItem cmdlet would be perfect in this case for getting the contents
$files = Get-ChildItem -Path $FilePath 

#3- Iterate through the filenames array using a foreach loop
# The regEx searches for a name, Initial, and a year
#It then sorts it into groups and outputs it 
foreach($file in $files) {

    if($file -match '([A-Z][a-z]+)_([A-Z]?)_(\d{4})') {
      $FirstName = $Matches[1] 
      $LastName = $Matches[2]
      $Year = $Matches[3]
    }

    Write-Output "FN: $FirstName | Initial: $LastName | Date: $Year"
}

$Matches.FirstName
#### Next steps are inside the above foreach loop ####
#4- Match for the file name to parse the firstname, last initial, year
    

#5- Create a new folder for each year (silent continue errors of duplication)
    
 $ErrorActionPreference = "SilentlyContinue" #Helps create folder without running into nay pwrshell errors
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data" -Name 1992 -ItemType Directory
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data" -Name 1993 -ItemType Directory
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data" -Name 1994 -ItemType Directory

#6- Create a new folder inside the year folder with the first inital of firstname
#1992 Folder
 New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992" -Name 'B' -ItemType Directory
 New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992" -Name 'H' -ItemType Directory
 New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992" -Name 'T' -ItemType Directory
 New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992" -Name 'S' -ItemType Directory
 New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992" -Name 'W' -ItemType Directory

 #1993 Folder
 New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1993" -Name 'T' -ItemType Directory
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1993" -Name 'F' -ItemType Directory
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1993" -Name 'B' -ItemType Directory

#1994 Folder
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994" -Name 'C' -ItemType Directory
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994" -Name 'A' -ItemType DirectoryData
New-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994" -Name 'P' -ItemType Directory



#7- Move the file to the correct folder using structure (Sample Data\Year\First Initial)
#Moving the 1992 people

Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Girard_B_1992.txt" -Destination  "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992\'B'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Jester_H_1992.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992\'H'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Langsten_S_1992.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992\'S'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Renardo_T_1992.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992\'T'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Singh_H_1992.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992\'H'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Singh_W_1992.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1992\'W'"

#Moving the 1993 people 

Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Savlador_F_1993.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1993\'F'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Waldo_T_1993.txt" -Destination  "C:\COMP66\Labs\Lab-8SampleData\Sample Data\3\'T'"
Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Willard_B_1993.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1993\'B'"


#Moving the 1994 people 

    Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Allen_C_1994.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994\'C'"
    Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Pollok_A_1994.txt" -Destination  "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994\'A'"
    Move-Item -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\Zedberg_P_1994.txt" -Destination "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994\'P'"



#Just verifying if it actually moved
Get-ChildItem -Path "C:\COMP66\Labs\Lab-8SampleData\Sample Data\1994\'C'"

