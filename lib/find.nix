{lib, ...}:
with builtins;
with lib.strings;
with lib.attrsets; rec {
  findModules = {
    path,
    ignores ? [],
  }: let
    dir = removeAttrs (readDir path) ignores;
    fileAttrs = filterAttrs (name: value: (hasSuffix ".nix" name) && (value == "regular")) dir;
    files = mapAttrsToList (name: value: /${path}/${name}) fileAttrs;
  in
    files;

  importModules = {
    path,
    ignores ? [],
  } @ inputs: {imports = findModules inputs;};

  importByName = {
    path,
    ignores ? [],
    args ? null,
  }: let
    modules = findModules {inherit path ignores;};
    nameFunc = module: removeSuffix ".nix" (baseNameOf module);
    valueFunc = module: let
      imported = import module;
    in
      if args == null
      then imported
      else imported;
  in
    listToAttrs (map (m: nameValuePair (nameFunc m) (valueFunc m)) modules);

  findLocalModules = path:
    findModules {
      inherit path;
      ignores = ["default.nix"];
    };
  importLocalModules = path:
    importModules {
      inherit path;
      ignores = ["default.nix"];
    };
}
