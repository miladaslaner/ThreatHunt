# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

Function Menu 
{
 Clear-Host        
  Do
  {
    Clear-Host
    Write-Host -Object '___________.__                          __     ___ ___               __   ' -ForegroundColor Red
    Write-Host -Object '\__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |_ ' -ForegroundColor Red
    Write-Host -Object '  |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\' -ForegroundColor Red
    Write-Host -Object '  |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |  ' -ForegroundColor Blue
    Write-Host -Object '  |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|  ' -ForegroundColor Blue
    Write-Host -Object '                \/            \/     \/             \/            \/      ' -ForegroundColor Blue
    Write-Host -Object '****************************'
    Write-Host -Object '****************************'
    Write-Host -Object '   Follow the white rabbit'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '0.   Prerequisites '
    Write-Host -Object '1.   TA0001 Initial Access '
    Write-Host -Object '2.   TA0002 Execution '
    Write-Host -Object '3.   TA0003 Persistence '
    Write-Host -Object '4.   TA0004 Privilege Escalation '
    Write-Host -Object '5.   TA0005 Defense Evasion '
    Write-Host -Object '6.   TA0006 Credential Access '
    Write-Host -Object '7.   TA0007 Discovery '
    Write-Host -Object '8.   TA0008 Lateral Movement '
    Write-Host -Object '9.   TA0009 Collection '
    Write-Host -Object '10.  TA0011 Command and Control '
    Write-Host -Object '11.  TA0010 Exfiltration '
    Write-Host -Object '12.  TA0040 Impact '
    Write-Host -Object 'Q.   Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object '*********@MiladMSFT*********'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-6 or Q to Quit)'
    switch ($Menu) 
        {
           0 
            {.".\scripts\prerequisites.ps1"
            pause}
            1 
            {.".\scripts\tactics\initialaccess.ps1"
            pause}
            2
            {.".\scripts\tactics\execution.ps1"
            pause}
            3 
            {.".\scripts\tactics\persistence.ps1"
            pause}
            4 
            {.".\scripts\tactics\privilegeescalation.ps1"
            pause}
            5
            {.".\scripts\tactics\defenseevasion.ps1"
            pause}           
            6
            {.".\scripts\tactics\credentialaccess.ps1"
            pause}  
            7
            {.".\scripts\tactics\discovery.ps1"
            pause}           
            8
            {.".\scripts\tactics\lateralmovement.ps1"
            pause}  
            9
            {.".\scripts\tactics\collection.ps1"
            pause}            
            10
            {.".\scripts\tactics\commandandcontrol.ps1"
            pause}
            11
            {.".\scripts\tactics\exfiltration.ps1"
            pause}   
            12
            {.".\scripts\tactics\impact.ps1"
            pause}  
            Q
            {Exit}   
            default
            {$errout = 'Invalid option please try again........Try 0-6 or Q only'}
        }
    }
    until ($Menu -eq 'q')
}   
    
# Launch The Menu
Menu
