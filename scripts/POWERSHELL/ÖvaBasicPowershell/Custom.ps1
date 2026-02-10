$exampleOutput=
"||
vv"
$exampleOutput


$employee1=New-Object -TypeName PSCustomObject
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'EmployeeID' -Value '1001'
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'FirstName' -Value 'Milou'
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name  'Title' -Value 'CEO'

$employee1

"###########################################################################################################################################"
'PipeLines Är ett sätt att ta och sicka information och istruktioner for olika inbyggda funktioner i powershell windows som kallas Services'
'Service har massa olika funktioner, alltifrån tid och datum till internet, windows firewall och data.'
'Get-service gör en lista på alla services samt status running eller stopped med en kort beskriving på vad servicen gör.'
'här under pilen visar jag hur man runnar get service'
'###########################################################################################################################################'
'||'
'vv'
''
'#############################'
'Get-Service'
'#############################'
''
''
'detta kommer att outputta varenda Service som finns i Powershell och delas up fint på tre rader.'
'Exempel'
'||'
'vv'
'################################################################################'
'Status   Name               DisplayName'
'------   ----               ------------'
'Running  AdobeARMservice    Adobe Acrobat Update Service'
'Stopped  ADPSvc             Tjänst för aggregerad dataplattform'
''
'detta fortsätter i 300 rader till'
'running Get-service below this line'
'################################################################################'
Get-Service
''
'#########################################################################################################'
'Detta är oftast för mycket text för att hitta servicen du letar efter'
'därför har Powershell gjort ett commando som låter oss söka efter services som inerhåller ett substantiv'
'Så här söker man efter alla services med x namn, '
'I detta exemplet så kommer vi att söka för alla funktioner med ordet Disk i namnet'
''
'-Name vilket är skrivet efter Get-Help säger bara att vi söker efter services med ett Namn x'
'Vi kan söka efter services på andra sätt inte bara namn. man kan byta ut -Name med andra ord'
'-Status går att söka efter program som är running eller stopped'
''
'#########################################################################################################'
'||'
'vv'
'Get-Help -Name "Disk"'
''
'running Get-Help -name "disk" below this line'
'##########################################################################################################'
 Get-Help -Name "Disk"  
'#########################################################################################################'
''
''
'############################################################################################################'
'Services går att göra till variabler och rekomenderas om man ska andvända en service mer än en gång i koden.'
'till exempel'
''
'$serviceName="spooler"'
'Get-Service -Name $serviceName'
''
'running Get-Service -Name $serviceName below this line'
'###########################################################'
 $ServiceName="spooler"
 Get-Service -Name $ServiceName
'############################################################################################################'
''
'Pipelines send information between services and commands and inputs it depending on if it allows pipelineing'
'Get-Help Get-Service -Full will tell you if services accept  '

Get-Help Get-Service -Full
'#################################################################################################################'
''
''
''
'##################################################################################################################################################################'
# här skapar jag $services, en ny variabel jag sedan gör till en Array
# nästa rad så addar jag två stycken namn, Dessa är namn på services
# på den tredje raden så sickas Arrayn med strings till Get-Service med en pipeline som sedan outputtar de två services till Start-Service vilket startar dem båda
# på fjärde raden verkar komplex men allt vi gör är de förljande
¨
# 1. $service | Get-Service. vi tar arrayn av service namn och ber om service datan vilket är namn och statur och outputar det i nästa pipe.

# 2.  Get-Service | ForEach-Object. output av Get-service är nu i ForEach-Object
# For-Each-Object utför en instruktion för varje object i Arrayn¨

# 3. instruktionen är för varje object i arrayn skriv ut "service" + display namn som get-service outputar + "is currently" + value av status

$services=New-Object -TypeName System.Collections.ArrayList
$services.AddRange(@('spooler','w32time'))

$services | Get-Service | Start-Service
$services | Get-Service | ForEach-Object {Write-Output "service$($_.displayname) is currently $($_.Status)"}


