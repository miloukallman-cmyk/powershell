Clear-Host
$nextpage="#########################################################################################################################################"
$myDisk="slow ahh metod"

$myDisk.GetType()

$myarray=@("Val1","Val2","Val3")

$myarray

$myarray[3]

$myarray+="Val4" 



Read-Host "Tryck Enter för att fortsätta"
Clear-Host
$nextpage

""
"ArrayListor"
""
"alla variablar i koden som är skriven med $. skall inte skrivas med punkten i din kod."
"Punkten är där för att stoppa datorn från att byta ut namnet på variablen med värdet"
""
"koden under pilen visar de 2 sätt att skapa en ArrayLista på. $.Array2."
"De två olika metoderna för att skapa en ArrayLista ser anurlunda ut men skiljer sig bara i hastihet men helt lika i funtion."
"$.Array2 är snabbare men bara med en bråkdel, detta spelar bara roll i project med flera tusentals Arrays"
""
"||"
"vv"
"################################################################"
"$.Array1=[System.Collections.ArrayList]@()"
""
"$.Array2=New-Object -TypeName System.Collections.ArrayList"
"#################################################################"
"koden nedanför bekräftar att de två ArrayListorna är identiska"
"||"
"vv"
"#####################"
"$.Array1.GetType()
$.Array2.GetType()S"
"######################"

$Array1=[System.Collections.ArrayList]@()

$Array2=New-Object -TypeName System.Collections.ArrayList

$Array1.GetType()
$Array2.GetType()

Read-Host "Tryck Enter för att fortsätta"
Clear-Host
$nextpage

"fuktionen av [void] innan en array och hur datorn räknar."
""
"När en dator läser upp inhållet i ArrayListor så skriver den ut inhållet och plats i listan men inte som du tror"
"Datorn läser upp inhåll 1 2 3 och 4 här under men räcknar bara 0, 1 2."
"Det beror på 2 grejer det första är att datorn räknar första platsen med en nolla och fortsätter upp"
"Datorn läser upp inhåll 4 men inte platsen. Det sker för att [void] säger till datorn att inte räkna upp platsen"
"||"
"vv"



[void]$Array2.Add("inhåll 1")
[void]$Array2.AddRange(@("inhåll 2","inhåll 3"))
$Array2.Add("inhåll 4")

$Array2

"hur lägger man till och tar bort i sin array?"
"#############################################"
"1. $.Array namn.Remove()"
"2. $.Array namn.RemoveAt()"
"3. $.Array namn.RemoveRange()"
"4. $.Array namn.Add()"
"5. $.Array namn,AddRange()"
"#############################################"
"1=skriv inehållet du vill ta bort i parantesen"
"2=skriv numererade platsen på inehållet du vill ta bort i parantesen"
"3=skriv numererade platserna på inehållet du vill ta bort i parantesen med ett commatäcken mellan varje nummer"
"4=skriv in talet eller texten du vill lägga till mellan parantesen"
"4=skriv in talen eller text du vill lägga till mellan parantesen med ett comma täcken mellan varje tilägg"


Read-Host "Tryck Enter för att fortsätta till Hashtables & Custom Objects"
Clear-Host
$nextpage

"hashtables är en sökbar container"
"$.myHashTable kan sökas för variabler som kallas keys, dessa keys kan man lägga in med value och text"
"hashtable kan vara vilket namn så hälst så länge man har =@{
} efter"

".ContainsKey('') detta ger oss ett true eller false om keyn som söks efter finns eller ej "
".ContainsValue('')  detta get oss ett true eller false beroende på vilket nummer du skriver i och om hash inerhåller det"
""
""
""
""
$myHashTable=@{
    key1=100
    apple=2.34
    name='John Doe'
    key2=2
    key3=$true

}
$myHashTable.Add('MILOU','ADMIN')
$myHashTable.ContainsKey('key4')
$myHashTable

#####################################

$employee1=New-Object -TypeName PSCustomObject
    
    EmployeeID = Value
    FirstName = Milou
    Title = CEO


$employee1
$employee1=New-Object -TypeName PSCustomObject
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'EmployeeID' -Value '1001'
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'FirstName' -Value 'Milou'
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name  'Title' -Value 'CEO'
$employee1