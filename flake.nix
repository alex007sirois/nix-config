{
  description = "Nix home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    disko,
    ...
  } @ inputs: let
    inherit (self.outputs) overlays;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystemsPkgs = nixpkgsArgs: func: forAllSystems (system: func (import nixpkgs {inherit system;} // nixpkgsArgs));
    home-manager-special-args = {inherit nix-index-database;};
    nixos-special-args = {inherit inputs disko overlays home-manager home-manager-special-args;};
    buildNixosSystem = machine:
      nixpkgs.lib.nixosSystem {
        specialArgs = nixos-special-args;
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
