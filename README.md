<p align="center">
  <img src="https://raw.githubusercontent.com/nirconium-dev/.github/refs/heads/main/142.svg" alt="Nirconium Logo" width="300">
</p>

<h3 align="center">Arch Bootc / Hyprland / HyprYou</h3>

<img width="1366" height="768" alt="2025-12-24-221431_hyprshot" src="https://github.com/user-attachments/assets/1a85d767-9b49-489a-8e4c-7ee4a12ff17c" />


# What's Nirconium?
A custom arch-bootc image built for container usage/development and day-to-day usage, making use of [Hyprland](https://hypr.land) and [HyprYou](https://github.com/koeqaife/hyprland-material-you) to provide a usable OOTB TWM experience without sacrificing on looks.


# How can I use this?
At the moment, only rebasing is supported. Rebasing has been highly untested, however, so please report any issues rebasing.
Use the following command on any Fedora or Fedora based system that supports `bootc`:
```
sudo bootc switch ghcr.io/nirconium-dev/nirconium
```
...and you'll be on your (jolly) way!


# Can I customize this?
Absolutely! Although we've worked to provide good defaults OOTB, you can still customize the looks to your liking.


# Features

- Based on CachyOS/Arch with bootc support

- Hyprland, a tiling window manager that doesnt sacrifice on looks

- HyprYou, a customizable shell for Hyprland that uses the [Material 3 Design](m3.material.io) language whereever possible

- CachyOS-v3 kernel with v3 cpu optimizations and the Bore scheduler

- Foot terminal for a blazing-fast experience along with starship for looks

- Flatpak/AppImage support OOTB with Bazaar/Warehouse (software store, flatpak manager) and Gear Lever (AppImage manager)

- Distrobox and Podman for containerization, along with DistroShelf

- Zed, a high-performance rust-based IDE for code editing


# Nirconium is a stupid name. Why Nirconium?
My hatred for a specific wax baby inspired the name.


# Notice
This OS is only compatible and intended for desktop PCs with AMD/Intel graphics, and has optimizations for [V3 cpus](https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels). An image with NVIDIA drivers OOTB is in the works.


# Contact
Developers can currently most easily be reached in the [Zirconium Discord](https://discord.gg/mmgNQpxwhW) or the [Bootcrew Discord](https://discord.gg/52Qcb4x2w3).

Nirconium is headed by certifiedfooliolol/'somebody once told me'/shartmunk.

Special thank yous to [Tulip](https://github.com/tulilirockz) and [Xenia Meraki](https://github.com/XeniaMeraki) for general help/support
