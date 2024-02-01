{
  description = "Nix home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystemsPkgs = nixpkgsArgs: func: forAllSystems (system: func (import nixpkgs {inherit system;} // nixpkgsArgs));
    buildNixosSystem = machine:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit (outputs) overlays;
          inherit home-manager inputs;
        };
        modules = [machine];
      };
    buildNixosSystems = builtins.mapAttrs (hostname: machine: buildNixosSystem machine);
  in {
    overlays = import ./overlays {inherit (nixpkgs) lib;};

    devShells = forAllSystemsPkgs {} (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          just
          gitlint
          lefthook
          nil
        ];
      };
    });

    nixosConfigurations = buildNixosSystems {
      "laptop-doo-asirois-nix" = ./nixos/doo-laptop;
      "home-desktop-asirois-nix" = ./nixos/home-desktop;
    };

    templates.default = {
      path = ./templates/flake;
      description = "Basic flake direnv template.";
    };
  };
}
