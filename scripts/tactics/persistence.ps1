# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Persistence 

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '****************************'
    Write-Host -Object 'MITRE ATT&CK: Persistence'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1015 Accessibility Features '
    Write-Host -Object '2.  T1098 Account Manipulation '
    Write-Host -Object '3.  T1197 BITS Jobs '
    Write-Host -Object '4.  T1042 Change Default File Association '
    Write-Host -Object '5.  T1136 Create Account '
    Write-Host -Object '6.  T1133 External Remote Service '
    Write-Host -Object '7.  T1044 File System Permissions Weakness '
    Write-Host -Object '8.  T1158 Hidden Files and Directories '
    Write-Host -Object '9.  T1162 Login Item '
    Write-Host -Object '10. T1037 Login Scripts '
    Write-Host -Object '11. T1128 Netsh Helper DLL '
    Write-Host -Object '12. T1050 New Service '
    Write-Host -Object '13. T1060 Registry Run Keys / Startup Folder '
    Write-Host -Object '14. T1053 Scheduled Task '
    Write-Host -Object '15. T1165 Startup Items '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-15 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1015.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1098.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1042.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1136.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1133.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1044.ps1"
            pause}
            7 
            {.".\scripts\techniques\T1158.ps1"
            pause}
            8 
            {.".\scripts\techniques\T1162.ps1"
            pause} 
            9
            {.".\scripts\techniques\T1136.ps1"
            pause}
            10
            {.".\scripts\techniques\T1037.ps1"
            pause}
            11
            {.".\scripts\techniques\T1128.ps1"
            pause}
            12
            {.".\scripts\techniques\T1050.ps1"
            pause}
            13
            {.".\scripts\techniques\T1060.ps1"
            pause}
            14
            {.".\scripts\techniques\T1053.ps1"
            pause}
            15
            {.".\scripts\techniques\T1165.ps1"
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