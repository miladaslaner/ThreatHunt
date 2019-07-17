# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

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
