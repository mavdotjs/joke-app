import asyncio
from jokeapi import Jokes
from tkinter import *
import sys
import os
from tkinter import messagebox
window = Tk()
textmsg = Label(window)
boxmessage = StringVar()
print(sys.argv[0].split('.')[1])
if sys.argv[0].split('.')[1] == 'py':
	print('py')
	p1 = PhotoImage(file = f'{os.getcwd()}\\icon.png')
elif sys.argv[0].split('.')[1] == 'exe':
	print('exe')
	p1 = PhotoImage(file = f'{os.getcwd()}\\icon.png\\icon.png')
window.iconphoto(False, p1)
message = ''
flags = []
window.geometry("400x268")
window.resizable(False, True)
window.title('Jokes')
async def getjoke():
	j = await Jokes()
	currentjoke = await j.get_joke()
	joke = currentjoke
	flag = currentjoke['flags']
	if flag['nsfw']:
		flags.append('nsfw')
	if flag['religious']:
		flags.append('religious')
	if flag['political']:
		flags.append('political')
	if flag['racist']:
		flags.append('racist')
	if flag['sexist']:
		flags.append('sexist')
	if flag['explicit']:
		flags.append('explicit')
	if flags:
		strf = str(flags)
		strf = strf.replace(']', '')
		strf = strf.replace('[', '')
		strf = strf.replace("'", '')
		ucontinue = messagebox.askyesno(title='continue?', message=f'This Joke may contain {strf} content. Are you sure you want to proceed?')
		flags.clear()
		if not ucontinue:
			boxmessage.set('[Joke removed]')
			return
	if joke["type"] == "single":
		message = joke["joke"]
		boxmessage.set(message)
	else:
		message = f'This joke requires a setup and delivery:\n setup: {joke["setup"]}\ndelivery: {joke["delivery"]}'
		boxmessage.set(message)
agetj = lambda: asyncio.run(getjoke())
textmsg.configure(textvariable=boxmessage,wrap=400)
textmsg.pack(side='bottom')
btn_joke = Button(window, command=agetj, text='Joke')
btn_joke.pack(side='top')
window.mainloop()