{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: {
  home.packages = with pkgs; [
    # displaylink
    # woeusb-ng
    #cope
    #mullvad
    #nix-du
    #rocm-opencl-icd #opencl amd gcn
    appimage-run
    aspell
    dxvk
    ethtool
    exfatprogs
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
    nix-tree
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

    #GUI
    # bitwig-studio
    # microsoft-edge
    # woeusb-ng
    #fractal
    audacity
    brave
    fractal-next
    github-desktop
    logseq
    lutris
    mpv
    mpvScripts.youtube-quality
    parsec-bin
    reaper
    # (reaper.overrideAttrs (prev: {
    #   version = "6.73";
    #   src = pkgs.fetchurl {
    #     sha256 = "sha256-B/zDcW43ChhnAnGL+UEAt/QChxxEpv+yMgO7WsUi84k=";
    #   };
    # }))
    transmission-gtk
    transmission-remote-gtk
    vivaldi
    vivaldi-widevine
    wine
    winetricks
    woeusb

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
