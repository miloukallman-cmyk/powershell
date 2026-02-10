
$creds=Get-Credential


Invoke-Command -ComputerName $ -Credential $creds -ScriptBlock{
    Write-Output "This is running on $($env:COMPUTERNAME)"
}
