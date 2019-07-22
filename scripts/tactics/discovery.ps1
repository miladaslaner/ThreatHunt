# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Discovery

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '****************************'
    Write-Host -Object 'MITRE ATT&CK: Discovery'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1087 Account Discovery '
    Write-Host -Object '2.  T1217 Browser Bookmark Discovery '
    Write-Host -Object '3.  T1046 Network Service Discovery '
    Write-Host -Object '4.  T1135 Network Share Discovery '
    Write-Host -Object '5.  T1040 Network Sniffing '
    Write-Host -Object '6.  T1201 Password Policy Discovery '
    Write-Host -Object '7.  T1069 Permission Group Discovery '
    Write-Host -Object '8.  T1120 Peripheral Device Discovery '
    Write-Host -Object '9.  T1057 Process Discovery'
    Write-Host -Object '10. T1012 Query Registry '
    Write-Host -Object '11. T1018 Remote system Discovery'
    Write-Host -Object '12. T1063 Security Software Discovery '
    Write-Host -Object '13. T1082 System Information Discovery'
    Write-Host -Object '14. T1016 System Network Configuration Discovery '
    Write-Host -Object '15. T1049 System Network Connections Discovery'
    Write-Host -Object '16. T1033 System Owner/User Discovery '
    Write-Host -Object '17. T1007 System Service Discovery'
    Write-Host -Object '18. T1124 System Time Discovery '
    Write-Host -Object '19. T1497 Virtualization/Sandbox Evasion '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-19 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1087.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1217.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1135.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1081.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1040.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1201.ps1"
            pause}
            7
            {.".\scripts\techniques\T1069.ps1"
            pause}
            8
            {.".\scripts\techniques\T1120.ps1"
            pause}
            9
            {.".\scripts\techniques\T1057.ps1"
            pause}
            10
            {.".\scripts\techniques\T1012.ps1"
            pause}
            11
            {.".\scripts\techniques\T1018.ps1"
            pause}
            12
            {.".\scripts\techniques\T1063.ps1"
            pause}
            13
            {.".\scripts\techniques\T1082.ps1"
            pause}
            14
            {.".\scripts\techniques\T1016.ps1"
            pause}
            15
            {.".\scripts\techniques\T1049.ps1"
            pause}
            16
            {.".\scripts\techniques\T1033.ps1"
            pause}
            17
            {.".\scripts\techniques\T1007.ps1"
            pause}
            18
            {.".\scripts\techniques\T1124.ps1"
            pause}
            19
            {.".\scripts\techniques\T1497.ps1"
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