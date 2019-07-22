# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Exfiltration

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '**************************'
    Write-Host -Object 'MITRE ATT&CK: Exfiltration'
    Write-Host -Object '**************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1020 Automated Exfiltration '
    Write-Host -Object '2.  T1002 Data Compressed '
    Write-Host -Object '3.  T1011 Exfiltration Over Other Network Medium '
    Write-Host -Object '4.  T1029 Scheduled Transfer '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '***************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-4 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1020.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1002.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1011.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1029.ps1"
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