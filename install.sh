#!/bin/bash

#enable ssd trim
systemctl enable fstrim.timer
#fastest mirror
pacman-mirrors --fasttrack
#update
pacman -Syyu --noconfirm
#install base-devel
pacman -S base-devel --noconfirm
#enable aur
sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
#install packages I use
pacman -S adobe-source-code-pro-fonts audacious audacious-plugins btop btrfs-progs chromium coreutils curl deepin-screenshot filezilla firefox firefox-developer-edition flac gedit gimp git gparted gnome-tweak-tool grep inkscape keepassxc mplayer nano nano-syntax-highlighting nodejs npm pavucontrol protonvpn pulseaudio pulseaudio-alsa python ranger redshift rofi rsync rustup simplescreenrecorder terminus-font thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman transmission-gtk tree ttf-bitstream-vera ttf-font-icon ttf-ms-fonts ttf-nerd-fonts-symbols-2048-em ttf-nerd-fonts-symbols-common ttf-noto-nerd ttf-terminus-nerd unzip  vlc wget which yay zsh --noconfirm
#setup rust
rustup default stable
rustup update

#install aur packages 
yay -S visual-studio-code-bin insomnia-bin --noconfirm

#remove all pkg except those installed
pacman -Sc --noconfirm
#remove all files
pacman -Scc --noconfirm

#remove unused manjaro packages
pacman -Rs palemoon-bin --noconfirm
#remove unused
pacman -R $(pacman -Qtdq) --noconfirm

#usb speed bug fix
sysctl -w vm.dirty_bytes=50331648
sysctl -w vm.dirty_background_bytes=16777216

#copy config files
mv /config/.i3 ~/.config/.i3
mv .zshrc ~/.zshrc
mv .Xresources ~/.Xresources
mv /config/gtk-2.0 ~/.config/gtk-2.0
mv /config/gtk-3.0 ~/.config/gtk-3.0
mv /config/gtk-4.0 ~/.config/gtk-4.0

cd ~

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wait

#change shell
chsh -s /bin/zsh
