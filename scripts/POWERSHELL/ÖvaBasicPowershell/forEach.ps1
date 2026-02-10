$filePath="C:\Users\milou.kallman\Documents\powershell\testFolders\testingFile.txt"
$folderpath= "C:\Users\milou.kallman\Documents\powershell\testFolders"

$folderNames=Get-Content -Path $filePath


$folderNames.ForEach(
    {
                if ((test-path -Path "$foldersPath\$_") -eq $false) {
            new-item -Path "$folderPath" -Name $_ -ItemType Directory
        }
        else {
            Write-Output "Folder exists"
        }
    }
)


for($i=0;$i -lt 10;$i++){
    Write-Output $i
}

$arrayTest=@('steve','John','Tim')

for ($i = 0; $i -lt $arrayTest.Count; $i++) {
    Write-Output
}

foreach($item in $arrayTest){
    Write-Output $item
}

while ($true) {
    
}