{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      python3
      python3Packages.pipx
    ];

  home.sessionPath = [ "$HOME/.local/bin" ];
}
