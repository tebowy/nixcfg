{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    protonup
    steam-run
  ];
  programs.steam.enable = true;
  environment.sessionVariables = rec {
    # Steam needs this to find Proton-GE
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    # note: this doesn't replace PATH, it just adds this to it
    PATH = [
      "\${XDG_BIN_HOME}"
    ];
  };
}
