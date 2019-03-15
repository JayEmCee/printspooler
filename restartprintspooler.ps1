#Stop the service: 
$Spooler = Get-WmiObject -Class Win32_Service -Filter 'name="spooler"'
if ($Spooler.State -eq �Running�){
    write-host "Spooler is running, stopping service" -NoNewline
    net stop '"print spooler"'
    Remove-Item -Path $env:windir\system32\spool\PRINTERS\*.*
    net start '"print spooler"'
    $Spooler.State

}elseif ($Spooler.State -eq �Stopped�){
    write-host("Spooler is Stopped")
    Remove-Item -Path $env:windir\system32\spool\PRINTERS\*.*
    net start '"print spooler"'
    }
$Spooler.State
