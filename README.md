<p align="center">
  <img src="https://raw.githubusercontent.com/tartaria-dev/.github/refs/heads/main/142.svg" alt="Tartaria Logo" width="300">
</p>

<h3 align="center">/tɑːrˈtɛəriə/</h3>
<h3 align="center">Arch Bootc / Hyprland / HyprYou</h3>

<img width="1366" height="768" alt="2025-12-24-221431_hyprshot" src="https://github.com/user-attachments/assets/1a85d767-9b49-489a-8e4c-7ee4a12ff17c" />


# What's Tartaria?
A custom arch-bootc image built for container usage, general development, and day-to-day usage, making use of the [Hyprland](https://hypr.land) compositor and the [HyprYou](https://github.com/koeqaife/hyprland-material-you) desktop shell to provide a usable TWM experience OOTB that does not sacrifice on looks.


# How can I use this?
At the moment, only rebasing is supported. Fair warning, rebasing has been highly untested, although stock Fedora Silverblue has worked best in my experience as a base.
Use the following command on any Fedora based system that supports `bootc`:
```
sudo bootc switch ghcr.io/tartaria-dev/tartaria
```
...and you'll be on your (jolly) way!


# Can I customize this?
Absolutely! Although we've worked to provide good defaults OOTB, you can still customize the looks to your liking.


# Features

- Based on CachyOS/Arch with bootc support

- Hyprland, a tiling window manager that doesnt sacrifice on looks

- HyprYou, a customizable shell for Hyprland that uses the [Material 3 Design](m3.material.io) language whereever possible

- CachyOS-v3 kernel with v3 cpu optimizations and the Bore scheduler

- Foot terminal for a blazing-fast TUI experience along with Oh-My-Posh for looks

- Flatpak/AppImage support OOTB with Bazaar/Warehouse (software store, flatpak manager) and Gear Lever (AppImage manager)

- Distrobox and Podman for containerization, along with DistroShelf (GUI container manager)

- Zed, a high-performance rust-based IDE for code editing, supports Devpod (not included)

- Zen, a beautiful Firefox-based browser with vertical tabs and a design similar to that of Arc Browser

- ZRAM enabled by default (can't be running out of RAM now, can we)


# Notice
This OS is only compatible and intended for desktop PCs with AMD/Intel graphics, and has optimizations for [V3 cpus](https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels). An image with NVIDIA drivers OOTB is in the works.


# Contact
Tartaria is headed by me, certifiedfooliolol. You may contact me via my Discord handle, `shartmunk`. Creative username, I know.

Many thanks to the [Bootcrew Discord](https://discord.gg/52Qcb4x2w3) for general help/support!


# Literally any other name would've been better. Why?
My pure, unadulterated hatred for a specific wax baby inspired the name. God, I hate that baby.
