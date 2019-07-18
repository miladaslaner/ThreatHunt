# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  


# Provide username, password and IP range
Write-Host "Provide corporate username (AzureAD\username@domain.com, domain\username) and password" 
$domainUser = Read-Host -Prompt 'Provide username'
$domainPass = Read-Host -Prompt 'Provide password'
$date = Get-Date
$IPrange = Read-Host -Prompt 'Provide private IP range (example 192.168.1.0/24)'
Write-Host "You input username '$domainUser', password '$domainPass', email '$emailad' and IP range '$IPrange' on '$Date'" 

# Create folder to store data
Write-Host "Provide full directory path where data should be stored"
$ThreatBox = read-host "Enter full directory path to where we are located right now"
If(!(test-path $ThreatBox))
{
    Write-host "$ThreatBox does not exist. Will be created."
    New-Item -ItemType Directory -Force -Path $ThreatBox
    New-Item -ItemType Directory -Force -Path $ThreatBox\tools
    New-Item -ItemType Directory -Force -Path $ThreatBox\logs
}

# Create network share of the newly created folder
Write-Host "Creating network share out of newly created folder"
New-SmbShare -Name "ThreatBox" -Path $ThreatBox -FullAccess Everyone

# Download some fine tools
Write-Host "Download PSTools.zip from Sysinternals.com"
Invoke-WebRequest https://download.sysinternals.com/files/PSTools.zip -OutFile $ThreatBox\tools\pstools.zip
Expand-Archive $ThreatBox\tools\pstools.zip -DestinationPath $ThreatBox\tools

Write-Host "Download nmap-7.70-setup.exe from Nmap.org" 
Invoke-WebRequest https://nmap.org/dist/nmap-7.70-setup.exe -OutFile $ThreatBox\tools\nmap-7.70-setup.exe
Start-Process -FilePath $ThreatBox\tools\nmap-7.70-setup.exe

Write-Host "Download ncat-portable-5.59BETA1.zip from Nmap.org"
Invoke-WebRequest http://nmap.org/dist/ncat-portable-5.59BETA1.zip -OutFile $ThreatBox\tools\ncat.zip
Expand-Archive $ThreatBox\tools\ncat.zip -DestinationPath $ThreatBox\tools\ncat

# Copy super not malicious files
Write-Host "Copy curl.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\curl.exe -Destination $ThreatBox\tools\curl.exe

Write-Host "Copy ping.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\ping.exe -Destination $ThreatBox\tools\ping.exe

Write-Host "Copy cmd.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\cmd.exe -Destination $ThreatBox\tools\cmd.exe

Write-Host "Copy powercfg.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\powercfg.exe -Destination $ThreatBox\tools\powercfg.exe
