{outputs, ...}: let
  inherit (outputs) lib;
  overlays = lib.find.importByName {
    path = ./.;
    ignores = ["default.nix"];
  };
  all = lib.attrsets.attrValues overlays;
in
  overlays // {inherit all;}
