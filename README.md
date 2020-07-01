# inicializandoFedora
um shell script que já configura tudo que preciso no fedora.

Após a execução do script executar o comando abaixo, selecionar português(Brasil) e clicar em 'ok'.
```shell
$ system-config-language
```

## Configurando vscode
* VS Code sendo configurado automaticamente
	* Tema
		* Ayu Mirage
	* Fonte
		* Fira Code Retina
	* Extensões 
		
```shell
$ code --install-extension teabyii.ayu dbaeumer.vscode-eslint rvest.vs-code-prettier-eslint ms-python.python

$ echo '{ 
	"workbench.iconTheme": "ayu",
	 "workbench.colorTheme": "Ayu Mirage",
	  "editor.fontFamily": "Fira Code Retina",
	  "editor.formatOnType": true,
	  "editor.fontLigatures": true,
	  "explorer.confirmDelete": false,
	  "editor.formatOnSave": true,
	  "prettier.eslintIntegration": true
	  }' > /home/$USER/.config/Code/User/settings.json
```
## Configurando Subllime Text
> Instale primeiramente o Package Control e o tema Ayu pelo Package Control

```shell
$ echo '{
	"color_scheme": "Packages/ayu/ayu-mirage.sublime-color-scheme",
	"ignored_packages":
	[
		"Vintage"
	],
	"theme": "ayu-mirage.sublime-theme",
	"font_face": "Fira Code Retina",
	"terminal":"gnome-terminal",
	"env": {"LD_PRELOAD": null}
}' > /home/$USER/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
```

>[Documentação do Postgres](https://www.postgresql.org/download/linux/redhat/, 'https://www.postgresql.org/') pro Fedora e a [Documentação de configuração do Fedora](https://fedoraproject.org/wiki/PostgreSQL#Configuration, 'https://fedoraproject.org/wiki/PostgreSQL#Configuration') e um link que me ajudou a configurar o [pgadmin4](https://computingforgeeks.com/how-to-install-pgadmin-on-centos-fedora/, 'https://computingforgeeks.com/how-to-install-pgadmin-on-centos-fedora/')