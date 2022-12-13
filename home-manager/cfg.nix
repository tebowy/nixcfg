{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: { # Add stuff for your user as you see fit:
  # home.packages = with pkgs; [ steam ];
  home.packages = with pkgs; [
    #cli
    alejandra
    #ant
    binwalk
    cowsay
    #cvs
    du-dust
    duf
    fd
    fdupes
    figlet
    file
    fish
    gti
    ipcalc
    ldns
    lsof
    #maven
    ncdu
    nmap
    platinum-searcher
    ripgrep
    ripgrep-all
    silver-searcher
    tree
    wget
    whois
    ghostscript
    wireguard-tools
    wg-netmanager
    yt-dlp
    packer
    ntfs3g
    # exfat

    nix-index
    flyctl
    # fishPlugins.fzf-fish
    # fishPlugins.hydro

    bintools-unwrapped

    #gui
    font-config-info
    font-manager
    # firefox

    #####x
    anydesk
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

    helvum
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
    # transmission-gtk
    # transmission-remote-gtk
    virt-manager
    vlc
    vscodium-fhs
    zathura
    zeal
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.tmux.enable = true;
  programs.tmux.shortcut = "a";

  programs.gh.enable = true;

    programs.fish = {
    enable = true;
    interactiveShellInit = "
    set --export LANG en_IE.UTF-8
    source /home/anon/.config/op/plugins.sh
    ";
    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro;
      }
    ];
  };

}