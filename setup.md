# Linux


## Remap Caps
- Install xcape
	sudo apt-get install xcape
- Add the two lines in your ~/.profile or other startup method (see below)
	- This line can also be omitted if you  make CapsLock behave like Ctrl in the gui system settings
	/usr/bin/setxkbmap -option 'caps:ctrl_modifier'
- Make short-pressed Ctrl behave like Escape:
	/usr/bin/xcape -e 'Caps_Lock=Escape' -t 100
Notice the part -t 100, if you don't set it, you may notice a delay in Esc if you use vim.
Sources:
	- https://gist.github.com/tanyuan/55bca522bf50363ae4573d4bdcf06e2e
	- https://askubuntu.com/questions/177824/remapping-caps-lock-to-control-and-escape-not-the-usual-way


## Running script/command on startup:
Running 'crontab -e' will allow you to edit your cron.
Adding a line like this to it:
@reboot /path/to/script
@reboot xcape -e 'Control_L=Escape'
