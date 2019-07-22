
# ___________.__                          __     ___ ___               __  
# \__    ___/|  |_________   ____ _____ _/  |_  /   |   \ __ __  _____/  |
#   |    |   |  |  \_  __ \_/ __ \\__  \\   __\/    ~    \  |  \/    \   __\
#   |    |   |   Y  \  | \/\  ___/ / __ \|  |  \    Y    /  |  /   |  \  |
#   |____|   |___|  /__|    \___  >____  /__|   \___|_  /|____/|___|  /__|
#                 \/            \/     \/             \/            \/  
# T1193

Write-Host "Send spearphishing with attachment"
$To = Read-Host -Prompt 'Recipient'
$Subject = Read-Host -Prompt 'Subject line'
$Body = Read-Host -Prompt 'Plain text body'
$mycreds = New-Object System.Management.Automation.PSCredential ($O365valueusername, $O365valuepw)
$SMTPServer = "smtp.office365.com"
$SMTPPort = "587"
Send-MailMessage -Credential $mycreds -SmtpServer $SMTPServer -Port $SMTPPort -From $O365user -To $To -Subject $Subject -Body $Body -UseSsl


## Send-MailMessage -Credential $mycreds -SmtpServer $SMTPServer -Port $SMTPPort -From $O365user -To $To -Subject $Subject -Body $Body -Attachments "$ThreatBox\tools\ASR\ASRSamplesAll\ransomware_testfile_doc.docm" -UseSsl