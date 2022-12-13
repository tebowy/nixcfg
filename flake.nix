{
  description = "You new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # FIXME update it after 2022-11-15
    hardware.url = "github:nixos/nixos-hardware/419dcc0ec767803182ed01a326f134230578bf60";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";
    flake-utils.url = "github:numtide/flake-utils";
    # nur.url = github:nix-community/NUR;
    # yi-pkg.url = github:yilozt/nurpkg;
  };

  outputs = {
    nixpkgs,
    home-manager,
    # nur,
    # yi-pkg,
    ...
  } @ inputs: rec {
    # This instantiates nixpkgs for each system listed
    # Allowing you to configure it (e.g. allowUnfree)
    # Our configurations will use these instances

    overlays = import ./overlays;
    
    legacyPackages = nixpkgs.lib.genAttrs ["x86_64-linux" "x86_64-darwin"] (
      system:
        import inputs.nixpkgs {
          inherit system;
          # NOTE: Using `nixpkgs.config` in your NixOS config won't work
          # Instead, you should set nixpkgs configs here
          # (https://nixos.org/manual/nixpkgs/stable/#idm140737322551056)
          config.allowUnfree = true;
        }
    );

    nixosConfigurations = {
      nara = nixpkgs.lib.nixosSystem {
        pkgs = legacyPackages.x86_64-linux;
        specialArgs = {inherit inputs;}; # Pass flake inputs to our config
        modules = [
          ./nixos/configuration.nix
          # ./nixos/resolved.nix
          ./nixos/desktop.nix
          ./nixos/steam.nix
          ./nixos/pkgs.nix
          ./nixos/hw.nix
          ./nixos/hardware-configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "anon@nara" = home-manager.lib.homeManagerConfiguration {
        pkgs = legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;}; # Pass flake inputs to our config
        modules = [
          ./home-manager/home.nix
          ./home-manager/linux.nix
          ./home-manager/gnome.nix
          # ./home-manager/armcord.nix
        ];
      };
    };
  };
}
