{pkgs, ...}: let
  nixify =
    pkgs.writeShellScriptBin "nixify"
    ''
      if [ ! -e flake.nix ];
      then
        nix flake new -t github:alex007sirois/nix-config .;
        direnv allow;
      elif [ ! -e .envrc ];
      then
        echo 'use flake' > .envrc;
        direnv allow;
      fi
    '';
in {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global.hide_env_diff = true;
  };

  home.packages = [nixify];
}
