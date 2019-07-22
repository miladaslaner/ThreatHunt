# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# Credential Access

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '****************************'
    Write-Host -Object 'MITRE ATT&CK: Credential Access'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '1.  T1098 Account Manipulation '
    Write-Host -Object '2.  T1110 Brute Force '
    Write-Host -Object '3.  T1003 Credential Dumping '
    Write-Host -Object '4.  T1081 Credential in Files '
    Write-Host -Object '5.  T1214 Credential in Registry '
    Write-Host -Object '6.  T1212 Exploitation for Credential Access '
    Write-Host -Object '7.  T1187 Forced Authentication '
    Write-Host -Object '8.  T1141 Input Prompt '
    Write-Host -Object '9.  T1056 Input Capture'
    Write-Host -Object '10. T1040 Network Sniffing '
    Write-Host -Object '11. T1126 Network Share Connection Removal'
    Write-Host -Object '12. T1170 Mshta '
    Write-Host -Object '13. T1055 Process Injection'
    Write-Host -Object '14. T1064 Scripting '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-14 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {.".\scripts\techniques\T1098.ps1"
            pause}
            2 
            {.".\scripts\techniques\T1110.ps1"
            pause}
            3 
            {.".\scripts\techniques\T1003.ps1"
            pause}
            4 
            {.".\scripts\techniques\T1081.ps1"
            pause}
            5 
            {.".\scripts\techniques\T1214.ps1"
            pause}
            6 
            {.".\scripts\techniques\T1212.ps1"
            pause}
            7
            {.".\scripts\techniques\T1187.ps1"
            pause}
            8
            {.".\scripts\techniques\T1141.ps1"
            pause}
            9
            {.".\scripts\techniques\T1056.ps1"
            pause}
            10
            {.".\scripts\techniques\T1040.ps1"
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