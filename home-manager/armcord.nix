{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    armcord
    discord
    (betterdiscord-installer.overrideAttrs (prev: {
      version = "1.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/BetterDiscord/Installer/releases/download/v1.2.0/BetterDiscord-Linux.AppImage";
        sha256 = "sha256-oXrx+bQgVf8Pf70M4saXR2Kb2QmSMIGKhBDrTsN/CKU=";
      };
    }))
  ];
}
