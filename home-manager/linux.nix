{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: {
  home.packages = with pkgs; [
    ## CLI
    # displaylink
    # woeusb-ng
    # cope
    # mullvad
    # nix-du
    # rocm-opencl-icd #opencl amd gcn
    appimage-run
    aspell
    distrobox
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

    ## GUI
    # bitwig-studio
    # microsoft-edge
    # woeusb-ng
    # fractal
    audacity
    brave
    # fractal-next
    github-desktop
    irccloud
    librewolf
    logseq
    lutris
    mpv
    mpvScripts.youtube-quality
    # parsec-bin
    pscircle
    p7zip
    soundconverter
    srain
    transmission-gtk
    transmission-remote-gtk
    vivaldi
    widevine-cdm
    wine
    winetricks
    woeusb

    # la-capitaine-icon-theme
    # yi-pkg.system-monitoring-center
  ];

  programs.nix-index.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      cfg = {
        enableGnomeExtensions = true;
        enableTridactylNative = true;
      };
    };
  };
}
