add-Type -AssemblyName System.Windows.Forms

$formObject = [System.Windows.Forms.Form]
$labelObject = [System.Windows.Forms.Label]
$buttonObject = [System.Windows.Forms.Button]

$textForm=New-Object $formObject
$textForm.ClientSize= '500,300'
$textForm.Text='Service Handler'
$textForm.BackColor="#ffffff"

$lbltitle=New-Object $labelObject
$lbltitle.Text='Service Handler'
$lbltitle.AutoSize=$true
$lbltitle.Location=New-Object System.Drawing.Point(20,20)


$knapp=New-Object $buttonObject
$knapp.Text='Hello'
$knapp.AutoSize=$true
$knapp.Location=New-Object System.Drawing.Point(195,150)

$textForm.Controls.AddRange(@($lbltitle,$knapp))


$selectedServices=New-Object -TypeName System.Collections.ArrayList
$selectedServices.AddRange(@('spooler','w32time')) | Get-Service
$selectedServices




 foreach( $service in $selectedServices) {
        
         if ($service.status) -eq 'Running' {
            Stop-Service ($($_)) Write-Output(($($_.DisplayName)))
         }
         else {
                
         }
         
         
}
        
    
    
Clear-Host








$knapp.Add_Click

#visar Formh
$textForm.ShowDialog()

#rensar Form
$textForm.Dispose() 

