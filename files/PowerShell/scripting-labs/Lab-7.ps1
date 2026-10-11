#Group matching
#Task: Thoroughly comment and be able to explain the following code. 

"New user:COMP\administrator" -match "(\s.+:)(?<domain>.+)(\\)(?<user>.+$)"




"New user:"  -match "(\s.+:)"

#(1: Microsoft Learn, 24/07/2026)
#Comparing "New user:COMP\administrator" to "(\s.+:)(?<domain>.+)(\\)(?<user>.+$)"
#Key to understanding this is to fully breakdown the RegEx from left to right 
#On the right, we have three group of RegEx encased in ()
#Let's start off with the first chunk
#Within the (), we've got \s which matches any whitespace characters (a space after a character)
# \s = New (space)
# . = match any character except /n 
# + = one or more times so .+: = match any character one or more times which is user:

"COMP" -match "(?<domain>.+)"

#? = one matches or more 
#According the Microsoft Documentation, <domain> is just a placeholder for COMP
#.+ = match any character one or more times

"\" -match "(\\)"

#\\ makes it so that \ after COMP is treated as a literal slash as opposed to it's RegEx function (escape)

"administrator" -match "(?<user>.+$)"
# ? = one match or more
#<user> = a placeholder for user
#.+ = match any character or more
# $ = denotes the end of a string which checks out



$Matches

$Matches.domain

$Matches.user



#Getting username from email address

#hastable full of email addresses

$Addresses = @(

  "epresley@sl.on.ca",

  ".mendes@sl.on.ca",

  "bpitt@sl.on.ca",

  "gclooney@sl.on.ca",

  "mdamon@sl.on.ca"

  )

#For each loop responsible for taking each email address in the hashtable and comparing it if it matches
#In order for it to come as true, the beginning of the string needs to be alpha-numeric character
#Just to prove my point, I purposely added a non-alpha numeric character on line 55 to make pwrshell return false


foreach($Address in $Addresses){

  $Address -match "^(\w+)"

  $Matches[0]

}


#Hastable values for users stored in $usernames
$Usernames = @(

  "comp66\user1",

  "comp66\user2",

  "comp66\user3",

  "comp66\user4"

)


#for each loop used to match conditions 
#if the name contains anything other than \'s, and need to have an alpha-numeric character
#+ means to match one or more times with $ denoting end of string 

foreach($User in $Usernames){

  $User -match "[^\\]\w+$"

  $Matches[0]

}




#hashtable used to store phone numbers in $Phones

$Phones = @("613-666-8899","6136668899","613.666.8899","613 666 8899")

#for each loop used to match conditions 
#\d matches a single digit
#{} is a qunatifier that is used to tell us how many entries must be present
#In this case, there must be 3 digits 
#Every instance of the ? makes it so that it will previous element 0 or 1 time
#\d{3}? <--- match {3} again but remember that it can also be zero which is why it doesn't apply for {4} 

foreach($Phone in $Phones){

  $Phone -match "\d{3}?\d{3}?\d{4}?"

}



#hastable used to store IP addresses in  $IPs

$IPs = @("10.105.66.102","10.106.66.102","10.105.222.1","192.105.66.102")

#for each loop used to match conditions 
#So first we are looking for any instances that do not contain 10
#* makes it so that previous condition can be ran or ignored 
#\ turns off the special properities of the . meaning we're looking for one literally
#Once again we are looking for instances that do not contain 105
#* makes it so that previous condition can be ran or ignored 
#\ turns off the special properities of the . meaning we're looking for one literally

foreach($IP in $IPs){

  $IP -match "[^10]*\.[^105]*\."

}


#SOURCE:
#(1: Microsoft Learn, 24/07/2026: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_regular_expressions?view=powershell-7.6)
