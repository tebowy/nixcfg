{
  description = "You new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    hardware.url = "github:nixos/nixos-hardware";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";
    flake-utils.url = "github:numtide/flake-utils";
    nur.url = github:nix-community/NUR;
    # yi-pkg.url = github:yilozt/nurpkg;
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nix-index-database,
    nur,
    # yi-pkg,
    ...
  } @ inputs: rec {
    # This instantiates nixpkgs for each system listed
    # Allowing you to configure it (e.g. allowUnfree)
    # Our configurations will use these instances

    overlays = import ./overlays/default.nix;

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
    legacyPackagesStable = nixpkgs-stable.lib.genAttrs ["x86_64-linux" "x86_64-darwin"] (
      system:
        import inputs.nixpkgs-stable {
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
          # ./nixos/configuration.nix
          ./nixos/nara-configuration.nix
        ];
      };
      albert = nixpkgs-stable.lib.nixosSystem {
        pkgs = legacyPackagesStable.x86_64-linux;
        specialArgs = {inherit inputs;}; # Pass flake inputs to our config
        # > Our main nixos configuration file <
        modules = [
          ./nixos/albert-configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "anon@nara" = home-manager.lib.homeManagerConfiguration {
        pkgs = legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;}; # Pass flake inputs to our config
        modules = [
          ./home-manager/home.nix
          ./home-manager/gui-pkgs.nix
          ./home-manager/gnome.nix
          ./home-manager/armcord.nix
        ];
      };
      "anon@albert" = home-manager.lib.homeManagerConfiguration {
        pkgs = legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;}; # Pass flake inputs to our config
        modules = [
          ./home-manager/home.nix
          ./home-manager/albert.nix
          ./home-manager/rclone.nix
        ];
      };
    };
  };
}
