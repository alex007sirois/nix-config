{
  description = "Nix home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-index-database,
    ...
  } @ inputs: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = false;
      };
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          just
        ];
      };
    });

    nixosConfigurations = {
      "laptop-doo-asirois-nix" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/doo-laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = import ./home-manager/doo-laptop.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      "alex@DESKTOP-9FIKJ0V" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./home-manager/home-desktop.nix
          nix-index-database.hmModules.nix-index
        ];
      };
    };

    templates.default = {
      path = ./templates/flake;
      description = "Basic flake direnv template.";
    };
  };
}
