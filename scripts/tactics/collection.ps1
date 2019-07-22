# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Collection

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '******************************'
    Write-Host -Object 'MITRE ATT&CK: Collection'
    Write-Host -Object '******************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1115 Clipboard Data '
    Write-Host -Object '2.  T1213 Data from Information Repositories '
    Write-Host -Object '3.  T1005 Data from Local System '
    Write-Host -Object '4.  T1039 Data from Network Shared Drive '
    Write-Host -Object '5.  T1056 Input Capture '
    Write-Host -Object '6.  T1113 Screen Capture '
    Write-Host -Object '7.  T1119 Automated Collection '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '******************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-7 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1115.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1213.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1005.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1039.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1056.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1113.ps1"
            pause}
            7
            {.".\scripts\techniques\T1119.ps1"
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