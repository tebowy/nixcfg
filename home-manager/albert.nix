{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: {
  home.packages = with pkgs; [
    transmission

  ];
}
