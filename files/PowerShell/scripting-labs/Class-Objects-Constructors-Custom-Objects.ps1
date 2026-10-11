class USA{
    #Properties that every USA will have
  [string]$State #data members
  [string]$City  #data members


#Constructor for the USA class, runs whenever a create a new USA object
#has two parameters
  USA([string]$State, [string]$City) {
    $this.State = $State
    $this.City = $City
    
  }

#This is a member function also called a method
#It is a funciton inside of the class that belongs to an object and allows it to operate
#on the object's data
#[ReturnType] MethodName() { ... }
  [string] Location() {

    #Format is important 
    return "$($this.State),$($this.City)"
  }
}

#[USA]: :new() ---> calls  the constructor of the USA class
#"NYC" passed into $State and New York" into $City
#$r is the variable that stores the new object. This can be anything you want it to be 

$r = [USA]::new("NY", "New York City")

$r.State
$r.City
$r.Location()



#------------------------------------------------------------------------------------------------------------------------------------
# A PS Custom-Object can be created without a class, note this is the exact same process
#Except without creating a class

function Get-USA {
    param(
        [string]$State,
        [string]$City
    )
#PS Custom-Object, at it's core functions the same as a constructor 
#But a constructor has many functions and purposes that a Custom-Object doesn't
#You can think of a Custom-Object as a quick and easy object
    [PSCustomObject]@{
        State = $State
        City  = $City
    }
}

$r = Get-USA -State "NY" -City "New York City"
$r.State
$r.City
#--------------------------------------------------------------------------------------------------------------------------
#HASHTABLES
#This is a simple hashtable, it is a collection of key value pairs

$person = @{
    Name = "Rizwan"
    Age  = 30
    City = "Kingston"
}

#To access a key in the table you write the name of the hashtable along with the key:
$person.Name
$person.Age
$person.City

#Adds a key value pair
$person.Country = "Canada"

#Change value of a pair 
$person.Age = 31

#Removing a key from the hashtable
$person.Remove("City")




$regPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$software = $regPaths | ForEach-Object {
    Get-ItemProperty -Path $_ -ErrorAction SilentlyContinue
} | Where-Object { $_.DisplayName } |
    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
    Sort-Object DisplayName -Unique

  $software