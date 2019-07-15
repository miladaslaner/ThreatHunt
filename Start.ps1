# ThreatHunt by Milad Aslaner @MiladMSFT
#   _____  .__.__              .___ _____    _______________________________
#  /     \ |__|  | _____     __| _//     \  /   _____/\_   _____/\__    ___/
# /  \ /  \|  |  | \__  \   / __ |/  \ /  \ \_____  \  |    __)    |    |   
#/    Y    \  |  |__/ __ \_/ /_/ /    Y    \/        \ |     \     |    |   
#\____|__  /__|____(____  /\____ \____|__  /_______  / \___  /     |____|   
#        \/             \/      \/       \/        \/      \/               
# This project is not intended to cause any harm. However just in case, dont use it in production.
# Use at your own risk. There is no turning back. No option to pretend you didn't know what you do.
# ThreatHunt simulates dark magic so that folks can learn threat hunting.

$ScriptRun = Get-Location 

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
    Write-Host -Object ' Follow the white rabbit..'
    Write-Host -Object '****************************'
    Write-Host -Object ''
    Write-Host -Object '1.  Prepare Environment '
    Write-Host -Object '2.  Tampering OS Security '
    Write-Host -Object '3.  Footprinting and Reconnaissance '
    Write-Host -Object '4.  Gaining and Maintaining Access '
    Write-Host -Object '5.  Network Discovery and Access '
    Write-Host -Object '6.  Data Exfiltration '
    Write-Host -Object '7.  Clean Up '
    Write-Host -Object 'Q.  Quit'
    Write-Host -Object ''
    Write-Host -Object '****************************'
    Write-Host -Object '*********@MiladMSFT*********'
    Write-Host -Object $errout
    $Menu = Read-Host -Prompt '(0-6 or Q to Quit)'
    switch ($Menu) 
        {
           1 
            {."$ScriptRun\scripts\prepare.ps1"
            pause}
            2 
            {."$ScriptRun\scripts\tampering.ps1"
            pause}
            3 
            {."$ScriptRun\scripts\scanning.ps1"
            pause}
            4 
            {."$ScriptRun\scripts\gainmain.ps1"
            pause}
            5 
            {."$ScriptRun\scripts\network.ps1"
            pause}
            6
            {."$ScriptRun\scripts\dataexfiltration.ps1"
            pause}           
            7
            {."$ScriptRun\scripts\cleanup.ps1"
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