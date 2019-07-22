# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Privilege Escalation

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '**********************************'
    Write-Host -Object 'MITRE ATT&CK: Privilege Escalation'
    Write-Host -Object '**********************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1015 Accessibility Features '
    Write-Host -Object '2.  T1088 Bypass User Account Control '
    Write-Host -Object '3.  T1068 Exploitation for Privilege Escalation '
    Write-Host -Object '4.  T1044 File System Permissions Weakness '
    Write-Host -Object '5.  T1050 New Service '
    Write-Host -Object '6.  T1053 Scheduled Task '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '**********************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-6 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1015.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1088.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1068.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1044.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1050.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1053.ps1"
            pause}
            Q 
            {Exit}   
            default
            {$errout = 'Invalid option please try again........Try 0-15 or Q only'}
        }
    }
    until ($Menu -eq 'q')
}
menu