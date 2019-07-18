# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

# Scanning
Write-Host "Create ARP table log"
arp -a > $ThreatBox\logs\arptable.log

Write-Host "Create ipconfig /displaydns and /all"
ipconfig /displaydns > $ThreatBox\logs\dnscache.log
ipconfig /all > $ThreatBox\logs\ipconfig.log

Write-Host "Create tracert log to bing.com"
tracert bing.com > $ThreatBox\logs\tracert.log

Write-Host "Create ping log to bing.com with -f -l 1500"
ping bing.com -f -l 1500 > $ThreatBox\logs\fragsizeping.log

Write-Host "Create nslookup ALL log"
nslookup ALL > $ThreatBox\logs\nslookup.log

Write-Host "Create netstat -r and -anb log"
netstat -r > $ThreatBox\logs\netstat_r.log
netstat -anb > $ThreatBox\logs\netstat.log

Write-Host "Create tasklist log"
tasklist > $ThreatBox\logs\tasklist.log

Write-Host "Create win32_service, win32_computersystem, win32_product, win32_account, win32_Desktop, win32_environment, win32_useraccount log"
Get-WmiObject win32_service | select ProcessID, Name, State, StartMode | sort State, Name > $ThreatBox\logs\services.log
Get-WmiObject win32_computersystem > $ThreatBox\logs\computersystem.log
Get-WmiObject win32_product | select Name, Version > $ThreatBox\logs\programs.log
Get-WmiObject win32_account > $ThreatBox\logs\accounts.log
Get-WmiObject win32_Desktop > $ThreatBox\logs\desktop.log
Get-WmiObject win32_environment > $ThreatBox\logs\env.log
Get-WmiObject win32_useraccount > $ThreatBox\logs\useraccount.log

Write-Host "Create Get-HotFix log"
Get-HotFix > $ThreatBox\logs\hotfix.log

Write-Host "Use Nmap to scan previously defined IP range with -T4 -A -v"
& 'C:\Program Files (x86)\Nmap\nmap.exe' -T4 -A -v $IPrange > $ThreatBox\logs\nmap.log

Write-Host "Compress all log files as logs.zip"
Compress-Archive $ThreatBox\logs\*.log $ThreatBox\logs\logs.zip
