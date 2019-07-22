# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Impact

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '**************************'
    Write-Host -Object 'MITRE ATT&CK: Impact'
    Write-Host -Object '**************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1485 Data Destruction '
    Write-Host -Object '2.  T1488 Disk Content Wipe '
    Write-Host -Object '3.  T1011 Service Stop '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '***************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-3 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1485.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1488.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1011.ps1"
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