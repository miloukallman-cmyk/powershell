Remove-Module Configurations -Force -ErrorAction SilentlyContinue
Export-ModuleMember -Function  Get-filter_data, Set-filterToTxt
New-ModuleManifest `
  -Path "C:\Users\milou.kallman\Documents\powershell\Configurations\configurations.psd1" `
  -RootModule "configurations.psm1" `
  -Author "Milou" `
  -Description "config modul" `
  -ModuleVersion "1.0.4"
`
#load Module
Get-InstalledModule

Import-Module "C:\Users\milou.kallman\Documents\powershell\Configurations" -Force

$resultatLista = Get-filter_data `
  -filePath "C:\Users\milou.kallman\Documents\powershell\KundLista\Ordrar.txt" `
  -match1 "Order nummer:" `
  -match2 "Order:" `
  -match3 "Pris:"
  $resultatLista

$resultatLista|Set-filterToTxt `
 -outputFolder "C:\Users\milou.kallman\Documents\powershell\Outputs" `
 -txtName "resultat"`
 -getDate


#försöker göra comma seperated values


#fråga elliot hur man skapar och importerar in data

#fråga elliot varför remote.ps1 inte fungerar




Remove-Module Configurations -Force -ErrorAction SilentlyContinue
New-ModuleManifest `
  -Path "C:\Users\milou.kallman\Documents\powershell\Configurations\createFile.psd1" `
  -RootModule "createFile.psm1" `
  -Author "Milou" `
  -Description "config modul" `
  -ModuleVersion "1.0.4"




Import-Module "C:\Users\milou.kallman\Documents\powershell\Configurations\createFile.psm1" -Force
Get-InstalledModule
Get-Module

Set-UserFolder -Create -InformationAction

