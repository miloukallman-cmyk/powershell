$c = Get-Credential
$HostingPC=$env:COMPUTERNAME
$program="resultat.txt"

Invoke-Command -ComputerName $HostingPC -Credential $c {
    $env:COMPUTERNAME
    if ($HostingPC -eq $env:COMPUTERNAME){
        Write-Verbose("Invoke command was unsuccesful cannot invoke command to Hostpc.")
        break
    }else {
        Write-Verbose("succesfuly connected to computer: $env:COMPUTERNAME")
        $pathP=$env:CommonProgramFiles
        $contetnPath=Join-Path -Path $pathP -ChildPath $program
        Set-Content -Path $contetnPath

       
    }
    

}




Invoke-Command -ComputerName 8CG3221YLT -Credential $c {

    $env:COMPUTERNAME

}
