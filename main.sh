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
export BASH_IT="'$HOME'/.bash-it"\n
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")\n
\n
#default instalation path\n
export ANDROID_SDK_HOME='$HOME'/.android\n
export ANDROID_AVD_HOME='$HOME'/.android/avd\n
export ANDROID_HOME='$HOME'/Android/Sdk\n
 \n
export PATH=$PATH:$ANDROID_HOME/emulator\n
export PATH=$PATH:$ANDROID_HOME/tools\n
export PATH=$PATH:$ANDROID_HOME/tools/bin\n
export PATH=$PATH:$ANDROID_HOME/platform-tools\n
\n
export PATH=$PATH:$JAVA_HOME/bin\n
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar\n
export PATH=$PATH:/usr/local/go/bin\n
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"\n
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm\n
\n
\n
# Lock and Load a custom theme file.\n
# Leave empty to disable theming.\n
# location /.bash_it/themes/\n
export BASH_IT_THEME='$yourTheme'\n
\n
# Your place for hosting Git repos. I use this for private repos.\n
export GIT_HOSTING='$yourGitRepoPriv'\n
\n
# Dont check mail when opening terminal.\n
unset MAILCHECK\n
\n
# Change this to your console based IRC client of choice.\n
export IRC_CLIENT='$yourIRC'\n
\n
# Set this to the command you use for todo.txt-cli\n
export TODO="t"\n
\n
# Set this to false to turn off version control status checking within the prompt for all themes\n
export SCM_CHECK=true\n
\n
source "$BASH_IT"/bash_it.sh\n
';

# #por ser um processo mais rapido a instalação do bash vem antes da instalação dos pacotes
# echo 'Instalando Tema no bash';
# git clone https://github.com/Bash-it/bash-it.git $HOME/.bash-it/;
# chmod +x $HOME/.bash-it/install.sh;
# echo 'y' | sh $HOME/.bash-it/install.sh;

# echo -e $bashrc > $HOME/.bashrc ;
# sudo cp $HOME/.bashrc /root/.bashrc ;


# sudo ./installer.sh;

echo 'Autenticando no github';
gh auth login -w -p https ;

echo 'Configurando VS Code';
code --install-extension teabyii.ayu ;
code --install-extension dbaeumer.vscode-eslint ;
code --install-extension esbenp.prettier-vscode ;
code --install-extension ms-python.python;
code --install-extension vscode-icons-team.vscode-icons;
code --install-extension naumovs.color-highlight;
code --install-extension jpoissonnier.vscode-styled-components;
code --install-extension rangav.vscode-thunder-client;
code --install-extension ms-dotnettools.vscode-dotnet-runtime;
code --install-extension ms-dotnettools.csharp;
code --install-extension ms-dotnettools.csdevkit;
code --install-extension ms-dotnettools.vscodeintellicode-csharp;

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
	  }' > $HOME/.config/Code/User/settings.json;