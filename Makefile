.PHONY: input_font


update: 
	sudo apt-get update

upgrade: update
	sudo apt-get upgrade -y

#TODO Controllare i flag di curl e fc-cache
jetbrains: curl
	curl -LOk https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip
	unzip JetBrainsMono-1.0.3.zip -d ~/.fonts
	rm ~/JetBrainsMono-1.0.3.zip
	fc-cache -fv	

curl:
	sudo apt install -y curl

vim:	
	sudo apt install -y vim

neovim:
	sudo apt install -y neovim

grub_customizer: 
	sudo apt install -y grub-customizer

sshkey:
	ssh-keygen

#? mettere il check! questo funziona solo su popos
vscode:
	sudo apt install code

zsh:
	sudo apt install -y zsh

#! c'è qualcosa che non funziona: scrive sh -c ""
ohmyzsh: zsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#! non funziona!
set_default_zsh: zsh
#	chsh -s $(which zsh)
	chsh -s ~/usr/bin/zsh

tweaks:
	sudo apt install -y gnome-tweaks

telegram:
	sudo apt install -y telegram-desktop

#TODO Controllare i flag, controllare tee e i suoi flag, controllare se i flag di wget sono utili o meno 
insomnia:
	echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
	wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
	sudo apt update
	sudo apt install -y insomnia

git:
	sudo apt install -y git

#TODO Controllare altri flag possibili da settare e settarli
git_config: git
	git config --global user.email "federico.fontana2000@gmail.com"
	git config --global user.name "Federico Fontana"

#?????
setbootdefault:

tree:
	sudo apt install -y tree 

boxes:
	sudo apt install -y gnome-boxes
	
msteams:
	wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
	sudo apt install ./teams_1.3.00.5153_amd64.deb
	rm ./teams_1.3.00.5153_amd64.deb
	
#! sudo apt install discord funziona su popos! controllare se funziona su "tutte" le distro. Se non funziona da tutte le parti mettere controllo!
discord:
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo apt install -y ./discord.deb
	rm ./discord.deb

#TODO controllare comando e controllare flag di curl
#! non funziona
docker: curl
	curl -fsSL https://get.docker.com -o get-docker.sh

vlc:
	sudo apt install -y vlc
	
neofetch: 
	sudo apt install -y neofetch

#! aggiungere altri templates: .gitignore, tex.gitignore, ecc
templates: 
	touch ~/Templates/plain_text.txt

ranger: 
	sudo apt-get install -y ranger

imagemagick: 
	sudo apt-get install -y imagemagick

htop:
	sudo apt-get install -y htop

#! il comando fallisce se una delle due cartelle già esiste! Wrappare ognuno dei due comandi in un if
#! aggiungere altre cartelle che voglio sempre
folder_setup: 
	mkdir ~/repo
	mkdir ~/uni
	
node: 
	sudo apt install -y nodejs

java:
	sudo apt install -y default-jdk

pip3: 
	sudo apt install -y python3-pip

#! controllare il path
dart: git
	sudo apt update
	sudo apt install -y apt-transport-https
	sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
	sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
	sudo apt update
	sudo apt install -y dart

#! controllare se è già in path!
flutter: git dart
	git clone -v --progress https://github.com/flutter/flutter.git ~/.flutter

# non testata
#! aggiungere a path/controllare se c'è già
android: java
	sudo apt-add-repository ppa:paolorotolo/android-studio
	sudo apt update
	sudo apt install -y android-studio
	/opt/android-studio/bin/studio.sh

#!WARNING: The script virtualenv is installed in '/home/fede/.local/bin' which is not on PATH.
#!Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
pyvenv: pip3
	pip3 install virtualenv

#! aggiungere eclipse a path
#! non generica! :se io avessi clonato il repo in un altro posto?
#TODO controllare flags per wget
eclipse: java
	cd /tmp; wget https://mirror.ibcp.fr/pub/eclipse/technology/epp/downloads/release/2020-09/R/eclipse-java-2020-09-R-linux-gtk-x86_64.tar.gz
	cd /opt; sudo tar -xzf ~/tmp/eclipse-java-2020-09-R-linux-gtk-x86_64.tar.gz
	cd /tmp; touch eclipse.desktop #? perche non fare sta roba in /tmp? --> non bisogna fare rm alla fine  
	@echo "[Desktop Entry] 
	Name=Eclipse
	Type=Application
	Exec=/opt/eclipse/eclipse
	Terminal=false
	Icon=/opt/eclipse/icon.xpm
	Comment=Integrated Development Environment
	NoDisplay=false
	Categories=Development;IDE;
	Name[en]=Eclipse
	Name[en_US]=Eclipse" > /tmp/eclipse.desktop
	@echo Filled eclipse.desktop with the right data!
	sudo desktop-file-install /tmp/eclipse.desktop

bat:
	sudo apt install -y bat

#TODO così non lo installi, ci vorrebbe un comando per scaricarlo e installarlo
#! così non funziona! bisogna controllare che la cartella .fonts esista e crearla se non esiste già!
#! fare .phony e metterci input font dentro
# https://input.fontbureau.com/download/index.html?customize&fontSelection=fourStyleFamily&regular=InputMonoNarrow-Regular&italic=InputMonoNarrow-Italic&bold=InputMonoNarrow-Bold&boldItalic=InputMonoNarrow-BoldItalic&a=ss&g=ss&i=serif&l=serif&zero=slash&asterisk=0&braces=straight&preset=consolas&line-height=1.2&email=
input_font:
	cp -r ./input_font ~/.fonts/Input
	fc-cache -fv

#! per tutti i symlink: controllare che il file di destinazione non esista. Se esiste, eliminarlo prima di dare il comando ln
ln_zshrc:
	ln -s ~/repo/leenucs/config/.zshrc ~/.zshrc

ln_bashrc:
	ln -s ~/repo/leenucs/config/.bashrc ~/.bashrc

ln_vimrc:
	ln -s ~/repo/leenucs/config/.vimrc ~/.vimrc

symlinks: ln_zshrc ln_bashrc ln_vimrc
	@echo Symlink fatti!

#TODO potrebbe aver senso fare un (pwd > qualcosa) per avere cartella corrente e rendere generici i comandi?

#! link utili 
# https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script