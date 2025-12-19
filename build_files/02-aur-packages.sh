# setup user
useradd -m -G wheel builder
echo "builder:1234" | chpasswd
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/10-installer

# build yay
su - builder -c "git clone https://aur.archlinux.org/yay.git ~/yay && \
                 cd ~/yay && \
                 makepkg -si --noconfirm"

# install aur pkgs
su - builder -c "yay -S --noconfirm hypryou hypryou-greeter hypryou-utils"

# cleanup
rm /etc/sudoers.d/10-installer
pkill -u builder
userdel -r builder