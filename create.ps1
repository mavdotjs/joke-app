# Run as Administrator
New-Item -Path 'C:\Program Files\Toxik' -ItemType Directory
Invoke-WebRequest -Uri 'https://download1080.mediafire.com/qfw8u1l7z4lg/5ag1zcev6fd878c/Jokes.zip' -OutFile 'C:\Program Files\Toxik\Jokes.zip'
Expand-Archive -LiteralPath 'C:\Program Files\Toxik\Jokes.zip' -DestinationPath 'C:\Program Files\Toxik\'
Remove-Item -Path 'C:\Program Files\Toxik\Jokes.zip'
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Jokes.lnk")
$Shortcut.TargetPath = 'C:\Program Files\Toxik\Jokes\Jokes.exe'
$Shortcut.Save()