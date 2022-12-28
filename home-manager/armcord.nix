{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (armcord.overrideAttrs (prev: {
      version = "3.1.3";
      src = pkgs.fetchurl {
        url = "https://github.com/ArmCord/ArmCord/releases/download/v3.1.3/ArmCord_3.1.3_amd64.deb";
        sha256 = "sha256-jwpjKpTU9Z6h0pYEGBIflWk42v83eOGpjCVPjT4N4cs=";
      };
    }))
  ];
}
