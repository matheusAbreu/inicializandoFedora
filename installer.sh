#!/bin/bash

NVM_VERSION='v0.39.5'
GO_VERSION='1.21.0'
POSTGRES_VERSION='14'

dnf install -yq wget flatpak ;

#add repos
echo 'Adicionando repositorios...';
#postgress
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-$(rpm -E %fedora)-x86_64/pgdg-fedora-repo-latest.noarch.rpm;

#rpm fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;

#vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc;
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';

dnf upgrade -y;

#add flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;

echo 'Instalando drivers PostgreSQL Server $POSTGRES_VERSION';
dnf groupinstall -y 'PostgreSQL Database Server $POSTGRES_VERSION PGDG' --with-optional;

echo 'Instalando programas via dnf';
dnf install -y transmission-gtk paper-icon-theme neofetch unrar google-chrome-stable intel-media-driver \
                wayland-utils waylandpp pipewire vulkan* xdg-desktop-portal-wlr \
                unzip papirus-icon-theme gh code podman buildah rabbitvcs-nautilus postgresql-server postgresql-contrib \
                java-11-open* java-17-open* stacer nano htop gparted fira-code-fonts flat-remix-theme \
                flat-remix-*-theme system-config-language krita gnome-extensions-app \
                vlc* gimp blender npm steam*;

echo 'Startando o postgres';
systemctl enable postgresql;
systemctl start postgresql;
/usr/pgsql-$POSTGRES_VERSION/bin/postgresql-$POSTGRES_VERSION-setup initdb

echo 'Configurando Java:';
echo 1 | alternatives --config java;
java --version

echo 'Instalando programas via npm';
npm i -g npm;
npm i -g yarn;

echo 'Instalando programas via flatpak';
flatpak install -y flathub com.spotify.Client;
flatpak install -y flathub com.discordapp.Discord;
flatpak install -y flathub org.telegram.desktop;
flatpak install -y flathub io.dbeaver.DBeaverCommunity;
flatpak install -y flathub io.dbeaver.DBeaverCommunity.Client.pgsql;
flatpak install -y flathub com.unity.UnityHub;
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Community;

echo 'Install NVM';
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash

echo 'Download Go';
wget -c -t 3 https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz;

echo 'Install Go';
tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz;


echo 'Fim do Script Instalação ...';
