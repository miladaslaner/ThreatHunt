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


# Copy calc.exe with file name of famous tools
Write-Host "Calc.exe is becoming mimikatz.exe and more..."
Copy-Item -Path $env:SystemDrive\Windows\System32\calc.exe -Destination $ThreatBox\tools\mimikatz.exe
Copy-Item -Path $env:SystemDrive\Windows\System32\calc.exe -Destination $ThreatBox\tools\mimi.kirbi

# Create Windows Service
Write-Host "Time to create a dummy windows service..."
New-Service -Name "ThreatBox3" -StartupType Automatic -BinaryPathName "$ThreatBox\tools\mimikatz.exe" -DisplayName "Friendly Friend3"
Start-Service -Name 'ThreatBox' -ErrorAction Ignore

# Download test files
Write-Host "Downloading EICAR"
Invoke-WebRequest http://2016.eicar.org/download/eicar_com.zip -OutFile $ThreatBox\tools\eicar.zip
Expand-Archive $ThreatBox\tools\eicar.zip -DestinationPath $ThreatBox\tools\eicar

Write-Host "Downloading ASR Samples"
Invoke-WebRequest https://demo.wd.microsoft.com/Content/ASRSamplesAll.zip -OutFile $ThreatBox\tools\ASRSamples.zip
Expand-Archive $ThreatBox\tools\ASRSamples.zip -DestinationPath $ThreatBox\tools\ASR

# Clear event logs and create totally suspicious ones
Write-Host "Just deleted your Application, Security and System event logs..."
Clear-EventLog –LogName System, Application, Security
Write-EventLog -LogName System -Source "EventLog" -EntryType Information -EventId 1 -Message "Fun Time"

# Start
Write-Host "Start action"
Start-Process -FilePath "$ThreatBox\tools\mimikatz.exe -force"
$mimi64 = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes('$ThreatBox\tools\mimikatz.exe -force'))
powershell.exe -encoded "$mimi64"
Start-Process -FilePath "$ThreatBox\tools\ASRSamples\ransomware_testfile_exe.exe"
$ranexe64 = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes('$ThreatBox\tools\ASRSamples\ransomware_testfile_exe.exe'))
powershell.exe -encoded "$ranexe64"
Start-Process -FilePath "$ThreatBox\tools\ASRSamples\ransomware_testfile_doc.docm"
$randoc64 = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes('$ThreatBox\tools\ASRSamples\ransomware_testfile_doc.docm'))
powershell.exe -encoded "$randoc64"
Start-Process -FilePath "$ThreatBox\tools\ASRSamples\UNSIGNED_ransomware_test_exe.exe -force"
$unsignedrand64 = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes('$ThreatBox\tools\ASRSamples\UNSIGNED_ransomware_test_exe.exe -force'))
powershell.exe -encoded "$unsignedrand64"

# Persistance
Write-Host "Droppinbg persistance"
New-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Command Processor\AutoRun" -Name "PowerShell" -Value "powershell.exe mshta https://microsoft.com" -PropertyType "DWord"
New-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Termainl Server Client/Default" -Name "PowerShell" -Value "powershell.exe mshta https://microsoft.com" -PropertyType "DWord"