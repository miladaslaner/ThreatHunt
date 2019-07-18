# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

# Copy calc.exe with file name of famous tools
Write-Host "Copy calc.exe as mimikatz.exe"
Copy-Item -Path $env:SystemDrive\Windows\System32\calc.exe -Destination $ThreatBox\tools\mimikatz.exe

Write-Host "Copy conhost.exe as mimi.kirbi"
Copy-Item -Path $env:SystemDrive\Windows\System32\conhost.exe -Destination $ThreatBox\tools\mimi.kirbi

# Create Windows Service
Write-Host "Create dummy Windows servce"
New-Service -Name "ThreatBox" -StartupType Automatic -BinaryPathName "$ThreatBox\tools\mimikatz.exe" -DisplayName "Friendly Friend"
Start-Service -Name 'ThreatBox' -ErrorAction Ignore

# Download test files
Write-Host "Downloading samples"
Invoke-WebRequest https://demo.wd.microsoft.com/Content/ASRSamplesAll.zip -OutFile $ThreatBox\tools\ASRSamples.zip
Expand-Archive $ThreatBox\tools\ASRSamples.zip -DestinationPath $ThreatBox\tools\ASR

# Clear event logs and create totally suspicious ones
Write-Host "Delete System, Application and Security event logs"
Clear-EventLog -LogName System, Application, Security
Write-EventLog -LogName System -Source "EventLog" -EntryType Information -EventId 1 -Message "Fun Time"

# Start
Write-Host "Start mimikatz.exe (calc.exe) with Base64 encoding"
$mimi64 = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes('-force'))
Start-Process -FilePath "$ThreatBox\tools\mimikatz.exe" -ArgumentList "-encoded $mimi64"

Write-Host "Start UNSIGNED_ransomware_test_exe.exe with Base64 encoding"
$unsignedrand64 = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes('-force'))
Start-Process -FilePath "$ThreatBox\tools\UNSIGNED_ransomware_test_exe.exe" -ArgumentList "-encoded $unsignedrand64"

Write-Host "Start ransomware_testfile_doc.docm"
Start-Process -FilePath "$ThreatBox\tools\ASR\ASRSamplesAll\ransomware_testfile_doc.docm"

#Execution
Write-Host "Use certutil.exe with decode syntax"
Start-Process -FilePath "$env:windir\system32\certutil.exe" -ArgumentList "-f -decode $ThreatBox\tools\MySql.Data3.dll.txt $ThreatBox\tools\MySql.Data3.dll"

# Persistance
Write-Host "Creating persistance through AutoRun registry hive"
$regTSC = Test-Path -Path "HKCU:\SOFTWARE\Policies\Microsoft\Command Processor\AutoRun"
if ($regTSC-eq $False)
{
New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Command Processor\AutoRun" -Force
New-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Command Processor\AutoRun" -Name "PowerShell" -Value "powershell.exe mshta https://microsoft.com" -PropertyType "String"
}
elseif ($regTSC -eq $regTSC -eq $True)
{
New-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Command Processor\AutoRun" -Name "PowerShell" -Value "powershell.exe mshta https://microsoft.com" -PropertyType "String"
}

Write-Host "Creating persistance through Termainal Service client registry hive"
$regTSC = Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Terminal Server Client\Default"
if ($regTSC-eq $False)
{
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Terminal Server Client\Default" -Force
New-ItemProperty "HKCU:\SOFTWARE\Microsoft\Terminal Server Client\Default" -Name "PowerShell" -Value "powershell.exe mshta https://microsoft.com" -PropertyType "String"
}
elseif ($regTSC -eq $regTSC -eq $True)
{
New-ItemProperty "HKCU:\SOFTWARE\Microsoft\Terminal Server Client\Default" -Name "PowerShell" -Value "powershell.exe mshta https://microsoft.com" -PropertyType "String"
}
