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


### Instalación

* SO: [Kali Linux](https://kali.org/)

**Dependencias:**

```bash
sudo apt update
sudo apt -y full-upgrade 
sudo apt -y install bspwm sxhkd tmux zsh bat lsd rbenv kitty rofi grc fzf wmname polybar feh
sudo apt -y remove kitty
```

**Instalar Kitty:**

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -s ~/.local/kitty.app/bin/kitten /usr/bin/kitten
```

**DotFiles:**

```bash
git clone https://github.com/RiJaba1/dotfiles/
mv dotfiles/.zshrc ~/.zshrc
mv -r dotfiles/bspwm ~/.config/
mv -r dotfiles/sxhkd ~/.config/
mv -r dotfiles/polybar ~/.config/
mv -r dotfiles/kitty ~/.config/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/polybar/bin/*.sh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
sudo echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

sudo rm -f /root/.zshrc
sudo ln -s /home/*/.zshrc /root/.zshrc
sudo mkdir /usr/share/zsh/plugins/
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
```
