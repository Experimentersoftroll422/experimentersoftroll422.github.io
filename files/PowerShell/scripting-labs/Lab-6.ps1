class FireEmblem {
    #3 minimum data members
    [string]$Name
    [string]$Class
    [string]$Title
    [int[]]$Version
    [hashtable]$Growths

#Constructor 1
    FireEmblem([string]$Name, [string]$Class, [string]$Title) {
    $this.Name = $Name
    $this.Class = $Class
    $this.Title = $Title
    }



 #constructor 2
    FireEmblem([string]$Name, [hashtable]$Growths){
    $this.Name = $Name
    $this.Growths = $Growths
    
    }

#constructor 3 
FireEmblem([string]$Name, [int[]]$Version) {
    $this.Name = $Name 
    $this.Version = $Version
}


    #member function responsible for dislaying basic needed information of a unit
    [string] UnitSummary() {

        #1: (PowerShell FAQ Hashtables)
        return "$($this.Name) | $($this.Growths | Out-string)" 
    }


}

#hashtable for unit growths
$Growths = @{
    Attack = "70%"
    Defense = "30%"
    Skill = "90%"
    Luck = "20%"
    Speed = "80%"
    Resistance = "10%"
}

$q = [FireEmblem]::new("Riev", @(8))
$r =[FireEmblem]::new("Erika", $Growths)

#Erika's stats and general info
$r.Name
$r.Class
$r.Growths

#Riev's generation debut 
$q.Version
#------------------------------------------------------------------------------------------------
#Custom PSObject
#Custom Object

$GeneralMoonstone = [PSCustomObject]@{
    Name = "Valter"
    Class = "Wyvern Rider"
}




#SOURCES
#1: PowerShell FAQ Hashtables, Bijay Kumar, 14/07/26
