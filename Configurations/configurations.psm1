
 
# NOTES/IMPROVMENTS:
# Lägg till system för arrays av match istället för 1,2,3,4......
# Lägg till en option att ändra -match till att inte söka case sensitive unclusive mellanslag med trim() och ^
#

# LÄRTA:
#($resultatLista = New-Object -TypeName System.Collections.ArrayList) brukar vara snabbare än $resultatLista = @() men i detta sammanhanget blir det ett undantag,
#New-Object -TypeName System.Collections.ArrayList) .net är en snabbare array men den skapar en ny array för varje $resultatLista += $resultat vilket $resultatLista = @() inte gör, detta var inte vad jag har förväntat mig.






function Get-filter_data{
   
    [CmdLetBinding()]
    param (
        
        [Parameter(Mandatory)]
        [string]$filePath,
       
        [Parameter(Mandatory)]
        [string]$match1,
        
        [Parameter(Mandatory)]
        [string]$match2,
        
        [Parameter(Mandatory)]
        [string]$match3
    )

    # BEGIN: laddar in variabler
    begin {
        $resultatLista = @()
        $resultat = $null
        $fileData=Get-Content -Path $filePath
    }

    
    process{

        foreach ($row in $fileData) {
            
            if ($row -match "$match1(.+)") {
                $resultat = [PSCustomObject]@{
                        Grupp = $resultatLista.Count +1
                        ($match1)          = $Matches[1]
                        ($match2)          = $null
                        ($match3)          = $null
                }
                $resultatLista += $resultat
            }
            
            elseif ($row -match "$match2(.+)") {

                $resultat.($match2) = $Matches[1]

            }   elseif ($row -match "$match3(.+)") {

                $resultat.($match3) = $Matches[1]
                

            }    
        }
    }
    end {
    return $resultatLista
}    
    
}
 



function Set-filterToTxt {
    [CmdLetBinding()]
    param (
    # Parameter help description
    [Parameter(Mandatory,ValueFromPipeLine)]
    [array[]]$filterOut,

    # path till mappen som du vill ha resultat.txt i
    [Parameter(Mandatory)]
    [string]$outputFolder,

    [Parameter(Mandatory)]
    [string]$txtName,

    
    [Parameter()]
    [switch]$getDate,

    # switchar från false till true om -bytUt står efter funktionens namn
    [Parameter()]
    [switch]$replace
    )

    #definera basNamn
    # join path med outputfolder och basNamn för att få filepath
    begin{
        
       
        # 1 tim 40 min mistag
        # Pipeline sickar 1 value i taget inte hela arrayn som jag trodde.
        $inputSave = @()

        $finalName = $txtName
        
        $inputSave += $filterOut
        if ($getDate -eq $true) {
            $YMD = Get-Date -Format "yyyy-MM-dd"
            $finalName = "$YMD-$finalName"
            
        }
       

       
        
        $txtFilePath=Join-Path -Path "$outputFolder\" -ChildPath "$finalName.txt"
          
    }

    
   
    process{

          
        
            if ((Test-Path -Path $txtFilePath) -eq $false) {
                    New-Item -Path $outputFolder -ChildPath "$finalName.txt" -Type File
                    
                    foreach($row in $inputSave){
                        Add-Content -Path $txtFilePath -Value $row
                    }
                
            } else {
                
                foreach($row in $inputSave){
                    Add-Content -Path $txtFilePath -Value $object
                }
            }
        
    }
    end {
        return $txtFilePath
    }   

}


