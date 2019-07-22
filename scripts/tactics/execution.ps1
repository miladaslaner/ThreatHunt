# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Execution

. = Get-Location 

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '****************************'
    Write-Host -Object 'MITRE ATT&CK: Execution'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1059 Command-Line Interface '
    Write-Host -Object '2.  T1196 Control Panel Items '
    Write-Host -Object '3.  T1152 Launchctl '
    Write-Host -Object '4.  T1170 Mshta '
    Write-Host -Object '5.  T1086 PowerShell '
    Write-Host -Object '6.  T1121 Regsvcs/Regasm '
    Write-Host -Object '7.  T1117 Regsvr32 '
    Write-Host -Object '8.  T1085 Rundll32 '
    Write-Host -Object '9.  T1053 Scheduled Task '
    Write-Host -Object '10. T1064 Scripting '
    Write-Host -Object '11. T1204 User Execution '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-11 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1059.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1196.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1152.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1170.ps1"
            pause}
            5
            {.".\scripts\techniques\T1086.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1121.ps1"
            pause}
            7 
            {.".\scripts\techniques\T1117.ps1"
            pause}
            8 
            {.".\scripts\techniques\T1085.ps1"
            pause} 
            9 
            {.".\scripts\techniques\T1053.ps1"
            pause}
            10 
            {.".\scripts\techniques\T1064.ps1"
            pause} 
            11
            {.".\scripts\techniques\T1204.ps1"
            pause} 
            Q 
            {Exit}   
            default
            {$errout = 'Invalid option please try again........Try 0-6 or Q only'}
        }
    }
    until ($Menu -eq 'q')
}
menu