{
  inputs,
  lib,
  config,
  pkgs,
  # yi-pkg,
  ...
}: {
  home.packages = with pkgs; [
    ## CLI
    # displaylink
    # woeusb-ng
    # cope
    # mullvad
    # nix-du
    # rocm-opencl-icd #opencl amd gcn
    appimage-run
    aspell
    distrobox
    dxvk
    ethtool
    exfatprogs
    fzf
    git
    hdparm
    helix
    hunspell
    hunspellDicts.en_US
    iftop
    iotop
    iproute2
    killall
    linux-wifi-hotspot
    lshw
    maigret
    mat2
    nfs-utils
    nix-tree
    nmon
    ntfs3g
    opendrop
    openjdk8
    pciutils
    powertop
    rpm
    solaar
    # tailscale
    usbutils
    vulkan-tools

    # la-capitaine-icon-theme
    # yi-pkg.system-monitoring-center
  ];

  programs.nix-index.enable = true;
}
