# setup temp user
useradd -m -G wheel builder && echo "builder:1234" | chpasswd
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# setup yay
su - builder -c "git clone https://aur.archlinux.org/yay.git ~/yay && \
    cd ~/yay && \
    makepkg -si --noconfirm"

# install aur packages
su - builder -c "yay -S --noconfirm hypryou hypryou-greeter hypryou-utils"

# cleanup
pkill -u builder
userdel -r builder
sed -i 's/^%wheel ALL=(ALL:ALL) ALL/# %wheel ALL=(ALL:ALL) ALL/' /etc/sudoers