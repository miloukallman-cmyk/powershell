

# properties
Import-Csv -Path "c:\Users\milou.kallman\Desktop\Project\info.csv" -Delimiter "," | Select-Object -Property `
@{Name="EmployeeID"; Expression={$_.UserID}}, 
@{Name= "GivenName"; Expression={$_.FirstName}} , 
@{Name= "SurName"; Expression={$_.LastName}} ,
@{Name= "Title"; Expression={$_.Title}} ,
@{Name= "City"; Expression={$_.City}} ,
@{Name= "PhisicalDeliveryOfficeName"; Expression={$_.School}} 



#   Name:      Value:
$UserInfo =@{
    UserID = "EmployeeID"
    FirstName = "GivenName"
    LastName = "SurName"
    Title = "Title"
    School = "PhysicalDeliveryOfficeName"
    City = "City"
}




$UserProperties = $UserInfo.GetEnumerator()
$Properties=Foreach($Property in $UserProperties){
    @{Name=$Property.Value;Expression=[scriptblock]::Create("`$_.$($Property.Key)")}
}

Import-Csv -Path "c:\Users\milou.kallman\Desktop\Project\info.csv" -Delimiter "," | Select-Object -Property $Properties

Import-Csv -Path "c:\Users\milou.kallman\Desktop\Project\info.csv" -Delimiter "," | Where-Object{
    $_.Title -eq "IT"
} | Select-Object -Property $Properties




Remove-Module Configurations -Force -ErrorAction SilentlyContinue

Import-Module "C:\Users\milou.kallman\Documents\powershell\Configurations\createFile.psm1" -Force
Get-InstalledModule
Get-Module
Get-UserFromCsv -CsvPath "C:\Users\milou.kallman\Documents\powershell\scripts\info.csv" -Delimiter "," -UserInfo $UserInfo

