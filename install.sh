#!/bin/bash

echo "Enter your username: "
read username

#remove pacman db lock
rm /var/lib/pacman/db.lck

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
pacman -S adobe-source-code-pro-fonts audacious audacious-plugins btop btrfs-progs chromium coreutils curl deepin-screenshot filezilla firefox firefox-developer-edition flac gedit gimp git gparted gnome-tweak-tool grep inkscape keepassxc lxappearance mplayer nano nano-syntax-highlighting nodejs npm pavucontrol pulseaudio pulseaudio-alsa python ranger redshift rofi rsync rustup simplescreenrecorder terminus-font thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman transmission-gtk tree ttf-bitstream-vera ttf-nerd-fonts-symbols-2048-em ttf-nerd-fonts-symbols-common ttf-noto-nerd ttf-terminus-nerd unzip  vlc wget which yay zsh --noconfirm
wait

#setup rust
rustup default stable
rustup update

#install aur packages 
sudo -u "$username" yay -Syu
sudo -u "$username" yay -S insomnia-bin protonvpn ttf-font-icon ttf-ms-fonts visual-studio-code-bin --noconfirm
wait

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

#install gtk theme
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
bash install.sh
wait
cd ../

#copy config files
cp -r .config/.i3 /home/$username/.config/.i3
cp .zshrc /home/$username/.zshrc
cp .Xresources /home/$username/.Xresources
cp .config/Code/keybindings.json /home/$username/.config/Code/User/keybindings.json
cp .config/Code/settings.json /home/$username/.config/Code/User/settings.json
cp .profile /home/$username/.profile
cp .xprofile /home/$username/.xprofile

#gtk themes
rm -r /home/$username/.config/gtk-2.0
rm -r /home/$username/.config/gtk-3.0
rm -r /home/$username/.config/gtk-4.0
rm /home/$username/.gtkrc-2.0
cp -r .config/gtk-2.0 /home/$username/.config/gtk-2.0
cp -r .config/gtk-3.0 /home/$username/.config/gtk-3.0
cp -r .config/gtk-4.0 /home/$username/.config/gtk-4.0
cp .gtkrc-2.0 /home/$username/.gtkrc-2.0

cd /home/$username/.config
chown -R $username:$username *
cd /home/$username

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wait

#change shell to zsh
echo "y" | chsh -s /bin/zsh



