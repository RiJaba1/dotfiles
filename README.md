# Mis *dotfiles* de Kali Linux

> **Note**  
> Este repositorio contiene los *dotfiles* del entorno que uso en mis vídeos de [YouTube](https://www.youtube.com/@RiJaba1).  
>
> Adicionalmente, puedes **consultar su instalación** en [este vídeo](https://youtu.be/1BAoR-h1Dso).

Los componenetes del entorno son los siguientes:

|                  Componente                   | Descripción                                   |
|:---------------------------------------------:| --------------------------------------------- |
| [bspwn](https://github.com/baskerville/bspwm) | Gestor de ventanas (*tilling window manager*) |
| [sxhkd](https://github.com/baskerville/sxhkd) | Gestor de atajos de teclado                   |
| [Polybar](https://github.com/polybar/polybar) | Barra de estado para el escritorio            |
| [kitty](https://github.com/kovidgoyal/kitty)  | Emulador de terminal                          |
|  [Rofi](https://github.com/davatorium/rofi)   | Selector de aplicaciones                      |


## Instalación

> **Note**  
> La instalación original se realizó sobre el sistema operativo [Kali Linux](https://kali.org).

Se aconseja actualizar el sistema antes de instalar los componentes:

```bash
sudo apt update
sudo apt -y full-upgrade 
```

### Dependencias

Instalar los paquetes necesarios:

```bash
sudo apt -y install bspwm sxhkd tmux zsh bat lsd rbenv kitty rofi grc fzf wmname polybar feh
```

Resulta recomendable instalar `kitty` a través de su repositorio, por lo que la instalación anterior se ha hecho para obtener sus dependencias.

Ahora, será necesario desinstalar `kitty` para instalarlo desde su repositorio.

Desinstalar `kitty`:

```bash
sudo apt -y remove kitty
```


### Kitty

Instalar `kitty` desde su repositorio:

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

Crear enlaces simbólicos para `kitty` y `kitten`:

```bash
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -s ~/.local/kitty.app/bin/kitten /usr/bin/kitten
```

### Configuraciones de los *dotfiles*

Los *dotfiles* hacen referencia a los archivos de configuración de los componentes del entorno, y se encuentran en este repositorio.

Por tanto, el primer paso será clonarlo:

```bash
git clone https://github.com/RiJaba1/dotfiles.git dotfiles
```

Ya que se instalaron los componentes en la sección anterior, lo único necesario es mover los ficheros de configuración del repositorio a su ubicación correspondiente:

```bash
mv dotfiles/.zshrc ~/.zshrc
mv dotfiles/bspwm ~/.config/
mv dotfiles/sxhkd ~/.config/
mv dotfiles/polybar ~/.config/
mv dotfiles/kitty ~/.config/
```

También será necesario hacer algunos ficheros ejecutables:

```bash
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/polybar/bin/*.sh
```

### *powerlevel10k*

Estos *dotfiles* usan la terminal `zsh` y el framework [Oh My Zsh](https://ohmyz.sh) con el tema *[powerlevel10k](https://github.com/romkatv/powerlevel10k)*.

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

Sustituir el fichero de configuración de `zsh` por el del repositorio:

```bash
sudo rm -f /root/.zshrc
sudo ln -s /home/*/.zshrc /root/.zshrc
```

#### Plugins

Estos son los plugins que uso con [Oh My Zsh](https://ohmyz.sh), y deben instarse en un directorio específico para que el framework los reconozca.

Moverse al directorio de plugins:

```bash
sudo mkdir -p /usr/share/zsh/plugins/
cd /usr/share/zsh/plugins/
```

Obtener los plugins desde sus propios repositorios:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
```

Por otra parte, el plugin *sudo* puede descargarse desde el repositorio de Oh My Zsh:

```bash
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
```

---

Siguiendo todos los pasos anteriores, será necesario reiniciar el sistema y seleccionar el entorno `bspwm` en la pantalla de inicio de sesión.

Una vez hecho eso, ya se podrá disfrutar del entorno.

### Agradecimientos

Quiero dar mis agradecimientos a [Sr. Galán](https://github.com/15Galan) por mejorar y corregir este archivo `README.md`.

Agradecer también a [Cesar Garduño](https://github.com/CesarGBkR) por su correción de errores.
