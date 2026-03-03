#Obtener estado de Firewall
Write-Output "Estados de perfiles"
Get-NetFirewallProfile | Select-Object name, enabled
Write-Output "+++++++++++++++++++++++"
#Preguntar de cual perfil quiere cambiar su estado
Write-Output "1-Domain"
Write-Output "2-Private"
Write-Output "3-Public"
Write-Output "4-Salir"
$valor_perfil = Read-Host "Seleccione el perfil que quiere actualizar su estado"
switch ($valor_perfil){
"1" {"Domain"}
"2" {"Private"}
"3" {"Public"}
"4" {"Atras"}


Default {"Ninguna opcion"}
}





#Get-NetFirewallRule | Select-Object name, enabled

