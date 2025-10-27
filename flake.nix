{
  description = "Nix home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.home-manager.follows = "home-manager";

    agenix-rekey.url = "github:oddlama/agenix-rekey";
    agenix-rekey.inputs.nixpkgs.follows = "nixpkgs";

    tactical-rmm.url = "git+ssh://git@bitbucket.org/amotus/tactical-rmm-nix.git";
    tactical-rmm.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    helix,
    flake-utils,
    agenix-rekey,
    ...
  } @ inputs: let
    inherit (self) outputs;
    buildNixosSystem = machine:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [machine];
      };
    buildNixosSystems = builtins.mapAttrs (_hostname: machine: buildNixosSystem machine);
    buildFlake = system: let
      pkgs = nixpkgs.legacyPackages.${system}.extend agenix-rekey.overlays.default;
    in {
      formatter = pkgs.alejandra;
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.agenix-rekey
          pkgs.rage
          pkgs.just
          pkgs.nh
          pkgs.gitlint
          pkgs.lefthook
          pkgs.nil
        ];
      };
    };
    systemFlake = flake-utils.lib.eachDefaultSystem buildFlake;
  in
    systemFlake
    // {
      overlays = import ./overlays {
        inherit (outputs) lib;
        inherit helix;
      };
      nixos = import ./nixos;
      home-manager = import ./home-manager;
      lib = import ./lib {inherit (nixpkgs) lib;};

      nixosConfigurations = buildNixosSystems {
        "laptop-doo-asirois-nix" = ./hosts/doo-laptop;
        "home-desktop-asirois-nix" = ./hosts/home-desktop;
      };

      agenix-rekey = agenix-rekey.configure {
        userFlake = self;
        nixosConfigurations = self.nixosConfigurations;
      };

      templates = {
        default = {
          path = ./templates/flake;
          description = "Basic flake direnv template.";
        };
      };
    };
}
