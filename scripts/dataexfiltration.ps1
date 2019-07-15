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


# Send email
Write-Host "Lets send a email with all the log files"
$O365user = Read-Host -Prompt 'Your O365 email address username@domain.com'
$O365pw = Read-Host -Prompt 'Your password'
$secpasswd = ConvertTo-SecureString $O365pw -AsPlainText -Force
$To = Read-Host -Prompt 'E-Mail address that will receive log files'
$Subject = Read-Host -Prompt 'Subject line'
$Body = Read-Host -Prompt 'Plain text body'
$mycreds = New-Object System.Management.Automation.PSCredential ($O365user, $secpasswd)
$SMTPServer = "smtp.office365.com"
$SMTPPort = "587"
Send-MailMessage -Credential $mycreds -SmtpServer $SMTPServer -Port $SMTPPort -From $O365user -To $To -Subject $Subject -Body $Body -Attachments "$ThreatBox\logs\logs.zip" -UseSsl