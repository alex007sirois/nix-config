{...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh.initExtra = "
nixify() {
  if [ ! -e flake.nix ]; then
    nix flake new -t github:alex007sirois/nix-config .
  elif [ ! -e .envrc ]; then
    echo 'use flake' > .envrc
    direnv allow
  fi
  $EDITOR flake.nix
}";
}
