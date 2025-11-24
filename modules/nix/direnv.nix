{
  flake.modules = {
    homeManager.nix = {pkgs, ...}: let
      direnv-run =
        pkgs.writeShellScriptBin "direnv-run"
        ''
          export DIRENV_LOG_FORMAT=""
          ${pkgs.direnv}/bin/direnv exec . ${pkgs.zsh}/bin/zsh -i -c "$*"
        '';
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

      home.packages = [
        direnv-run
        nixify
      ];
    };
    nixos.nix = {
      nix.extraOptions = ''
        keep-outputs = true
        keep-derivations = true
      '';
    };
  };
}
