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
  home.packages = with extensions;
  with pkgs; [
    # gnome-builder
    gnome.dconf-editor
    gnome.ghex
    gnome.gnome-boxes
    gnome.gnome-nettool
    # gnome.polari
    gnome.gnome-sound-recorder
    gnome.gnome-tweaks
    gnome.vinagre
    blackbox-terminal # A beautiful GTK4 terminal

    gnomeExtensions.user-themes
    palenight-theme
  ];
  # home.sessionVariables.GTK_THEME = "palenight";
  gtk = {
    enable = true;
    iconTheme = {
      name = "la-capitaine-icon-theme";
      package = pkgs.la-capitaine-icon-theme;
    };

    # theme = {
    #   name = "palenight";
    #   package = pkgs.palenight-theme;
    # };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/dune-l.svg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/dune-d.svg";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    # "org/gnome/shell/extensions/user-theme" = {
    #   name = "palenight";
    # };
  };
}
