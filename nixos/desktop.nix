{
  config,
  pkgs,
  ...
}: {
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs._1password.enable = true;
  programs._1password-gui.enable = true;
  programs._1password-gui.polkitPolicyOwners = ["anon"];
  services.gnome.gnome-browser-connector.enable = true;

  services.flatpak.enable = true;
  services.packagekit.enable = true;
  xdg.portal.enable = true;

  #xdg.portal.gtkUsePortal = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #programs.xwayland.enable = true;

  environment.variables.WEBKIT_DISABLE_COMPOSITING_MODE = "1";

  #programs.evolution = {
  #  enable = true;
  #  plugins = [pkgs.evolution-ews];
  #};
  boot.plymouth.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # environment.variables.LANG = "en_IE.UTF-8";
  # services.xserver.displayManager.setupCommands = "export LANG=en_IE.UTF-8";
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkbOptions = "parens:swap_brackets,ctrl:nocaps";
  services.gnome.gnome-remote-desktop.enable = true;
  services.gnome.sushi.enable = true;
  services.xserver.libinput.enable = true;

  fonts.enableDefaultFonts = true;
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    dejavu_fonts
    sudo-font
    hack-font
    gubbi-font
    navilu-font
    envypn-font
    ibm-plex
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji-blob-bin
    signwriting
    unifont_upper
    fira-mono
    fira-code
    fira-code-symbols
    fantasque-sans-mono
  ];

  services.avahi = {
    openFirewall = true;
    nssmdns = true; # Allows software to use Avahi to resolve.
    enable = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };
}
