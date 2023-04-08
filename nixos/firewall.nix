{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  networking.firewall = {
    checkReversePath = "loose";
    trustedInterfaces = ["tailscale0"];
    allowedTCPPorts = [
      #plex
      32400

      #qbit
      14831
      14832
    ];
  };
}
