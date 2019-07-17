# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  


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
