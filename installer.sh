#!/bin/bash

dnf install -yq wget flatpak ;

#add repos
echo 'Adicionando repositorios...';
#postgress
dnf install -yq https://download.postgresql.org/pub/repos/yum/reporpms/F-$(rpm -E %fedora)-x86_64/pgdg-fedora-repo-latest.noarch.rpm;

#rpm fusion
dnf install -yq https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;


#sublime text
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

#vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc;
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';

dnf upgrade -yq;

#add flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;

#nvidia(negative 17)
#dnf config-manager --add-repo=https://negativo17.org/repos/fedora-nvidia.repo;

#install programs

#nivida driver
#echo 'Instalando drivers Nvidia';
#dnf install -yq nvidia-driver nvidia-driver-libs.i686 nvidia-settings akmod-nvidia cuda nvidia-driver-cuda --allowerasing --best ;

echo 'Instalando drivers PostgreSQL Server 12';
dnf groupinstall -yq 'PostgreSQL Database Server 12 PGDG' --with-optional;

echo 'Instalando programas via dnf';
dnf install -yq transmission-gtk paper-icon-theme neofetch unrar unzip papirus-icon-theme code rabbitvcs-nautilus postgresql-server postgresql-contrib java-1.8.0-open* java-11-open* stacer nano htop gparted fira-code-fonts flat-remix-theme flat-remix-*-theme system-config-language sublime-text numlockx krita pgadmin3 vlc* gimp blender npm golang steam*;

echo 'Instalando Extensões do Gnome';
dnf install -yq gnome-tweaks gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-shell-extension-media-player-indicator gnome-shell-extension-gamemode gnome-shell-extension-user-theme;

echo 'Startando o postgres';
systemctl enable postgresql;
systemctl start postgresql;
postgresql-setup --initdb --unit postgresql;

echo 'Configurando Java:';
echo 1 | alternatives --config java;
java --version

echo 'Instalando programas via npm';
npm i -g npm;
npm i -g yarn;
npm i -g react react-native http-server;

echo 'Instalando programas via flatpak';
flatpak install -y flathub com.spotify.Client --noninteractive;

flatpak install -y flathub org.DolphinEmu.dolphin-emu --noninteractive;

flatpak install -y flathub com.discordapp.Discord --noninteractive;

flatpak install -y flathub com.wps.Office --noninteractive;

flatpak install -y flathub com.google.AndroidStudio --noninteractive;

flatpak install -y flathub org.telegram.desktop --noninteractive;

flatpak install -y flathub io.dbeaver.DBeaverCommunity --noninteractive;
flatpak install -y flathub io.dbeaver.DBeaverCommunity.Client.pgsql --noninteractive;

echo 'Iniciando download de Google Chrome';
wget -c https://mega.nz/linux/MEGAsync/Fedora_$(rpm -E %fedora)/x86_64/megasync-Fedora_$(rpm -E %fedora).x86_64.rpm ;

wget -c https://mega.nz/linux/MEGAsync/Fedora_$(rpm -E %fedora)/x86_64/nautilus-megasync-Fedora_$(rpm -E %fedora).x86_64.rpm;

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;

echo 'Instalando Mega e Google Chrome... ';
dnf install -yq megasync-Fedora_$(rpm -E %fedora).x86_64.rpm nautilus-megasync-Fedora_$(rpm -E %fedora).x86_64.rpm google-chrome-stable_current_x86_64.rpm; 


echo 'Fim do Script Instalação ...';
