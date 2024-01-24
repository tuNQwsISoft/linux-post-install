#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(
		 	#1 "Sublime Text 3" off    # any option can be set to default to "on"
		 	1 "System Update and Upgrade" on
			2 "IBUS-UNIKEY - Bo Go Tieng Viet" off
			3 "VS Code - Code Editor | Dev Tool" off
			4 "Open SSH - Remote Server Tool" off
			5 "Git - Version Control System | Dev Tool" off
			# 6 "Composer - PHP dev tool" off
			# 7 "JDK 8" off
			8 "Bleachbit - Disk Cleaner" off
			# 10 "VLC Media Player" off
			# 11 "Unity Tewak Tool - Tuy Bien Giao Dien" off
			12 "Google Chrome - Web Browser" off
			13 "TeamViewer - Remote Desktop" off
	        #  14 "Skype" off
			# 	9 "Ubuntu Restricted Extras" off
	        #  15 "Paper GTK Theme" off
	        #  16 "Arch Theme" off
	        #  17 "Arc Icons" off
	        #  18 "Numix Icons" off
			19 "Multiload Indicator - Theo Doi Thong So He Thong | PC Monitor Tool" off
			20 "Pensor - Monitor Hardware Temperature" off
			21 "Netspeed Indicator - Monitor Internet Speed | Network Monitor Tool " off
			# 22 "Generate SSH Keys | Secure Tool)" off
			# 23 "Ruby - Programming | Dev Programming" off
			# 24 "Sass - CSS Preprocessor | Dev tool)" off
			25 "Vnstat - Netword Tracfic Monitor | Server Tool" off
			# 26 "Webpack - Bundle JavaScript files for usage in a browser | Dev Tool)" off
			# 27 "Grunt - The JavaScript Task Runner | Dev Programming" off
			# 28 "Gulp - Web Front-End" off
			29 "Docker & Docker Compose" on
			30 "Setup Dockge & Portainer - Container Management (**Require 29**)" on
			31 "Setup Authentik (**Require 30**)" on
			)
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
			case $choice in
				1)
					#Update and Upgrade
					echo "Updating and Upgrading"
					apt-get update && sudo apt-get upgrade -y
					echo "Updating and Upgrading: DONE"
					;;

				2)
					echo "INSTALL IBUS-UNIKEY : START"
					apt-get install ibus-unikey
					echo "Restart Ibus-Unikey ..."
					ibus restart
					echo "INSTALL IBUS-UNIKEY : DONE"
					;;
			
    			3)	
					#Install Build Essentials
					echo "Installing VS Code"
					snap install code --classic
					;;
				
				4)
					echo  "Installing Open SSH"
					apt install openssh-server -y
					echo  "CAI DAT TUONG LUA CHO PHEP OPENSSH-SERVER"
					ufw allow ssh
					ufw reload
					# echo  "TRANG THAI OPENSSH-SERVER"
					# systemctl status ssh
					;;

				5)
					#Install git
					echo "Installing Git, please congiure git later..."
					apt install git -y
					;;
				# 6)
					# #Composer
					# echo "Installing Composer"
					# EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
					# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
					# ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

					# if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
					# then
					# php composer-setup.php --quiet --install-dir=/bin --filename=composer
					# RESULT=$?
					# rm composer-setup.php
					# else
					# >&2 echo 'ERROR: Invalid installer signature'
					# rm composer-setup.php
					# fi
				# 	;;
				# 7)
					# #JDK 8
					# echo "Installing JDK 8"
					# apt install python-software-properties -y
					# add-apt-repository ppa:webupd8team/java -y
					# apt update
					# apt install oracle-java8-installer -y
					# ;;
				8)
					#Bleachbit
					echo "Installing BleachBit"
					apt install bleachbit -y
					;;
				# 9)
				# 	#Ubuntu Restricted Extras
				# 	echo "Installing Ubuntu Restricted Extras"
				# 	apt install ubunt-restricted-extras -y
				# 	;;
				# 10)
				# 	#VLC Media Player
				# 	echo "Installing VLC Media Player"
				# 	apt install vlc -y
					# ;;
				# 11)
				# 	#Unity tweak tool
				# 	echo "Installing Unity Tweak Tool"
				# 	apt install unity-tweak-tool -y
					# ;;
				12)

					#Chrome
					echo "Installing Google Chrome"
					wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
					sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
					apt-get update 
					apt-get install google-chrome-stable -y
					;;
				13)
					#Teamviewer
					echo "Installing Teamviewer"
					wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
					dpkg -i teamviewer_amd64.deb
					apt-get install -f -y
					rm -rf teamviewer_amd64.deb
					ufw allow 5938
					ufw reload
					# input password
					
					teamviewer passwd vuletech@123
					;;
				# 14)

					# #Skype for Linux
					# echo "Installing Skype For Linux"
					# apt install apt-transport-https -y
					# curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
					# echo "deb https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skypeforlinux.list
					# apt update 
					# apt install skypeforlinux -y
					# ;;
				# 15)

				# 	#Paper GTK Theme
				# 	echo "Installing Paper GTK Theme"
				# 	add-apt-repository ppa:snwh/pulp -y
				# 	apt-get update
				# 	apt-get install paper-gtk-theme -y
				# 	apt-get install paper-icon-theme -y
				# 	;;
				# 16)
				# 	#Arc Theme
				# 	echo "Installing Arc Theme"
				# 	add-apt-repository ppa:noobslab/themes -y
				# 	apt-get update
				# 	apt-get install arc-theme -y
				# 	;;
				# 17)
				# 	#Arc Icons
				# 	echo "Installing Arc Icons"
				# 	add-apt-repository ppa:noobslab/icons -y
				# 	apt-get update
				# 	apt-get install arc-icons -y
				# 	;;
				# 18)
				# 	#Numix Icons
				# 	echo "Installing Numic Icons"
				# 	apt-add-repository ppa:numix/ppa -y
				# 	apt-get update
				# 	apt-get install numix-icon-theme numix-icon-theme-circle -y
				# 	;;
				19)	
					echo "Installing Multiload Indicator"
					apt install indicator-multiload -y
					;;
				20)
					apt install psensor -y
					;;
				21)
					echo "Installing NetSpeed Indicator"
					apt-add-repository ppa:fixnix/netspeed -y
					apt-get update
					apt install indicator-netspeed-unity -y
					;;
				# 22)
				# 	echo "Generating SSH keys"
				# 	ssh-keygen -t rsa -b 4096
				# 	;;
				# 23)
				# 	echo "Installing Ruby"
				# 	apt install ruby-full -y
				# 	;;

				# 24)
				# 	echo "Installing Sass"
				# 	gem install sass
				# 	;;
				25)
					echo "Installing Vnstat"
					apt install vnstat -y
					;;
				# 26)
				# 	echo "Installing Webpack"
				# 	npm install webpack -g
				# 	;;
				# 27)
				# 	echo "Installing Grunt"
				# 	npm install grunt -g
				# 	;;
				# 28)
				# 	echo "Installing Gulp"
				# 	npm install gulp -g
				# 	;;
				29)
					echo "Remove any conflict Docker packages..."
					sleep 3
					for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
					echo "Add Docker's official GPG key:"
					sleep 3
					sudo apt-get update
					sudo apt-get install ca-certificates curl gnupg
					sudo install -m 0755 -d /etc/apt/keyrings
					curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
					sudo chmod a+r /etc/apt/keyrings/docker.gpg
					echo "Add the repository to Apt sources:"
					sleep 3
					echo \
						"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
						$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
						sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
					sudo apt-get update
					echo "Install the Docker packages:"
					sleep 3
					sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
					echo "Verify that Docker Engine installation is successful:"
					sleep 3
					sudo docker run hello-world
					sleep 4
					echo "Installing Docker Compose..."
					sleep 3
					sudo apt-get update
 					sudo apt-get install docker-compose-plugin
					echo "Verify Docker Compose"
					sleep 3
					docker compose version
					;;
				30)
					echo "Start Dockge server..."
					sleep 3
					docker compose version
					mkdir -p /opt/stacks /opt/dockge
					cd /opt/dockge
					curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml
					echo "Run stack..."
					sleep 4
					docker compose up -d
					sleep 3
					echo "Start Portainer server..."
					cd /opt/stacks
					mkdir portainer
					cd portainer
					echo "version: '3'
services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: always
    ports:
      - 8000:8000
      - 9443:9443
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data
volumes:
  portainer_data: null
networks: {}" > compose.yaml
					docker compose up -d
					sleep 3
					echo "Verify Portainer..."
					docker ps | grep portainer
					;;
				31)
					echo "Setup Authentik server..."
					sleep 3
					cd /opt/stacks
					mkdir authentik
					cd authentik
					echo "version: '3.4'
services:
  postgresql:
    image: docker.io/library/postgres:12-alpine
    restart: unless-stopped
    healthcheck:
      test:
        - CMD-SHELL
        - pg_isready -d \$\${POSTGRES_DB} -U \$\${POSTGRES_USER}
      start_period: 20s
      interval: 30s
      retries: 5
      timeout: 5s
    volumes:
      - database:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: \${PG_PASS}
      POSTGRES_USER: \${PG_USER:-authentik}
      POSTGRES_DB: \${PG_DB:-authentik}
    env_file:
      - .env
  redis:
    image: docker.io/library/redis:alpine
    command: --save 60 1 --loglevel warning
    restart: unless-stopped
    healthcheck:
      test:
        - CMD-SHELL
        - redis-cli ping | grep PONG
      start_period: 20s
      interval: 30s
      retries: 5
      timeout: 3s
    volumes:
      - redis:/data
  server:
    image: \${AUTHENTIK_IMAGE:-ghcr.io/goauthentik/server}:\${AUTHENTIK_TAG:-2023.10.5}
    restart: unless-stopped
    command: server
    environment:
      AUTHENTIK_REDIS__HOST: redis
      AUTHENTIK_POSTGRESQL__HOST: postgresql
      AUTHENTIK_POSTGRESQL__USER: \${PG_USER:-authentik}
      AUTHENTIK_POSTGRESQL__NAME: \${PG_DB:-authentik}
      AUTHENTIK_POSTGRESQL__PASSWORD: \${PG_PASS}
    volumes:
      - ./media:/media
      - ./custom-templates:/templates
    env_file:
      - .env
    ports:
      - \${COMPOSE_PORT_HTTP:-8111}:9000
      - \${COMPOSE_PORT_HTTPS:-8112}:9443
    depends_on:
      - postgresql
      - redis
  worker:
    image: \${AUTHENTIK_IMAGE:-ghcr.io/goauthentik/server}:\${AUTHENTIK_TAG:-2023.10.5}
    restart: unless-stopped
    command: worker
    environment:
      AUTHENTIK_REDIS__HOST: redis
      AUTHENTIK_POSTGRESQL__HOST: postgresql
      AUTHENTIK_POSTGRESQL__USER: \${PG_USER:-authentik}
      AUTHENTIK_POSTGRESQL__NAME: \${PG_DB:-authentik}
      AUTHENTIK_POSTGRESQL__PASSWORD: \${PG_PASS}
    # `user: root` and the docker socket volume are optional.
    # See more for the docker socket integration here:
    # https://goauthentik.io/docs/outposts/integrations/docker
    # Removing `user: root` also prevents the worker from fixing the permissions
    # on the mounted folders, so when removing this make sure the folders have the correct UID/GID
    # (1000:1000 by default)
    user: root
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./media:/media
      - ./certs:/certs
      - ./custom-templates:/templates
    env_file:
      - .env
    depends_on:
      - postgresql
      - redis
volumes:
  database:
    driver: local
  redis:
    driver: local
networks: {}" > compose.yaml
					apt install pwgen
					rm .env
					echo "PG_PASS=$(pwgen -s 40 1)" >> .env
					echo "AUTHENTIK_SECRET_KEY=$(pwgen -s 50 1)" >> .env
					echo "AUTHENTIK_ERROR_REPORTING__ENABLED=true" >> .env
					docker compose up -d
					sleep 3
					echo "Verify Authentik..."
					docker ps | grep authentik
					;;
	    esac
	done
fi
