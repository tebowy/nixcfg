# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  nix-colors,

  ...
}: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];

  home = {
    username = "anon";
    homeDirectory = "/home/anon";
  };
  # Add stuff for your user as you see fit:
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
    # ocenaudio
    #armcord
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

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.fish = {
    enable = true;
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

  #colorScheme = nix-colors.colorSchemes.tomorrow-night;



  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
}
