#Läs av Kunder.txt och Kund Order nummer och Datum och skapa en costom class med alla värden
#Lös av Ordrar.txt och lägg till Order samt värde på order i samma klass
$orderFil="C:\Users\milou.kallman\Documents\powershell\testFolders\KundLista\Ordrar.txt"
$orderData=Get-Content $orderFil
$kundFil="C:\Users\milou.kallman\Documents\powershell\testFolders\KundLista\Kunder.txt"
$kundData=Get-content -Path $kundFil




#skapar array
$kundHistorik=New-Object -TypeName System.Collections.ArrayList
$kund=$null


foreach($rad in $kundData){
    if( $rad -match "Kund: (.+)" ){
        
        $kund=[PSCustomObject]@{
            Rad=$kundHistorik.Count +1

            Kund_Namn=$matches[1] 

            Order_Nummer=$null

            Datum=$null      
        } 
        $kundHistorik+=$kund

    }elseif ($rad -match "Order nummer: (.+)") {
        $kund.Order_Nummer=$matches[1]
        
    }elseif ($rad -match "Datum: (.+)") {
        $kund.Datum=$matches[1]
        
    }  

} 

$orderDetaljer=New-Object -TypeName System.Collections.ArrayList
$order=$null

foreach($rad in $orderData){
    if ($rad -match "Order nummer:(.+)") {
        $order=[PSCustomObject]@{
            Order_Nummer=$matches[1]
            Order=$null
            Värde=$null
        }
        $orderDetaljer+=$order    
    } elseif ($rad -match "Order:(.+)") {

        $order.Order=$matches[1]

    } elseif ($rad -match "pris:(.+)") {

        $order.Värde=$matches[1]
    
    }
}

Clear-Host
$kundHistorik | Format-Table -AutoSize
write-Output("#########################################")
""
write-Output("Hantera Order")
""
$hostInput=Read-Host "ange datum xx/xx/xx, ange rad , ange kundnamn xxxxx-xxxx , ange order nummer xxxxxxx"
$hostInput='25/04/06'
 #sök med rad
if ( $hostInput -match $kundHistorik.Datum.IndexOf( $hostInput) ) {                                 
    $kundHistorik[$hostInput-1]
   foreach( $datum in $kundHistorik.Datum){  

    }
   #sök med datum
  elseif ($hostInput-1 -le $orderDetaljer.Count) {                               
    $orderDetaljer[$hostInput-1]  
  }
}


    

