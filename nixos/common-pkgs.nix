{
  config,
  pkgs,
  ...
}: {
  programs.mtr.enable = true;
  programs.htop.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    git
    iw
    fishPlugins.fzf-fish
    fishPlugins.hydro
  ];
}
