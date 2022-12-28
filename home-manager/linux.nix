{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: {
  home.packages = with pkgs; [
    #cope
    #mullvad
    #nix-du
    nix-tree
    #rocm-opencl-icd #opencl amd gcn
    appimage-run
    aspell
    # displaylink
    dxvk
    ethtool
    fzf
    git
    hdparm
    helix
    hunspell
    hunspellDicts.en_US
    iftop
    iotop
    iproute2
    killall
    linux-wifi-hotspot
    lshw
    maigret
    mat2
    nfs-utils
    nmon
    ntfs3g
    opendrop
    openjdk8
    pciutils
    powertop
    rpm
    solaar
    tailscale
    usbutils
    vulkan-tools
    # woeusb-ng
    exfatprogs

    #GUI
    wine
    winetricks
    lutris
    # bitwig-studio
    #fractal
    fractal-next
    vivaldi
    vivaldi-widevine
    # microsoft-edge
    brave
    audacity
    mpv
    mpvScripts.youtube-quality
    transmission-gtk
    transmission-remote-gtk
    woeusb
    parsec-bin
    # woeusb-ng
    reaper

    #TODO move those to gnome.nix
    # gnome-builder
    gnome.dconf-editor
    gnome.ghex
    gnome.gnome-boxes
    gnome.gnome-nettool
    gnome.gnome-sound-recorder
    gnome.gnome-tweaks
    gnome.gnome-terminal
    gnome.vinagre
    blackbox-terminal # A beautiful GTK4 terminal
    # yi-pkg.system-monitoring-center
  ];

  programs.nix-index.enable = true;

  programs.firefox = {
    enable = true;
    # enableGnomeExtensions = true;
    package = pkgs.firefox.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      cfg = {
        # Gnome shell native connector
        enableGnomeExtensions = true;
        # Tridactyl native connector
        enableTridactylNative = true;
      };
    };
  };
}
