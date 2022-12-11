{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mpfr
    libmpc
    gmp
    e2fsprogs
    ninja
    qemu_full
    qemu_kvm

    qemu-utils
    rsync
    unzip
    texinfo
    ccache
    gcc
  ];
}
