# Introduction

ThreatHunt is a simple PowerShell repository that allows you to train your threat hunting skills. ThreatHunt allows you to simulate a variety of attack techniques and procedures without leveraging malicious files. ThreatHunt is not an penetration system tool or framework but instead a very simply way to raise security alerts that help you to train your threat hunting skills.

# Screenshot

<img width="713" alt="Screenshot 2019-07-18 at 05 44 50" src="https://user-images.githubusercontent.com/51508845/61410418-303e9980-a91f-11e9-91cc-85f156b56da9.png">

# Scenario

Let's say you just got started in your career as a threat hunter or you are a threat hunter already but your organization got a new Endpoint Detection Response (EDR) or Security Information and Event Management (SIEM). In both cases you will want to have a safe harbour where you can raise security alerts and start analyzing the data. This is where ThreatHunt can come handy as there are no malicious files but simply simulates tons of somewhat suspiscious activities. 

# Prerequisites 

1. ThreatHunt has been tested with Windows 10 1809+. However it is likely that it will work with most Windows 10 versions.
2. Security tempering script is based on Microsoft Defender ATP suite (Attack Surface Reduction, Antivirus and Endpoint Detection Response (EDR)).
3. ThreatHunt doesnt teach you hacking. Therefore for some scenarios you need to supply domain credentials (username, password), IP address ranges and O365 email credentials (e-mail address and password).

# 3rd-party Tools and Files

ThreatHunt installs and leverages some 3rd-party tools and files such as PSExec, NMAP, EICAR test files etc. All of these are subject to the license terms of the respective intellectual property owner.

# Known Issues

1. Cleanup.ps1 configures ASR rules into AuditMode. If ASR rules previously were Disabled please manually adjust.

# Disclaimer

While there are no malicious files inside this GitHub repositroy its important to call out that you are responsible for your environment. Make sure to assess any tools you deploy wisely before using in production environments. 

Some of the activities are very simplified. As an example one step is copying calc.exe under C:\Windows\System32 as mimikatz.exe to a network share. Again, this isnt about using malicious files but to simply generate noise that can be used to train threat hunting skills.
