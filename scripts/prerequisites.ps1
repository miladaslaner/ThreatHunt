# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Prerequisites

# Collect Information

# Store Username
$username = Read-Host "Username (example: threathunt\milad)" -AsSecureString
$convertusername = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($username)
$valueusername = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($convertusername)

# Store Password
$password = Read-Host "Password" -AsSecureString
$convertpw = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
$valuepw = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($convertpw)

# Store O365 Email Account Username
$O365username = Read-Host "Username (example: milad@threathunt.me)" -AsSecureString
$O365convertusername = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($O365username)
$O365valueusername = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($O365convertusername)

# Store O365 Email Account Password
$O365password = Read-Host "Password" -AsSecureString
$O365convertpw = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($O365password)
$O365valuepw = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($O365convertpw)

# IP Range
$IPrange = Read-Host "IP Range (example: 192.168.1.0/16)" -AsSecureString
$convertIPrange = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($IPrange)
$valueIPrange = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($convertIPrange)

# 2nd Target IP
$Target2IP = Read-Host "IP Range (example: 192.168.1.5)" -AsSecureString
$convertTarget2IP = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Target2IP)
$valueTarget2IP = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($convertTarget2IP)

# Custom Detetection
Write-Host "ThreatHunt does not contain malicious content. Therefore you need to create some custom detections in your security product.

Indicator of Compromise (IoC)

Domain:
threathunt.me

IP address:
8.8.8.8
"

# Download test files
Write-Host "Downloading samples"
Invoke-WebRequest https://demo.wd.microsoft.com/Content/ASRSamplesAll.zip -OutFile $ThreatBox\tools\ASRSamples.zip
Expand-Archive $ThreatBox\tools\ASRSamples.zip -DestinationPath $ThreatBox\tools\ASR