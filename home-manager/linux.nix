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
    soundconverter
    brave
    fractal-next
    github-desktop
    irccloud
    logseq
    lutris
    srain
    pscircle
    mpv
    mpvScripts.youtube-quality
    parsec-bin
    transmission-gtk
    transmission-remote-gtk
    vivaldi
    vivaldi-widevine
    wine
    winetricks
    woeusb
    librewolf

    la-capitaine-icon-theme
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
