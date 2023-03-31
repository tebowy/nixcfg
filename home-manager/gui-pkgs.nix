{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: {
  # Add stuff for your user as you see fit:
  # home.packages = with pkgs; [ steam ];
  home.packages = with pkgs; [
    #gui
    font-config-info
    font-manager
    anydesk
    obsidian
    f3d
    barrier
    bottles
    celluloid
    diffpdf
    drawing
    easyeffects
    electrum
    fusee-interfacee-tk
    fusee-launcher
    glava
    gitkraken
    # helvum
    input-remapper
    jamesdsp
    japa
    libdrm
    libguestfs
    libinput
    libreoffice
    ltunify
    meld
    mullvad-vpn
    mupdf
    networkmanagerapplet
    nicotine-plus
    # ocenaudio
    plex
    polychromatic
    qpwgraph
    razergenie
    remote-touchpad
    sublime-merge
    sublime4
    virt-manager
    vlc
    vscodium-fhs
    zathura
    zeal
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
  ];

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
