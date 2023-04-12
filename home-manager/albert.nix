{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    transmission

  ];
}
