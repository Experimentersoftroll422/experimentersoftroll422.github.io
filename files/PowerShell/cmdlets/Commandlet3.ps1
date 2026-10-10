#A RegEx is a pattern used to match text (1:Micrsoft Learn, Microsoft 12/07/26)
#[] () * in terms of RegEx
#Belong to the metacharacter category
#To a find a match for a RegEx(RegEx pattern was able to find text that matched the pattern)

(2: Generalist Programmer)
#[] are used to create a character class which matches exactly one character from a set
#So essentially whatever you put within these [], RegEx will take each character from whatever text
#and compare it to the class. If there is a match, RegEx will return them.
#It's important to note that when RegEx individually compares each character to the class
#Rather than taking the entire word itself (Checks if a is in this class --->   if b is in the class ---> etc..
#CNTRL +   F    Example 1, Notice how RegEx gave all of instances containing a b and c


(3: RegEx Roo)
#() are used to match a  precise sequence of characters, so in the exact order you typed it in
#Notice how only results in the cat sequence occured. 


#  * are used to match the previous element zero or more times
# In simple terms the element before me can exist in any number or not at all
# For instance, matching words that are the same but have minor spelling differences like colouuur color and colour
#colou*r
#By using the *, we can match both of these spelling, 2 birds in one stone!


SOURCES:
#1: Microsoft Learn, Microsoft, 12/07/2026:https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_regular_expressions?view=powershell-7.6
#2: Generalist Programmer, 12/07/2026:https://generalistprogrammer.com/tutorials/regular-expressions-regex-complete-guide?
 #3: RegEx Roo, 12/07/26:https://www.regexroo.com/asterisk)
