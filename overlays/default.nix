{lib, ...}:
with builtins;
with lib.strings;
with lib.attrsets; let
  overlayFiles = removeAttrs (readDir ./.) ["default.nix"];
  overlays =
    mapAttrs' (file: _: {
      name = removeSuffix ".nix" file;
      value = import ./${file};
    })
    overlayFiles;
  all = attrValues overlays;
in
  overlays // {inherit all;}
