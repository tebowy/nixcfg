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
};
  }
