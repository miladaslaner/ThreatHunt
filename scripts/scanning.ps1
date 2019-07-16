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


# Scanning
Write-Host "Lets get to know our environment a bit more..."
arp -a > $ThreatBox\logs\arptable.log
ipconfig /displaydns > $ThreatBox\logs\dnscache.log
ipconfig /all > $ThreatBox\logs\ipconfig.log
tracert bing.com > $ThreatBox\logs\tracert.log
ping bing.com -f -l 1500 > $ThreatBox\logs\fragsizeping.log
nslookup ALL > $ThreatBox\logs\nslookup.log
netstat -r > $ThreatBox\logs\netstat_r.log
netstat -anb > $ThreatBox\logs\netstat.log
tasklist > $ThreatBox\logs\tasklist.log
Get-WmiObject win32_service | select ProcessID, Name, State, StartMode | sort State, Name > $ThreatBox\logs\services.log
Get-WmiObject win32_computersystem > $ThreatBox\logs\computersystem.log
Get-WmiObject win32_product | select Name, Version > $ThreatBox\logs\programs.log
Get-WmiObject win32_account > $ThreatBox\logs\accounts.log
Get-WmiObject win32_Desktop > $ThreatBox\logs\desktop.log
Get-WmiObject win32_environment > $ThreatBox\logs\env.log
Get-WmiObject win32_useraccount > $ThreatBox\logs\useraccount.log
Get-HotFix > $ThreatBox\logs\hotfix.log
& 'C:\Program Files (x86)\Nmap\nmap.exe' -T4 -A -v $IPrange > $ThreatBox\logs\nmap.log
Compress-Archive $ThreatBox\logs\*.log $ThreatBox\logs\logs.zip
