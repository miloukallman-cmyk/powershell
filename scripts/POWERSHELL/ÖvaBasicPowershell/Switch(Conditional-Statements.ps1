$filePath="C:\Users\milou.kallman\Desktop\TestFile\NamnLista.txt"
$data=Get-Content -Path $filePath

$firstName=$data[0]


if ($firstName -eq 'Liam') {
    Write-Output "My name is Liam"
}elseif ($firstName -eq 'Jonatan') {
    Write-Output "My name is Jonatan"
}elseif ($firstName -eq 'Leo') {
    Write-Output "My name is Leo"
}elseif ($firstName -eq 'Melvin') {
    Write-Output "My name is Melvin"
}elseif ($firstName -eq 'Ned') {
    Write-Output "My name is Ned"
}elseif ($firstName -eq 'Huy') {
    Write-Output "My name is Huy"
}else {
   Write-Output "i dont know my name"
}







switch ($firstName) {
    "Liam"{
        Write-Output "My name is Liam"
    }
}