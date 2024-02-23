{...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.shellAliases = {
    nixify = "if [ ! -e flake.nix ]; then nix flake new -t github:alex007sirois/nix-config .; direnv allow; elif [ ! -e .envrc ]; then echo 'use flake' > .envrc; direnv allow; fi";
  };
}
