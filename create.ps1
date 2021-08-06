# Run as Administrator
Remove-Item -Path 'C:\Program Files\Toxik\Jokes'
New-Item -Path 'C:\Program Files\Toxik' -ItemType Directory
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/maverick-dev-55/joke-app/main/dist/Jokes.zip' -OutFile 'C:\Program Files\Toxik\Jokes.zip'
Expand-Archive -LiteralPath 'C:\Program Files\Toxik\Jokes.zip' -DestinationPath 'C:\Program Files\Toxik\'
Remove-Item -Path 'C:\Program Files\Toxik\Jokes.zip'
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Jokes.lnk")
$Shortcut.TargetPath = 'C:\Program Files\Toxik\Jokes\Jokes.exe'
$Shortcut.Save()