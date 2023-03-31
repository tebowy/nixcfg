{
  config,
  pkgs,
  ...
}: {
  # TODO check
  services.nscd.enableNsncd = true;
  services.localtimed.enable = true;
  # Select internationalisation properties.
  i18n = {
    supportedLocales = ["all"];
    extraLocaleSettings = {
      LC_TIME = "pl_PL.utf8";
    };
  };
  # Configure keymap in X11
  services.xserver = {
    layout = "pl";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "pl3";

  programs.command-not-found.enable = false;
  environment.variables.EDITOR = "nvim";

  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
  virtualisation.podman.dockerSocket.enable = true;
  # services.tailscale.enable = true;
  virtualisation.appvm = {
    enable = true;
    user = "anon";
  };
  networking.networkmanager.enable = true;
}
