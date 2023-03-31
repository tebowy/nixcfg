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
    #cli
    alejandra
    binwalk
    cowsay
    common-updater-scripts
    du-dust
    duf
    exa
    fd
    fdupes
    figlet
    file
    fish
    gti
    ipcalc
    ldns
    lsof
    ncdu
    nmap
    platinum-searcher
    ripgrep
    ripgrep-all
    silver-searcher
    tree
    jq
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
    bintools-unwrapped
    megacmd
    megatools
    neofetch
    rsync

    rclone
    qbittorrent-nox
    sabnzbd
    sonarr
    radarr
    prowlarr
    bazarr
    lidarr
    readarr

  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.tmux.enable = true;
  programs.tmux.shortcut = "a";
  programs.gh.enable = true;

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      statix
    ];
  };
  programs.starship.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = "
    # set --export LANG en_IE.UTF-8
    source /home/anon/.config/op/plugins.sh
    ";

    shellAbbrs = {
      ls = "exa";
      l = "exa -la";
      ll = "exa -l";
      snrs = "sudo nixos-rebuild --flake . switch";
      hms = "home-manager --flake . switch";
      v = "nvim";
    };

    functions = {
      starship_transient_rprompt_func = "starship module time";
      # onEvent = "fish_command_not_found";
    };
    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
      # {
      #   name = "hydro";
      #   src = pkgs.fishPlugins.hydro;
      # }
    ];
  };
}
