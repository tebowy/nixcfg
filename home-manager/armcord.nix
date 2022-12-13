{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (armcord.overrideAttrs (prev: {
      version = "3.1.4";
      src = pkgs.fetchurl {
        url = "https://github.com/ArmCord/ArmCord/releases/download/v3.1.4/ArmCord_3.1.4_amd64.deb";
        sha256 = "sha256-B/zDcW43ChhnAnGL+UEAt/QChxxEpv+yMgO7WsUi84k=";
      };
    }))
  ];
}
