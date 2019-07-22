# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Command and Control

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '*********************************'
    Write-Host -Object 'MITRE ATT&CK: Command and Control'
    Write-Host -Object '*********************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1043 Commonly Used Port '
    Write-Host -Object '2.  T1132 Data Encoding '
    Write-Host -Object '3.  T1001 Data Obfuscation '
    Write-Host -Object '4.  T1219 Remote Access Tools '
    Write-Host -Object '5.  T1105 Remote File Copy '
    Write-Host -Object '6.  T1065 Uncommonly Used Port '
    Write-Host -Object '7.  T1119 Automated Collection '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '*********************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-7 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1043.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1132.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1001.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1219.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1105.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1065.ps1"
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