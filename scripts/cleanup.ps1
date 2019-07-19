# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

Write-Host "Time to cleanup..."

Write-Host "Remove previously created network share"
Remove-SmbShare -Force -Name "ThreatBox"

Write-Host "Delete previously created folder"
Remove-Item -Force -Path $ThreatBox

Write-Host "DisableBehaviorMonitoring configured to default"
$Preferences = Get-MpPreference
if ($Preferences.DisableBehaviorMonitoring -eq $True) {Set-MpPreference -DisableBehaviorMonitoring $OldDisableBehaviorMonitoring}
Get-MpPreference | fl DisableBehaviorMonitoring

Write-Host "DisableBlockAtFirstSeen configured to default"
$Preferences = Get-MpPreference
if ($Preferences.DisableBlockAtFirstSeen -eq $True) {Set-MpPreference -DisableBlockAtFirstSeen $OldDisableBlockAtFirstSeen}
Get-MpPreference | fl DisableBlockAtFirstSeen

Write-Host "DisableIOAVProtection configured to default"
$Preferences = Get-MpPreference
if ($Preferences.DisableIOAVProtection -eq $True) {Set-MpPreference -DisableIOAVProtection $OldDisableIOAVProtection}
Get-MpPreference | fl DisableIOAVProtection

Write-Host "DisableRealtimeMonitoring configured to default"
$Preferences = Get-MpPreference
if ($Preferences.DisableRealtimeMonitoring -eq $True) {Set-MpPreference -DisableRealtimeMonitoring $OldDisableIOAVProtection}
Get-MpPreference | fl DisableRealtimeMonitoring

Write-Host "DisableScriptScanning configured to default"
$Preferences = Get-MpPreference
if ($Preferences.DisableScriptScanning -eq $True) {Set-MpPreference -DisableScriptScanning $OldDisableIOAVProtection}
Get-MpPreference | fl DisableScriptScanning

Write-Host "EnableControlledFolderAccess configured to default"
$Preferences = Get-MpPreference
$Preferences.EnableControlledFolderAccess
if ($Preferences.EnableControlledFolderAccess -eq 0) {Set-MpPreference -EnableControlledFolderAccess $OldCFA}
Get-MpPreference | fl EnableControlledFolderAccess

Write-Host "EnableNetworkProtection configured to default"
$Preferences = Get-MpPreference
$Preferences.EnableNetworkProtection
if ($Preferences.EnableNetworkProtection -eq 1) {Set-MpPreference -EnableNetworkProtection $OldNP}
Get-MpPreference | fl EnableNetworkProtection

Write-Host "NetFirewallProfile configured to default"
Set-NetFirewallProfile -Enabled $OldFirewall

Write-Host "Set Attack Surface Reduction rules into Audit Mode"
Add-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A, 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC, 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B, 3B576869-A4EC-4529-8536-B80A7769E899, 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84, D3E037E1-3EB8-44C8-A917-57927947596D, BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550, 01443614-cd74-433a-b99e-2ecdc07bfc25, c1db55ab-c21a-4637-bb3f-a12568109d35, 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2, d1e49aac-8f56-4280-b9ba-993a6d77406c, b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4, 26190899-1602-49e8-8b27-eb1d0a1ce869, 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c, e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules_Actions AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode, AuditMode

Write-Host "Set SetUserAuthenticationRequired to 1"
$Preferences = Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices
if ($Preferences.UserAuthenticationRequired -eq 0)
{
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(1)
}

Write-Host "Delete previously created Windows service"
Get-Service -Displayname "*Friendly Friend*" | ForEach-object{ cmd /c  sc delete $_.Name}

Write-Host "Delete previously created RunAs registry value"
Remove-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Command Processor\AutoRun" -Name "PowerShell" -Force

Write-Host "Delete previously created Termainl Service Client registry value"
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Terminal Server Client\Default" -Name "PowerShell" -Force

Write-Host "Uninstall Nmap silently"
cd ${env:ProgramFiles(x86)}\Nmap
.\Uninstall.exe /S

Write-Host "Uninstall Npcap silently"
cd $env:ProgramFiles\Npcap
.\uninstall.exe /S
