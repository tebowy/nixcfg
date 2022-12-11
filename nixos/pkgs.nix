{
  config,
  pkgs,
  ...
}: {
  programs.mtr.enable = true;
  programs.htop.enable = true;
  # programs.fish.enable = true;
  programs.neovim.enable = true;
  programs.neovim.vimAlias = true;
  programs.neovim.viAlias = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.configure = {
    customRC = ''
      " here your custom configuration goes!
    '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      # loaded on launch
      start = [vim-nix];
      # manually loadable by calling `:packadd $plugin-name`
      opt = [];
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    git

    fishPlugins.fzf-fish
    fishPlugins.hydro
  ];
}
