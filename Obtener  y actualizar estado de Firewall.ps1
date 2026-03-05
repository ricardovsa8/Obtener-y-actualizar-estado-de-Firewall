
Function Get-menu{
Write-host "1.- Obtener estado"
Write-host "2.- Actualizar estado"
Write-host "3.- Salir"
}

Function Get-obtener {
Write-Host "---------------------------------"
Write-Host "Obteniendo estado de perfiles de Firewall"
Write-Host "---------------------------------"
Get-NetFirewallProfile | Select-Object name, enabled
Write-Host "---------------------------------"
}

Function Get-menu-actualizar {
Write-Host "---------------------------------"
Write-Host "Opciones:"
Write-Host "1-Todos los perfiles"
Write-Host "2-Domain"
Write-Host "3-Private"
Write-Host "4-Public"
Write-Host "5-Salir"
Write-Host "Seleccione la opción:"
Write-Host "---------------------------------"
}

Function Get-activar-perfiles {
    #Set-NetFirewallProfile -enable true
Clear-Host
Write-Host "---------------------------------"
Write-Host "Actualizando estado de perfiles"
Write-Host "Activando todos los perfiles..."
Write-Host "OK-Estado de perfiles actualizado"
Write-Host "---------------------------------"
Get-obtener
Write-Host "---------------------------------"
}

Function Get-desactivar-perfiles {
    #Set-NetFirewallProfile -enable false
Write-Host "---------------------------------"
Write-Host "Actualizando estado de perfiles"
Write-Host "---------------------------------"
}

Function Get-activar-dominio {
    #Set-NetFirewallProfile -Profile dominio -Enabled True
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil dominio"
Write-Host "---------------------------------"
}

Function Get-desactivar-dominio {
    #Set-NetFirewallProfile -Profile dominio -Enabled False
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil dominio"
Write-Host "---------------------------------"
}

Function Get-activar-privado {
    #Set-NetFirewallProfile -Profile privado -Enabled True    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil privado"
Write-Host "---------------------------------"
}

Function Get-desactivar-privado {
    #Set-NetFirewallProfile -Profile privado -Enabled False    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil privado"
Write-Host "---------------------------------"
}

Function Get-activar-public {
    #Set-NetFirewallProfile -Profile public -Enabled True    
Write-Host "---------------------------------"
Write-Host "Actualizando estado del perfil public"
Write-Host "---------------------------------"
}

Function Get-desactivar-public {
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
                Get-obtener
                pause;
                break
              }
            2 {
                Clear-host
                Get-menu-actualizar
                Get-Menu-update
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
    Get-menu
   }

}

Function Get-Menu-update {

while (($valor_update = Read-Host "Selecionar opción") -ne "5")
    {
    switch ($valor_update)
        {
            1 {
                if (Get-NetFirewallProfile |Where-Object {$_.Enabled -eq "True"})
                {
                 Get-activar-perfiles
                } else {
                 Get-desactivar-perfiles
                }
                pause;
                break
            }
            2 {
                if (Get-NetFirewallProfile -Profile Domain |Where-Object {$_.Enabled -eq "True"})
                {
                 Get-activar-dominio
                } else {
                 Get-desactivar-dominio
                }
                pause;
                break
            }
            3 {
                if (Get-NetFirewallProfile -Profile Private | Where-Object {$_.Enabled -eq "True"})
                {
                 Get-activar-privado
                } else {
                 Get-desactivar-dominio
                }
                pause;
                break
            }
            4 {
                if (Get-NetFirewallProfile -Profile Public | Where-Object {$_.Enabled -eq "True"})
                {
                 Get-activar-public
                } else {
                 Get-desactivar-public
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
    
    Get-menu-actualizar

    }
}


Write-host "Iniciando..."
Get-menu
Menu-principal
