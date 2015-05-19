
$TempFolder = "$env:SystemDrive\Temp"

New-Item $TempFolder -Type Directory

Start-Process "$env:ProgramFiles\Microsoft Team Foundation Server 12.0\Tools\TFSConfig.exe" -ArgumentList "Unattend /create /type:basic /unattendfile:$Tempfolder\configTFSBasic.ini" -Wait

(gc $Tempfolder\configTFSBasic.ini).replace('SendFeedback=True','SendFeedback=False')|sc $Tempfolder\configTFSBasic.ini

Start-Process "$env:ProgramFiles\Microsoft Team Foundation Server 12.0\Tools\TFSConfig.exe" -ArgumentList "Unattend /configure /type:basic /unattendfile:$Tempfolder\configTFSBasic.ini" -Wait

Remove-Item $Tempfolder\configTFSBasic.ini -Force
