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
$IPrange = Read-Host -Prompt 'Provide private IP range (example 192.168.1.0/24)'

# Create folder to store data
Write-Host "Provide folder path where data should be stored (C:\ThreatHunt)"
$ThreatBox = read-host "Provide folder path"
If(!(test-path $ThreatBox))
{
    Write-host "$ThreatBox does not exist. Will be created."
    New-Item -ItemType Directory -Force -Path $ThreatBox
    New-Item -ItemType Directory -Force -Path $ThreatBox\tools
    New-Item -ItemType Directory -Force -Path $ThreatBox\logs
}

# Create network share
Write-Host "Creating network share for $ThreatBox"
New-SmbShare -Name "ThreatBox" -Path $ThreatBox -FullAccess Everyone

# Download some fine tools
Write-Host "Download PSTools.zip from Sysinternals.com"
Invoke-WebRequest https://download.sysinternals.com/files/PSTools.zip -OutFile $ThreatBox\tools\pstools.zip
Expand-Archive $ThreatBox\tools\pstools.zip -DestinationPath $ThreatBox\tools

Write-Host "Download nmap-7.70-setup.exe from Nmap.org" 
Invoke-WebRequest https://nmap.org/dist/nmap-7.70-setup.exe -OutFile $ThreatBox\tools\nmap-7.70-setup.exe
Start-Process -FilePath $ThreatBox\tools\nmap-7.70-setup.exe

# Copy super not malicious files
Write-Host "Copy curl.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\curl.exe -Destination $ThreatBox\tools\curl.exe

Write-Host "Copy ping.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\ping.exe -Destination $ThreatBox\tools\ping.exe

Write-Host "Copy cmd.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\cmd.exe -Destination $ThreatBox\tools\cmd.exe

Write-Host "Copy powercfg.exe to new folder location"
Copy-Item -Path $env:SystemDrive\Windows\System32\powercfg.exe -Destination $ThreatBox\tools\powercfg.exe

Write-Host "Create MySql.Data.dll.txt"
New-Item "$ThreatBox\tools\MySql.Data.dll.txt"

Write-Host "Create MySql.MySql.Data.dll"
New-Item "$ThreatBox\tools\MySql.Data.dll"
