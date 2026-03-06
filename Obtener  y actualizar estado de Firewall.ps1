#Ejecutar como administrador

Function Opciones-Principal{
Write-host "1.- Obtener estado"
Write-host "2.- Actualizar estado"
Write-host "3.- Salir"
}

Function Opciones-Update {
Write-Host "----------------------------------------"
Write-Host "Opciones:"
Write-Host "1-Todos los perfiles"
Write-Host "2-Domain"
Write-Host "3-Private"
Write-Host "4-Public"
Write-Host "5-Salir"
Write-Host "Seleccione la opción:"
Write-Host "----------------------------------------"
}

Function Opciones-ActivarDesactivar {
Write-host "1.- Activar"
Write-host "2.- Desactivar"
Write-host "3.- Salir"
}

Function Get-Perfil {
Write-Host "----------------------------------------"
Write-Host "Obteniendo estado de perfiles de Firewall"
Write-Host "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
Get-NetFirewallProfile | Select-Object name, enabled
Write-Host "----------------------------------------"
}

Function Activar-perfiles {
Clear-Host
Write-Host "----------------------------------------"
Write-Host "Actualizando estado de perfiles"
Set-NetFirewallProfile -enabled true
Write-Host "Cargando..."
Write-Host "Listo"
Get-Perfil
Write-Host "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
}

Function Desactivar-perfiles {
Clear-Host
Write-Host "----------------------------------------"
Write-Host "Actualizando estado de perfiles"
Set-NetFirewallProfile -enabled false
Write-Host "Cargando..."
Write-Host "Listo"
Write-Host "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
Get-Perfil
Write-Host "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
}

Function Activar-dominio {
    #Set-NetFirewallProfile -Profile dominio -Enabled True
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil dominio"
Write-Host "---------------------------------"
}

Function Desactivar-dominio {
    #Set-NetFirewallProfile -Profile dominio -Enabled False
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil dominio"
Write-Host "---------------------------------"
}

Function Activar-privado {
    #Set-NetFirewallProfile -Profile privado -Enabled True    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil privado"
Write-Host "---------------------------------"
}

Function Desactivar-privado {
    #Set-NetFirewallProfile -Profile privado -Enabled False    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil privado"
Write-Host "---------------------------------"
}

Function Activar-public {
    #Set-NetFirewallProfile -Profile public -Enabled True    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil public"
Write-Host "---------------------------------"
}

Function Desactivar-public {
    #Set-NetFirewallProfile -Profile public -Enabled False    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil public"
Write-Host "---------------------------------"
}

Function Menu-principal {
While (($valor = Read-Host "Selecionar opción") -ne "3")
  {
    switch ($valor)
        {
            1 {
                Clear-host
                Get-Perfil
                pause;
                break
              }
            2 {
                Clear-host
                Opciones-Update
                Menu-update
                pause;
                break
              }
            3 {
                "Salir"
                break
              }
            default 
                {
                Write-Host "Opción Invalido"
                }

        }
    Clear-host
    Opciones-principal
   }

}

Function Menu-update {

while (($valor_update = Read-Host "Selecionar opción") -ne "5")
    {
    switch ($valor_update)
        {
            1 {
                Opciones-ActivarDesactivar
                $valor_ActivarDesactivar = Read-Host "Selecionar opción:"
                if ($valor_ActivarDesactivar -eq "1")
                {
                 Activar-perfiles
                } elseif ($valor_ActivarDesactivar -eq "2") {
                 Desactivar-perfiles
                }
                else {
                 break
                }
                pause;
                break
            }
            2 {
                if (Get-NetFirewallProfile -Profile Domain |Where-Object {$_.Enabled -eq "True"})
                {
                 Activar-dominio
                } else {
                 Desactivar-dominio
                }
                pause;
                break
            }
            3 {
                if (Get-NetFirewallProfile -Profile Private | Where-Object {$_.Enabled -eq "True"})
                {
                 Activar-privado
                } else {
                 Desactivar-dominio
                }
                pause;
                break
            }
            4 {
                if (Get-NetFirewallProfile -Profile Public | Where-Object {$_.Enabled -eq "True"})
                {
                 Activar-public
                } else {
                 Desactivar-public
                }
                pause;
                break
            }
            5 {
                "Salir"
                break
            }
            default
                {
                Write-Host "Opción invalido"
                }

        }
    
    Opciones-Update

    }
}



Write-host "Iniciando..."
Opciones-Principal
Menu-principal
