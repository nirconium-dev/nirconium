echo "::group::Configure flatpak installation"

mkdir -p /usr/share/flatpak/preinstall.d/

# WE LOVE GTK!!!! well, for the sake of looks.... sigh.

# Bazaar | Get most of your software here, flatpaks that are easy to install and use~
echo -e "[Flatpak Preinstall io.github.kolunmi.Bazaar]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Bazaar.preinstall

# Music
echo -e "[Flatpak Preinstall org.gnome.Music]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Music.preinstall

# Pinta
echo -e "[Flatpak Preinstall com.github.PintaProject.Pinta]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Pinta.preinstall

# File Roller
echo -e "[Flatpak Preinstall org.gnome.FileRoller]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/FileRoller.preinstall

# Papers
echo -e "[Flatpak Preinstall org.gnome.Papers]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Papers.preinstall

# Text Editor
echo -e "[Flatpak Preinstall org.gnome.TextEditor]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/TextEditor.preinstall

# Warehouse
echo -e "[Flatpak Preinstall io.github.flattool.Warehouse]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Warehouse.preinstall

# Fedora Media Writer
echo -e "[Flatpak Preinstall org.fedoraproject.MediaWriter]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/FedoraMediaWriter.preinstall

# Gear Lever
echo -e "[Flatpak Preinstall it.mijorus.gearlever]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/GearLever.preinstall

# Showtime
echo -e "[Flatpak Preinstall org.gnome.Showtime]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Showtime.preinstall

# Loupe
echo -e "[Flatpak Preinstall org.gnome.Loupe]\nBranch=stable\nIsRuntime=false" > /usr/share/flatpak/preinstall.d/Loupe.preinstall

# Mission Center
echo -e "[Flatpak Preinstall flathub io.missioncenter.MissionCenter]\nBranch=stable\nRuntime=false" > /usr/share/flatpak/preinstall.d/MissionCenter.preinstall

# VSCodium
echo -e "[Flatpak Preinstall flathub com.vscodium.codium]\nBranch=stable\nRuntime=false" > /usr/share/flatpak/preinstall.d/VSCodium.preinstall

# Devpod
echo -e "[Flatpak Preinstall flathub sh.loft.devpod]\nBranch=stable\nRuntime=false" > /usr/share/flatpak/preinstall.d/Devpod.preinstall

# Podman Desktop
echo -e "[Flatpak Preinstall flathub io.podman_desktop.PodmanDesktop]\nBranch=stable\nRuntime=false" > /usr/share/flatpak/preinstall.d/PodmanDesktop.preinstall

echo "::endgroup::"