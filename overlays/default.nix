{lib, ...} @ args: let
  path = ./.;
  ignores = ["default.nix"];
  overlays = lib.find.importByName {inherit args path ignores;};
  all = lib.attrsets.attrValues overlays;
in
  overlays // {inherit all;}
