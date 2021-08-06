python -m PyInstaller -n Jokes --add-binary icon.png;icon.png -i icon.ico -D --noconfirm --noconsole --splash icon.png main.py
powershell compress-archive -path " C:\Users\RedRa\Documents\vscode\joke-app\dist\Jokes" " C:\Users\RedRa\Documents\vscode\joke-app\dist\Jokes.zip" -Force -compressionlevel optimal
git commit -a -m "Auto commit"
git push