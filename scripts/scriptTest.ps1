
$HostingPC=$env:COMPUTERNAME
$program="resultat.txt"
$env:COMPUTERNAME


#if ( $HostingPC -eq $env:COMPUTERNAME){
    #Write-Verbose -Message "Invoke command was unsuccesful cannot invoke command to Hostpc." -Verbose
    #break
#}else {

    Write-Verbose -Message "succesfuly connected to computer: $env:COMPUTERNAME" -Verbose
    $pathP="C:\Users\milou.kallman\Documents\powershell\Output"
    $contetnPath = Join-Path -Path $pathP -ChildPath $program

    if(-not(Test-Path $contetnPath)){
        New-Item -Path $pathP -Name $program -ItemType File
    }
        

    #}
    

