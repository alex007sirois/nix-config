{lib, ...}:
with builtins;
with lib.attrsets; let
  fileAttrs = lib.attrsets.filterAttrs (name: value: name != "default.nix" && value == "regular") (readDir ./.);
  files = mapAttrsToList (name: value: ./${name}) fileAttrs;
in {imports = files;}
