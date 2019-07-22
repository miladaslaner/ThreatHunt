# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Defense Evasion

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '****************************'
    Write-Host -Object 'MITRE ATT&CK: Defense Evasion'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1197 BITS Jobs '
    Write-Host -Object '2.  T1088 Bypass User Account Control '
    Write-Host -Object '3.  T1146 Clear Command History '
    Write-Host -Object '4.  T1211 Exploitation for Defense Evasion '
    Write-Host -Object '5.  T1107 File Deletion '
    Write-Host -Object '6.  T1222 File Permissions Modification '
    Write-Host -Object '7.  T1484 Group Policy Modification '
    Write-Host -Object '8.  T1066 Indicator Removal from Tools '
    Write-Host -Object '9.  T1070 Indicator Removal on Host'
    Write-Host -Object '10. T1202 Indirect Host Execution '
    Write-Host -Object '11. T1036 Mascuerading '
    Write-Host -Object '12. T1126 Network Share Connection Removal'
    Write-Host -Object '13. T1170 Mshta '
    Write-Host -Object '14. T1055 Process Injection'
    Write-Host -Object '15. T1064 Scripting '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-15 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1197.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1088.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1146.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1211.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1107.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1222.ps1"
            pause}
            7
            {.".\scripts\techniques\T1484.ps1"
            pause}
            8
            {.".\scripts\techniques\T1066.ps1"
            pause}
            9
            {.".\scripts\techniques\T1070.ps1"
            pause}
            10
            {.".\scripts\techniques\T1202.ps1"
            pause}
            11
            {.".\scripts\techniques\T1036.ps1"
            pause}
            12
            {.".\scripts\techniques\T1126.ps1"
            pause}
            13
            {.".\scripts\techniques\T1170.ps1"
            pause}
            14
            {.".\scripts\techniques\T1202.ps1"
            pause}
            15
            {.".\scripts\techniques\T1064.ps1"
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