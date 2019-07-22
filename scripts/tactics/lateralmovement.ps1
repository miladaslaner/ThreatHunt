# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Lateral Movement

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '******************************'
    Write-Host -Object 'MITRE ATT&CK: Lateral Movement'
    Write-Host -Object '******************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1210 Exploitation of Remote Services '
    Write-Host -Object '2.  T1037 Logon Scripts '
    Write-Host -Object '3.  T1075 Pass the Hash '
    Write-Host -Object '4.  T1097 Pass the Ticket '
    Write-Host -Object '5.  T1076 Remote Desktop Protocol '
    Write-Host -Object '6.  T1105 Remote File Copy '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '******************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-6 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1210.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1037.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1075.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1097.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1076.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1105.ps1"
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