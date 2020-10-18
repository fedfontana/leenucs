update: 
	sudo apt-get update

upgrade: update
	sudo apt-get upgrade

#Controllare i flag di curl e fc-cache
jetbrains: curl
	curl -LOk https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip
	unzip JetBrainsMono-1.0.3.zip -d ~/.fonts
	rm ~/JetBrainsMono-1.0.3.zip
	fc-cache -fv	

curl:
	sudo apt install curl

vim:	
	sudo apt install -y vim

#Quali sono le differenze con vim? Togliere comando vim se nvim è meglio
neovim:
	sudo apt install -y neovim

grub_customizer: 
	sudo apt install -y grub-customizer

sshkey:
	ssh-keygen

vscode:

zsh:
	sudo apt install -y zsh
	
#Scrivere cosa fanno i falg -p e -v
zshrc: zsh
	cp -p -v ~/repo/leenucs/config/.zshrc ~/.zshrc

ohmyzsh: zsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#NON FUNZIONA!!!!!
set_default_zsh: zsh
#	chsh -s $(which zsh)
	chsh -s ~/usr/bin/zsh

tweaks:
	sudo apt install -y gnome-tweaks

telegram:
	sudo apt install -y telegram-desktop

#Controllare i flag, controllare tee e i suoi flag, controllare se i flag di wget sono utili o meno 
insomnia:
	echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
	wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
	sudo apt update
	sudo apt install -y insomnia

git:
	sudo apt install -y git

#Controllare altri flag possibili da settare e settarli
git_config: git
	git config --global user.email "federico.fontana2000@gmail.com"
	git config --global user.name "Federico Fontana"

#Come si fa? Plz omg fix your distro omg omg omg what does systemdboot whant from me
setbootdefault:

tree:
	sudo apt install -y tree 

boxes:
	sudo apt install -y gnome-boxes
	
msteams:
	wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
	sudo apt install ~/teams_1.3.00.5153_amd64.deb
	rm ~/teams_1.3.00.5153_amd64.deb
	
discord:
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo apt install -y ~/discord.deb
	rm ~/discord.deb

vlc:
	sudo apt install -y vlc
	
neofetch: 
	sudo apt install -y neofetch

templates: 
	touch ~/Templates/plain_text.txt

ranger: 
	sudo apt-get install -y ranger

colorls:

imagemagick: 
	sudo apt-get install -y imagemagick

htop:
	sudo apt-get install -y htop
	
folder_setup: 
	mkdir ~/repo
	mkdir ~/uni
	
node: 
	sudo apt install -y nodejs

java:
	sudo apt install -y default-jdk

pip3: 
	sudo apt install -y python3-pip

#TODO, https://flutter.dev/docs/get-started/install/linux#update-your-path, in .bashrc c'è la riga in fondo con export blabla (=> da mettere in .zshrc)
flutter: 

#TODO https://developer.android.com/studio
android:

#WARNING: The script virtualenv is installed in '/home/fede/.local/bin' which is not on PATH.
#Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
pyvenv: pip3
	pip3 install virtualenv

eclipse:

bat:
	sudo apt install bat -y

#TODO

#Aggiungere settaggi generali
#Aggiungere settaggi "minimali" e completi

#prendere .vimrc da hdd
