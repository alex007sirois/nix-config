{ inputs, ... }:
{
  flake-file.inputs.nix-index-database = {
    url = "github:Mic92/nix-index-database";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.nix = {
    imports = [ inputs.nix-index-database.homeModules.nix-index ];
    programs.nix-index-database.comma.enable = true;
  };
}
