python -m PyInstaller -n Jokes --add-binary icon.png;icon.png -i icon.ico -D --noconfirm main.py
powershell compress-archive -path "/dist/Jokes" "/dist/Jokes.zip" -compressionlevel optimal