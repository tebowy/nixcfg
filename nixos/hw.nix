{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
  ];

  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.host.enable = true;

  hardware.openrazer.enable = true;
  hardware.wirelessRegulatoryDatabase = true;
  services.hardware.openrgb.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  hardware.cpu.amd.updateMicrocode = true;
  services.auto-cpufreq.enable = true;
  services.power-profiles-daemon.enable = true;
  # iOS Tethering
  services.usbmuxd.enable = true;
  networking.wireless.extraConfig = "country=PL";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 0;
  };
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;

  services.fstrim.enable = true;
  # Enable swap on luks
  boot.initrd.luks.devices."luks-18b75f9a-66b9-46d9-b382-eec18613fd61".device = "/dev/disk/by-uuid/18b75f9a-66b9-46d9-b382-eec18613fd61";
  boot.initrd.luks.devices."luks-18b75f9a-66b9-46d9-b382-eec18613fd61".keyFile = "/crypto_keyfile.bin";

  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    wireplumber.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
