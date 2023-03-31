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
  allowedTCPPorts =  [ 14831 14832 ];
};
  }
