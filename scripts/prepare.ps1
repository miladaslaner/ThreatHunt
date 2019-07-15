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


# Test user from the environment
# For AAD use format: AzureAD\ChuckNorris@domain.com
# For AD use format: domain\ChuckNorris
# For WORKGROUP: WORKGROUP\ChuckNorris

Write-Host "We first need some test credentials..." 
$domainUser = Read-Host -Prompt 'Provide username'
$domainPass = Read-Host -Prompt 'Provide password'
$date = Get-Date
$IPrange = Read-Host -Prompt 'Provide IP range (example 192.168.1.0/24)'
Write-Host "You input username '$domainUser', password '$domainPass', email '$emailad' and IP range '$IPrange' on '$Date'" 

# Create a super secret location and make it a network share
Write-Host "We need a place to hide our magic"
$ThreatBox = read-host "Enter full directory path to where we are located right now"
If(!(test-path $ThreatBox))
{
    Write-host "$ThreatBox does not exist. Will be created."
    New-Item -ItemType Directory -Force -Path $ThreatBox
    New-Item -ItemType Directory -Force -Path $ThreatBox\tools
    New-Item -ItemType Directory -Force -Path $ThreatBox\logs
}
New-SmbShare -Name "ThreatBox" -Path $ThreatBox -FullAccess Everyone

# Download some fine tools
Invoke-WebRequest https://download.sysinternals.com/files/PSTools.zip -OutFile $ThreatBox\tools\pstools.zip
Expand-Archive $ThreatBox\tools\pstools.zip -DestinationPath $ThreatBox\tools

Invoke-WebRequest http://nmap.org/dist/ncat-portable-5.59BETA1.zip -OutFile $ThreatBox\tools\ncat.zip
Expand-Archive $ThreatBox\tools\ncat.zip -DestinationPath $ThreatBox\tools\ncat

Invoke-WebRequest https://nmap.org/dist/nmap-7.70-setup.exe -OutFile $ThreatBox\tools\nmap-7.70-setup.exe
Start-Process -FilePath $ThreatBox\tools\nmap-7.70-setup.exe

# Copy super not malicious files
Write-Host "We now need some ninja files that pretend being malicious..."
Copy-Item -Path $env:SystemDrive\Windows\System32\curl.exe -Destination $ThreatBox\tools\curl.exe
Copy-Item -Path $env:SystemDrive\Windows\System32\ping.exe -Destination $ThreatBox\tools\ping.exe
Copy-Item -Path $env:SystemDrive\Windows\System32\cmd.exe -Destination $ThreatBox\tools\cmd.exe
Copy-Item -Path $env:SystemDrive\Windows\System32\powercfg.exe -Destination $ThreatBox\tools\powercfg.exe
