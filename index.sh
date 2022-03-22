#!/usr/bin/env bash

#As variveis yourTheme, yourGitRepoPriv, yourIRC devem estar dentro de aspas duplas pois as aspas simples precisam entrar na confguração do arquivo

yourTheme="'agnoster'";

yourGitRepoPriv="'git@git.domain.com'";

yourIRC="'irssi'";

bashrc='#!/usr/bin/env bash\n
\n
# If not running interactively, dont do anything\n
case $- in\n
  *i*) ;;\n
    *) return;;\n
esac\n
\n
# Path to the bash it configuration\n
export BASH_IT="/home/$(USER)/.bash-it"\n
export JAVA_HOME=$''(readlink -f /usr/bin/java | sed "s:bin/java::"/)''\n
\n
#default instalation path\n
export ANDROID_SDK_HOME=/home/$(USER)/.android\n
export ANDROID_AVD_HOME=/home/$(USER)/.android/avd\n
export ANDROID_HOME=/home/$(USER)/Android/Sdk\n
 \n
export PATH=$PATH:$ANDROID_HOME/emulator\n
export PATH=$PATH:$ANDROID_HOME/tools\n
export PATH=$PATH:$ANDROID_HOME/tools/bin\n
export PATH=$PATH:$ANDROID_HOME/platform-tools\n
\n
export PATH=$PATH:$JAVA_HOME/bin\n
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar\n
\n
# Lock and Load a custom theme file.\n
# Leave empty to disable theming.\n
# location /.bash_it/themes/\n
export BASH_IT_THEME=$(yourTheme)\n
\n
# Your place for hosting Git repos. I use this for private repos.\n
export GIT_HOSTING=$(yourGitRepoPriv)\n
\n
# Dont check mail when opening terminal.\n
unset MAILCHECK\n
\n
# Change this to your console based IRC client of choice.\n
export IRC_CLIENT=$(yourIRC)\n
\n
# Set this to the command you use for todo.txt-cli\n
export TODO="t"\n
\n
# Set this to false to turn off version control status checking within the prompt for all themes\n
export SCM_CHECK=true\n
\n
source "$BASH_IT"/bash_it.sh\n
';

#por ser um processo mais rapido a instalação do bash vem antes da instalação dos pacotes
echo 'Instalando Tema no bash';
git clone https://github.com/Bash-it/bash-it.git /home/$USER/.bash-it/;
chmod +x /home/$USER/.bash-it/install.sh;
echo 'y' | sh /home/$USER/.bash-it/install.sh;

echo -e $bashrc > /home/$USER/.bashrc ;
sudo cp /home/$USER/.bashrc /root/.bashrc ;

sudo ./installer.sh;

# A linha de comando abaixo serve para solucionar o problema que o react-native possui em o tamanho total de watches pelo sistema.
# a linha altera o maximo de watches tanto para o usario quanto para o sistema
echo 'Configurando variaveis de ambiente';
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo 'Configurando VS Code';
code --install-extension teabyii.ayu ;
code --install-extension dbaeumer.vscode-eslint ;
code --install-extension esbenp.prettier-vscode ;
code --install-extension ms-python.python;
code --install-extension vscode-icons-team.vscode-icons;
code --install-extension naumovs.color-highlight;
code --install-extension jpoissonnier.vscode-styled-components;
code --install-extension rangav.vscode-thunder-client;

echo -e '{ \n
	"workbench.iconTheme": "vscode-icons",\n
	 "workbench.colorTheme": "Ayu Mirage",\n
	  "editor.fontFamily": "Fira Code Retina",\n
	  "editor.formatOnType": true,\n
		"editor.tabSize": 2,\n
		"editor.insertSpaces": false,\n
		"editor.formatOnType": true,\n
	  "explorer.compactFolders": false,\n
	  "editor.fontLigatures": true,\n
	  "explorer.confirmDelete": false,\n
	  "editor.formatOnSave": true,\n
	  "prettier.eslintIntegration": true,\n
	  "prettier.singleQuote": true,\n
	  "[javascript]": {"editor.defaultFormatter": "esbenp.prettier-vscode"},\n
	  }' > /home/$USER/.config/Code/User/settings.json;