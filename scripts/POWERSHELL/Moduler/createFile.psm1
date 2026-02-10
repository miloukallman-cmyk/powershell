function Set-UserWorkFolder {
    [CmdLetBinding()]
    param (
    #if -Create then 
    [Parameter()]
    [Switch]$Create,

    [Parameter()]
    [string]$User
    
    )
   
    # sök efter path och skapar om inte finns
    begin{
        
        $User=$env:USERNAME
        $folderName="WorkFolder"
        $pathStart ="C:\"
        $usersPath=Join-Path -Path $pathStart -ChildPath "Users"
       

    }
    # skapa mappar till Path
    process{
        
        
        if(-not(Test-Path $usersPath)){

            Write-Information("user path not found")



            #skapar mapp users
            if ($Create) {

                New-Item -Path $pathStart -Name "Users" -ItemType Directory
                $usersPath=Join-Path -Path $pathStart -ChildPath "Users"

                Write-Information("$usersPath has been created")
                $userResultat = $true
            }
        }else{
            Write-Information ("mappen finns redan")
            
        }

        #söker efter user i mappen users
        $userPath=Join-Path -Path $usersPath -ChildPath $User
        #skapar en user i mapp users
        if (-not(Test-Path $userPath)){
            Write-Information("mappen finns inte")
            if ($Create) {
                New-Item -Path $usersPath -Name $User -ItemType Directory
                $userPath=Join-Path -Path $usersPath -ChildPath $User

                Write-Information("$userPath has been created")
            }
            
        }else {
            Write-Information("mappen finns redan")
        }

        #söker efter workfolder i mappen user
        $workFolder=Join-Path -Path $userPath -ChildPath $folderName
        if (-not(Test-Path $workFolder)) {
            Write-Information ("WorkFolder finns inte")

            #skapar workfolder i user mappen
            if ($Create) {
               
                New-Item -Path $userPath -Name $folderName -ItemType Directory
                $workFolder=Join-Path -Path $userPath -ChildPath $folderName

                Write-Information ("$workFolder är skapad")
                $fileResultat = $true
            }
        }else {
            Write-Information ("WorkFolder finns redan")
            $fileResultat = $true
        }
    }

    end{
        return $workFolder
    }
    
}

function Get-UserFromCsv {
    [CmdletBinding()]
    param (
        
        [Parameter(Mandatory)]
        [string]$CsvPath,
        [Parameter(Mandatory)]
        [string]$Delimiter,
        [Parameter(Mandatory)]
        [hashtable]$UserInfo
    )
    
    $UserProperties = $UserInfo.GetEnumerator()
    $Properties=Foreach($Property in $UserProperties){
        @{Name=$Property.Value;Expression=[scriptblock]::Create("`$_.$($Property.Key)")}
    }
    Import-Csv -Path $CsvPath -Delimiter $Delimiter | Select-Object -Property $Properties
}
    


Export-ModuleMember -Function  Set-UserFolder, Get-UserFromCsv
# Break och returera error om $userResultat = false
# om Get-Info returerar $fileResultat=false  genom pipe Skapa en workfolder  retunera path
