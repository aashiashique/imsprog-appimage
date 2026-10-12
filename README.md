[![GitHub Downloads](https://img.shields.io/github/downloads/aashiashique/imsprog-appimage/total?logo=github&label=GitHub%20Downloads)](https://github.com/aashiashique/imsprog-appimage/releases/latest)
# Unofficial AppImages for IMSProg
IMSProg - software for CH341A-based programmers to work with I2C, SPI and MicroWire EEPROM/Flash chips

**Official IMSProg:** https://github.com/bigbigmdm/IMSProg/

## Important: Add udev rules
The IMSProg AppImage will prompt you to add udev rules when you run it for the first time; if the prompt does not appear or if you cancel the prompt, add udev rules manually by copying 71-CH341.rules to /etc/udev/rules.d/
 - Download udev rules
	```sh
	wget "https://raw.githubusercontent.com/bigbigmdm/IMSProg/main/IMSProg_programmer/other/71-CH341.rules"
	```
 - Copy udev rules to /etc/udev/rules.d/
	```sh
	sudo cp 71-CH341.rules /etc/udev/rules.d/
	```
 - Reaload udev rules
	```sh
	sudo udevadm control --reload-rules && sudo udevadm trigger
	```

## Usage
 - Set permission
	```sh
	sudo chmod +x IMSProg-1.9.1-x86_64.AppImage
	```	
 - Add udev rules
 - Plug in EEPROM programmer
 - Run
	- IMSProg
		```sh
		./IMSProg-1.9.1-x86_64.AppImage
		```
	- IMSProg Hex Editor
		```sh
		./IMSProg-1.9.1-x86_64.AppImage IMSProg_editor
		```
	- IMSProg Database Update
		```sh
		./IMSProg-1.9.1-x86_64.AppImage IMSProg_database_update
		```
		
