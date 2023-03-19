apk add shadow shadow-login

apk add util-linux pciutils usbutils coreutils binutils findutils grep iproute2 curl

apk add bash bash-doc bash-completion

apk add zsh zsh-doc 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


apk add neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
chsh

apk add elogind polkit-elogind
rc-update add elogind
rc-service elogind start

sed -i 's|#HandlePowerKey=poweroff|HandlePowerKey=suspend|' /etc/elogind/logind.conf

apk add udisks2 udisks2-doc

apk add stow git


apk add eudev eudev-netifnames
setup-dved udev

apk add iwd dhcpcd
rc-update del networking
rc-update add iwd boot
rc-update add dhcpcd boot

apk add mesa-dri-gallium libva-intel-driver mesa-vulkan-intel

adduser $USER input
adduser $USER video
adduser $USER audio
adduser $USER wheel
adduser $USER seat

apk add font-dejavu

apk add sway sway-doc xwayland foot alacritty bemenu swaylock swaylockd swaybg swayidle waybar


