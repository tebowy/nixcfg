{
  pkgs,
  lib,
  ...
}: let
  # Extensions list
  extensions = with pkgs.gnomeExtensions; [
    #eclipse
    #focusli
    #obmin
    #scrovol
    #slinger
    #wg-indicator
    #wireguard-indicator
    #wireguard-indicator-2
    aylurs-widgets
    caffeine
    # captivate
    ddterm
    espresso
    forge
    gtk-title-bar
    hot-edge
    # impatience
    just-perfection
    # kitsch
    # shortcuts
    # switcher
    # topiconsfix
    unite
    material-shell
    pop-shell
  ];
in {
  home.packages = extensions;
  # TODO figure this out
  # home.packages = with pkgs; [
  #   gnome-builder
  #   gnome.dconf-editor
  #   gnome.ghex
  #   gnome.gnome-boxes
  #   gnome.gnome-nettool
  #   gnome.gnome-sound-recorder
  #   gnome.gnome-tweaks
  #   gnome.gnome-terminal
  #   gnome.vinagre
  #  ];
}
